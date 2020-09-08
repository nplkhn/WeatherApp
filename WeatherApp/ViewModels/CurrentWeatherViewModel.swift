//
//  CurrentWeatherViewModel.swift
//  WeatherApp
//
//  Created by Никита Плахин on 9/4/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

import Foundation
import UIKit

class CurrentWeatherViewModel {
    
    private let currentWeather: CurrentWeather
    
    init(currentWeather: CurrentWeather) {
        self.currentWeather = currentWeather
    }
    
    public var weatherImage: UIImage {
        let date = Date()
        let calendar = Calendar.current
        let sunrise = Date(timeIntervalSince1970: TimeInterval(Int(currentWeather.sys.sunrise))), sunset = Date(timeIntervalSince1970: TimeInterval(Int(currentWeather.sys.sunset)))
        let hour = calendar.component(.hour, from: date)
        let sunriseHour = calendar.component(.hour, from: sunrise), sunsetHour = calendar.component(.hour, from: sunset)
        
        var resultImage = UIImage()
        
        
        
        switch hour {
        case sunriseHour..<sunsetHour:
            switch currentWeather.weather[0].id {
            case 200...232:
                resultImage = UIImage(named: "storm-1")!
            case 300...321:
                resultImage = UIImage(named: "rain-3")!
            case 500, 501:
                resultImage = UIImage(named: "rain-1")!
            case 511:
                resultImage = UIImage(named: "snowy-2")!
            case 502...504, 520...531:
                resultImage = UIImage(named: "storm-2")!
            case 600...602, 620...622:
                resultImage = UIImage(named: "snowy-2")!
            case 611...616:
                resultImage = UIImage(named: "snowy-1")!
            case 700...781:
                resultImage = UIImage(named: "fog")!
            case 800:
                resultImage = UIImage(named: "sun")!
            case 801:
                resultImage = UIImage(named: "cloudy")!
            case 802:
                resultImage = UIImage(named: "cloudy-2")!
            case 803, 804:
                resultImage = UIImage(named: "cloudy")!
            default:
                break
            }
        default:
            switch currentWeather.weather[0].id {
            case 200...232:
                resultImage = UIImage(named: "storm-1")!
            case 300...321:
                resultImage = UIImage(named: "rain-4")!
            case 500, 501:
                resultImage = UIImage(named: "rain-2")!
            case 511:
                resultImage = UIImage(named: "snowy-2")!
            case 502...504, 520...531:
                resultImage = UIImage(named: "storm-2")!
            case 600...602, 620...622:
                resultImage = UIImage(named: "snowy-2")!
            case 611...616:
                resultImage = UIImage(named: "snowy-1")!
            case 700...781:
                resultImage = UIImage(named: "fog")!
            case 800:
                resultImage = UIImage(named: "night")!
            case 801:
                resultImage = UIImage(named: "cloudy-1")!
            case 802:
                resultImage = UIImage(named: "cloudy-2")!
            case 803, 804:
                resultImage = UIImage(named: "cloudy-1")!
            default:
                break
            }
        }
        
        return resultImage
        
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
