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
    private var weekWeather: WeekWeatherModel
    public var weather: [[WeekList]] = []
    private var currentWeather: WeekList? = nil
    
    init(weekWeather: WeekWeatherModel) {
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
        return currentWeather!.weather[0].main.rawValue
    }
    
    public var temperature: String {
        return String(format: "%.0f", currentWeather!.main.temp - 273.15) + "º"
    }
    
    public var time: String {
        let date = Date(timeIntervalSince1970: TimeInterval(currentWeather!.dt))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm"
        
        return dateFormatter.string(from: date)
    }
    
    public var weatherImage: UIImage {
        
        var resultImage = UIImage()
        
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
        
        
        return resultImage
        
    }
    
    private func getWeatherByDay() {
        let calendar = Calendar.current
        var currentDay = -1
        var currentObservations: [WeekList] = []
        
        for weather in weekWeather.list {
            let date = Date(timeIntervalSince1970: TimeInterval(weather.dt))
            let day = calendar.component(.weekday, from: date)
            if currentDay == -1 {
                currentDay = day
            } else if day != currentDay {
                self.weather.append(currentObservations)
                currentDay = day
                currentObservations = []
            }
            currentObservations.append(weather)
        }
    }
}
