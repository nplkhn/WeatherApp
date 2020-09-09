//
//  JSONParser.swift
//  WeatherApp
//
//  Created by Никита Плахин on 9/3/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

import Foundation


let apiKey = "bcb8b5667d5b57bf338f17d31d0b0e1e"

class weatherDataParser {
    
    private var currentWeatherParserCompletionHandler: ((CurrentWeather) -> Void)?
    private var weekWeatherParserCompletionHandler: ((WeekWeather) -> Void)?
    
    func parseCurrentWeather(url: String, completeionHandler: ((CurrentWeather) -> Void)?) {
        self.currentWeatherParserCompletionHandler = completeionHandler
        
        let request = URLRequest(url: URL(string: url + apiKey)!)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (jsonData, _, error) in
            
            guard jsonData != nil else {
                if let error = error {
                    print(error.localizedDescription)
                }
                
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let weatherData = try decoder.decode(CurrentWeather.self, from: jsonData!)
                self.currentWeatherParserCompletionHandler!(weatherData)
            } catch {
                print(error.localizedDescription)
            }
                
            
        }
        
        task.resume()
        
    }
    
    func parseWeekWeather(url: String, completeionHandler: ((WeekWeather) -> Void)?) {
        
        self.weekWeatherParserCompletionHandler = completeionHandler
        
        let request = URLRequest(url: URL(string: url + apiKey)!)
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (jsonData, _, error) in
            
            guard jsonData != nil else {
                if let error = error {
                    print(error.localizedDescription)
                }
                
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let weatherData = try decoder.decode(WeekWeather.self, from: jsonData!)
                self.weekWeatherParserCompletionHandler!(weatherData)
            } catch {
                print(error.localizedDescription)
            }
                
            
        }
        
        task.resume()
    }
}
