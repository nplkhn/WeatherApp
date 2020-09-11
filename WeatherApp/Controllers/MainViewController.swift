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
    weak var weakSelf: MainViewController? = nil
    
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
        
        setupLoadingView()
        
        locationManager.requestWhenInUseAuthorization()
        weakSelf = self
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.requestLocation()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.activityIndicator.center = self.view.center
    }
    
    func setupLoadingView() {
        loadingView.backgroundColor = .lightGray
        loadingView.addSubview(activityIndicator)
        activityIndicator.color = .white
        activityIndicator.center = self.view.center
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(loadingView)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: loadingView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: loadingView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: loadingView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: loadingView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0),
        ])
        
        activityIndicator.startAnimating()
    }
    
}

extension MainViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinates: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        weakSelf!.coords = coordinates
        
        weakSelf!.viewControllers = [self.currentWeatherVC, self.weekWeatherVC]
        weakSelf!.viewWillAppear(true)
        weakSelf!.activityIndicator.stopAnimating()
        weakSelf!.loadingView.removeFromSuperview()
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func locationManagerDidPauseLocationUpdates(_ manager: CLLocationManager) {
        print("paused location updates")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
