//
//  JSONParser.swift
//  WeatherApp
//
//  Created by Никита Плахин on 9/3/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

import Foundation


fileprivate let apiKey = "bcb8b5667d5b57bf338f17d31d0b0e1e"

class NetworkManager {
    
    func getCurrentWeather(coordinates: Coordinates, completionHandler: ((CurrentWeather) -> Void)?) {
        let request = URLRequest(url: URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(apiKey)")!)
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
                if let completionHandler = completionHandler {
                    completionHandler(weatherData)
                }
            } catch {
                print(error.localizedDescription)
            }
            
            
        }
        
        task.resume()
        
    }
    
    func getWeekWeather(coordinates: Coordinates, completionHandler: ((WeekWeatherModel) -> Void)?) {
        
        do {
            try validateCoordinates(coordinates: coordinates)
        } catch {
            print(error.localizedDescription)
        }
        
        let request = URLRequest(url: URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(apiKey)")!)
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
                if let completionHandler = completionHandler {
                    completionHandler(weatherData)
                }
            } catch {
                print(error.localizedDescription)
            }
            
            
        }
        
        task.resume()
    }
    
    func validateCoordinates(coordinates: Coordinates) throws {
        if !(-90...90).contains(coordinates.latitude) || !(-180...180).contains(coordinates.longitude) {
            throw CoordinateError.invalidCoordinates
        }
        
    }
}

enum CoordinateError: LocalizedError {
    case invalidCoordinates
    
    var errorDescription: String? {
        switch self {
        case .invalidCoordinates:
            return "Invalid coorindates"
        }
    }
}
