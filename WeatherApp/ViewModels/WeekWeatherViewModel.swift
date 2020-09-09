//
//  WeekWeatherViewModel.swift
//  WeatherApp
//
//  Created by Никита Плахин on 9/8/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

import Foundation
import UIKit

class WeekWeatherViewModel {
    private var weekWeather: WeekWeather
    public var weather: [[List]] = []
    private var currentWeather: List? = nil
    
    init(weekWeather: WeekWeather) {
        self.weekWeather = weekWeather
        getWeatherByDay()
    }
    
    public func setCurrentWeather(section day: Int, row idx: Int) {
        currentWeather = weather[day][idx]
    }
    
    public var city: String {
        return weekWeather.city.name
    }
    
    public var weatherType: String {
        return currentWeather!.weather[0].main
    }
    
    public var temperature: String {
        return "\(currentWeather!.main.temp)º"
    }
    
    public var time: String {
        let date = Date(timeIntervalSince1970: TimeInterval(currentWeather!.dt))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        
        return dateFormatter.string(from: date)
    }
    
    public var weatherImage: UIImage {
        let date = Date()
        let calendar = Calendar.current
        let sunrise = Date(timeIntervalSince1970: TimeInterval(currentWeather!.sys.sunrise))
        let sunset = Date(timeIntervalSince1970: TimeInterval(currentWeather!.sys.sunset))
        let hour = calendar.component(.hour, from: date)
        let sunriseHour = calendar.component(.hour, from: sunrise)
        let sunsetHour = calendar.component(.hour, from: sunset)
        
        var resultImage = UIImage()
        
        
        
        switch hour {
        case sunriseHour..<sunsetHour:
            switch currentWeather!.weather[0].id {
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
            switch currentWeather!.weather[0].id {
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
    
    private func getWeatherByDay() {
        let calendar = Calendar.current
        var currentDay = -1
        var currentObservations: [List] = []
        
        for weather in weekWeather.list {
            let date = Date(timeIntervalSince1970: TimeInterval(weather.dt))
            let day = calendar.component(.day, from: date)
            if currentDay == -1 {
                currentDay = day
            } else if day != currentDay {
                self.weather.append(currentObservations)
                currentObservations = []
            }
            currentObservations.append(weather)
        }
    }
}
