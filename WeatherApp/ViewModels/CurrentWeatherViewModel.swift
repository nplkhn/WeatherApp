//
//  CurrentWeatherViewModel.swift
//  WeatherApp
//
//  Created by Никита Плахин on 9/4/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//


// MARK: refactor switches


import Foundation
import UIKit

class CurrentWeatherViewModel {
    
    private let currentWeather: CurrentWeather
    
    init(currentWeather: CurrentWeather) {
        self.currentWeather = currentWeather
    }
    
    public var weatherImage: UIImage {
        let date = Date()
        let sunrise = Date(timeIntervalSince1970: TimeInterval(currentWeather.sys.sunrise))
        let sunset = Date(timeIntervalSince1970: TimeInterval(Int(currentWeather.sys.sunset)))
        let currentHour = Calendar.current.component(.hour, from: date)
        let sunriseHour = Calendar.current.component(.hour, from: sunrise)
        let sunsetHour = Calendar.current.component(.hour, from: sunset)
        
        
        
        var resultImage: UIImage?
        let weatherId = currentWeather.weather[0].id
        
        if (200...232).contains(weatherId) {
            resultImage = UIImage(named: "storm-1")
        } else if weatherId == 511 || (600...602).contains(weatherId) || (620...622).contains(weatherId) {
            resultImage = UIImage(named: "snowy-2")
        } else if (502...504).contains(weatherId) || (520...531).contains(weatherId) {
            resultImage = UIImage(named: "storm-2")
        } else if (611...616).contains(weatherId) {
            resultImage = UIImage(named: "snowy-1")
        } else if (700...781).contains(weatherId) {
            resultImage = UIImage(named: "fog")
        } else if weatherId == 802 {
            resultImage = UIImage(named: "cloudy")
        } else {
            if (min(sunriseHour, sunsetHour)..<max(sunriseHour, sunsetHour)).contains(currentHour) {
                if (300...321).contains(weatherId) {
                    resultImage = UIImage(named: "rain-2-d")
                } else if (500...501).contains(weatherId) {
                    resultImage = UIImage(named: "rain-1-d")
                } else if weatherId == 800 {
                    resultImage = UIImage(named: "sun")
                } else if weatherId == 801 || (803...804).contains(weatherId) {
                    resultImage = UIImage(named: "cloudy-d")
                }
            } else {
                if (300...321).contains(weatherId) {
                    resultImage = UIImage(named: "rain-2-n")
                } else if (500...501).contains(weatherId) {
                    resultImage = UIImage(named: "rain-1-n")
                } else if weatherId == 800 {
                    resultImage = UIImage(named: "night")
                } else if weatherId == 801 || (803...804).contains(weatherId) {
                    resultImage = UIImage(named: "cloudy-n")
                }
            }
        }
        
        return resultImage ?? UIImage(systemName: "cloud")!
        
    }
    
    public var weatherType: String {
        return "\(currentWeather.weather[0].main)"
    }
    
    public var location: String {
        return "\(currentWeather.name), \(currentWeather.sys.country)"
    }
    
    public var generalInfo: String {
        return "\(temperature) | \(weatherType)"
    }
    
    public var temperature: String {
        return "\(Int(currentWeather.main.temp - 273.15)) ºC"
    }
    
    public var humidity: String {
        return "\(currentWeather.main.humidity)%"
    }
    
    public var pressure: String {
        return "\(currentWeather.main.pressure) hPa"
    }
    
    public var windSpeed: String {
        let speed = currentWeather.wind.speed * 3.6
        return String(format: "%.1f", speed) + " km/h"
    }
    
    public var feelsLike: String {
        return "\(currentWeather.main.feelsLike) ºC"
    }
    
    public var windDirection: String {
        switch currentWeather.wind.deg {
        case 330...360, 0..<30:
            return "N"
        case 30..<60:
            return "NE"
        case 60..<120:
            return "E"
        case 120..<150:
            return "SE"
        case 150..<210:
            return "S"
        case 210..<240:
            return "SW"
        case 240..<300:
            return "W"
        case 300..<330:
            return "NW"
        default:
            return ""
        }
    }
    
    public var sunrise: String {
        let date = Date(timeIntervalSince1970: TimeInterval(currentWeather.sys.sunrise))
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        
        return "\(hour):\(minute)"
    }
    
    public var sunset: String {
        let date = Date(timeIntervalSince1970: TimeInterval(currentWeather.sys.sunset))
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        
        return "\(hour):\(minute)"
    }
    
    public var sharedInfo: String {
        return """
        \(location), \(temperature), feels like \(feelsLike);
        Wind: \(windSpeed), \(windDirection).
        """
    }
    
}
