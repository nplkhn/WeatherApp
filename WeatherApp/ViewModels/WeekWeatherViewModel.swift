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
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: date)
    }
    
    public var weatherImage: UIImage {
        
        var resultImage: UIImage?
        
        if let weatherId = currentWeather?.weather[0].id {
            if (200...232).contains(weatherId) {
                resultImage = UIImage(named: "storm-1")
            } else if (300...321).contains(weatherId) {
                resultImage = UIImage(named: "rain-2-d")
            } else if (500...501).contains(weatherId) {
                resultImage = UIImage(named: "rain-1-d")
            } else if weatherId == 501 || (600...602).contains(weatherId) || (620...622).contains(weatherId) {
                resultImage = UIImage(named: "snowy-2")
            } else if (502...504).contains(weatherId) || (520...531).contains(weatherId) {
                resultImage = UIImage(named: "storm-2")
            } else if (611...616).contains(weatherId) {
                resultImage = UIImage(named: "snowy-1")
            } else if (700...781).contains(weatherId) {
                resultImage = UIImage(named: "fog")
            } else if weatherId == 800 {
                resultImage = UIImage(named: "sun")
            } else if weatherId == 801 || (803...804).contains(weatherId) {
                resultImage = UIImage(named: "cloudy-d")
            } else if weatherId == 802 {
                resultImage = UIImage(named: "cloudy")
            }
        }
        
        return resultImage ?? UIImage(systemName: "cloud")!
        
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
