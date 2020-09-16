//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Никита Плахин on 9/16/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager:NSObject, CLLocationManagerDelegate {
    
    private let locationManager: CLLocationManager = CLLocationManager()
    private var coordinated: Coordinates?
    private var completionHandler: ((Coordinates) -> Void)?
    
    override init() {
        super.init()
        configure()
    }
    
    private func configure() {
        locationManager.delegate = self
        
    }
    
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func requestLocation(completionHandler: @escaping (Coordinates) -> Void) {
        self.completionHandler = completionHandler
        locationManager.requestLocation()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = manager.location {
            self.completionHandler!(Coordinates(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
