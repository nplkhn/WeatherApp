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
                resultImage = UIImage(systemName: "cloud.bolt.rain.fill")!
            case 300...321:
                resultImage = UIImage(systemName: "cloud.drizzle.fill")!
            case 500, 501:
                resultImage = UIImage(systemName: "cloud.sun.rain.fill")!
            case 511:
                resultImage = UIImage(systemName: "cloud.snow.fill")!
            case 502...504, 520...531:
                resultImage = UIImage(systemName: "cloud.heavyrain.fill")!
            case 600...602, 620...622:
                resultImage = UIImage(systemName: "cloud.snow.fill")!
            case 611...616:
                resultImage = UIImage(systemName: "cloud.sleet.fill")!
            case 700...781:
                resultImage = UIImage(systemName: "cloud.fog.fill")!
            case 800:
                resultImage = UIImage(systemName: "sun.max.fill")!
            case 801:
                resultImage = UIImage(systemName: "cloud.sun.fill")!
            case 802:
                resultImage = UIImage(systemName: "cloud.fill")!
            case 803, 804:
                resultImage = UIImage(systemName: "smoke.fill")!
            default:
                break
            }
        default:
            switch currentWeather.weather[0].id {
            case 200...232:
                resultImage = UIImage(systemName: "cloud.bolt.rain.fill")!
            case 300...321:
                resultImage = UIImage(systemName: "cloud.drizzle.fill")!
            case 500, 501:
                resultImage = UIImage(systemName: "cloud.moon.rain.fill")!
            case 511:
                resultImage = UIImage(systemName: "cloud.snow.fill")!
            case 502...504, 520...531:
                resultImage = UIImage(systemName: "cloud.heavyrain.fill")!
            case 600...602, 620...622:
                resultImage = UIImage(systemName: "cloud.snow.fill")!
            case 611...616:
                resultImage = UIImage(systemName: "cloud.sleet.fill")!
            case 700...781:
                resultImage = UIImage(systemName: "cloud.fog.fill")!
            case 800:
                resultImage = UIImage(systemName: "moon.stars.fill")!
            case 801:
                resultImage = UIImage(systemName: "cloud.moon.fill")!
            case 802:
                resultImage = UIImage(systemName: "cloud.fill")!
            case 803, 804:
                resultImage = UIImage(systemName: "smoke.fill")!
            default:
                break
            }
        }
        
        return resultImage
        
    }
    
    public var location: String {
        return "\(currentWeather.name), \(currentWeather.sys.country)"
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
        return "\(currentWeather.wind.speed * 3.6) km/h"
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
}
