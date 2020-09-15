//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Никита Плахин on 9/4/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

import UIKit
import CoreLocation

class MainViewController: UITabBarController {
    
    private let locationManager = CLLocationManager()
    private let loadingView = UIView()
    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    private var coords: CLLocationCoordinate2D? {
        didSet {
            self.currentWeatherVC.coordinates = coords
            self.weekWeatherVC.coordinates = coords
        }
    }
    private var currentWeatherVC: CurrentWeatherViewController = CurrentWeatherViewController()
    private var weekWeatherVC: WeekWeatherViewController = WeekWeatherViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
        
        self.viewControllers = [self.currentWeatherVC, self.weekWeatherVC]
        
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.requestLocation()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setupViewControllers() {
        
        let currentTabBarItem = UITabBarItem(title: "Today", image: UIImage(systemName: "sun.min")!, selectedImage: UIImage(systemName: "sun.min.fill")!)
        currentWeatherVC.tabBarItem = currentTabBarItem
        
        let weekTabBarItem = UITabBarItem(title: "Forecast", image: UIImage(systemName: "cloud.sun.rain")!, selectedImage: UIImage(systemName: "cloud.sun.rain.fill")!)
        weekWeatherVC.tabBarItem = weekTabBarItem
    }
}

extension MainViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinates: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        self.coords = coordinates
    }
    
    func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) {
        print("paused location updates")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
