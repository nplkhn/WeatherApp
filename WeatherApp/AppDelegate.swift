//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Никита Плахин on 9/3/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var locationManager = LocationManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        

        
        let mainVC = MainViewController()
        let navVC = UINavigationController(rootViewController: mainVC)
        
        locationManager.requestPermission()
        locationManager.requestLocation() { (coordinates) in
            mainVC.coords = coordinates
        }
        
        window?.rootViewController = navVC
        
        window?.makeKeyAndVisible()
        
        return true
    }

}
