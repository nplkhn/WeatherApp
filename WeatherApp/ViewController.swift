//
//  ViewController.swift
//  WeatherApp
//
//  Created by Никита Плахин on 9/3/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

import UIKit
import CoreLocation


let apiKey = "bcb8b5667d5b57bf338f17d31d0b0e1e"
let url: String = "api.openweathermap.org/data/2.5/weather?"
//lat={lat}&lon={lon}&appid=\(apiKey)

class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    private var weatherData: CurrentWeather?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .lightGray
        
        self.locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.requestLocation()
        }
        
//        let weatherURL = URL(string: url + "lat=")
    }


}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        let parser = weatherDataParser()
        parser.parseFeed(url: "https://api.openweathermap.org/data/2.5/weather?lat=\(locValue.latitude)&lon=\(locValue.longitude)&appid=\(apiKey)") { (weatherData) in
            self.weatherData = weatherData
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

