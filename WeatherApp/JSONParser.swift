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
    
    func parseCurrentWeather(url: String, completionHandler: ((CurrentWeather) -> Void)?) {
        let request = URLRequest(url: URL(string: url + apiKey)!)
        print(request.url!)
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
                completionHandler!(weatherData)
            } catch {
                print(error.localizedDescription)
            }
                
            
        }
        
        task.resume()
        
    }
    
    func parseWeekWeather(url: String, completionHandler: ((WeekWeatherModel) -> Void)?) {
        
        let request = URLRequest(url: URL(string: url + apiKey)!)
        print(request.url!)
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
                let weatherData = try decoder.decode(WeekWeatherModel.self, from: jsonData!)
                completionHandler!(weatherData)
            } catch {
                print(error.localizedDescription)
            }
                
            
        }
        
        task.resume()
    }
}
