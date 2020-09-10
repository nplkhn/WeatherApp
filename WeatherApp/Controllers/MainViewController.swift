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
    
    private var coords: CLLocationCoordinate2D = CLLocationCoordinate2D()
    private var currentWeatherVC: CurrentWeatherViewController {
        let cwvc = CurrentWeatherViewController(coordinates: coords)
        let tabBarItem = UITabBarItem(title: "Today", image: UIImage(systemName: "sun.min")!, selectedImage: UIImage(systemName: "sun.min.fill")!)
        tabBarItem.tag = 0
        cwvc.tabBarItem = tabBarItem
        return cwvc
    }
    private var weekWeatherVC: WeekWeatherViewController {
        let wwvc = WeekWeatherViewController(coordinates: coords)
        let navVC = UINavigationController(rootViewController: wwvc)
        navVC.setNavigationBarHidden(false, animated: false)
        let tabBarItem = UITabBarItem(title: "Forecast", image: UIImage(systemName: "cloud.sun.rain")!, selectedImage: UIImage(systemName: "cloud.sun.rain.fill")!)
        tabBarItem.tag = 1
        wwvc.tabBarItem = tabBarItem
        return wwvc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.requestLocation()
        }
        
//        self.navigationItem.title = "Today"
    }
    
}

extension MainViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinates: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        self.coords = coordinates
        
        self.viewControllers = [self.currentWeatherVC, self.weekWeatherVC]
        self.viewWillAppear(true)
        self.activityIndicator.stopAnimating()
        self.loadingView.removeFromSuperview()
        tabBar.isHidden = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
