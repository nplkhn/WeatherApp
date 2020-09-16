//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Никита Плахин on 9/4/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    var coords: Coordinates? {
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

