//
//  ViewController.swift
//  WeatherApp
//
//  Created by Никита Плахин on 9/3/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    private var weatherViewModel: CurrentWeatherViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let activityIndicator = UIActivityIndicatorView(style: .large)
        
        activityIndicator.color = .white
        activityIndicator.center = self.view.center
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        

        
        self.locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.requestLocation()
        }
    
        
    }


}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        let parser = weatherDataParser()
        parser.parseCurrentWeather(url: "https://api.openweathermap.org/data/2.5/weather?lat=\(locValue.latitude)&lon=\(locValue.longitude)&appid=\(apiKey)") { (weatherData) in
            self.weatherViewModel = CurrentWeatherViewModel(currentWeather: weatherData)
            
            if let weather = self.weatherViewModel {
                DispatchQueue.main.async {
                                    let weatherView = CurrentWeatherView(frame: self.view.bounds)
                    weatherView.weather = weather
                    self.view.addSubview(weatherView)
                }

            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

