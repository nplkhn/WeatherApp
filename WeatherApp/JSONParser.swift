//
//  JSONParser.swift
//  WeatherApp
//
//  Created by Никита Плахин on 9/3/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

import Foundation




class weatherDataParser {
    
    private var parserCompletionHandler: ((CurrentWeather) -> Void)?
    
    func parseCurrentWeather(url: String, completeionHandler: ((CurrentWeather) -> Void)?) {
        self.parserCompletionHandler = completeionHandler
        
        let request = URLRequest(url: URL(string: url)!)
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
                self.parserCompletionHandler!(weatherData)
            } catch {
                print(error.localizedDescription)
            }
                
            
        }
        
        task.resume()
        
    }
}
