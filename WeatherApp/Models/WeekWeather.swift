//
//  WeekWeather.swift
//  WeatherApp
//
//  Created by Никита Плахин on 9/10/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

import Foundation

// MARK: - WeekWeatherModel
struct WeekWeatherModel: Codable {
    let cod: String
    let message, cnt: Int
    let list: [WeekList]
    let city: WeekCity
}

// MARK: - City
struct WeekCity: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone, sunrise, sunset: Int
}

// MARK: - Coord
struct WeekCoord: Codable {
    let lat, lon: Double
}

// MARK: - List
struct WeekList: Codable {
    let dt: Int
    let main: WeekMainClass
    let weather: [WeekWeather]
    let clouds: WeekClouds
    let wind: Wind
    let visibility: Int
    let pop: Double
    let rain: WeekRain?
    let sys: WeekSys
    let dtTxt: String

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, rain, sys
        case dtTxt = "dt_txt"
    }
}

// MARK: - Clouds
struct WeekClouds: Codable {
    let all: Int
}

// MARK: - MainClass
struct WeekMainClass: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Rain
struct WeekRain: Codable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

// MARK: - Sys
struct WeekSys: Codable {
    let pod: Pod
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

// MARK: - Weather
struct WeekWeather: Codable {
    let id: Int
    let main: MainEnum
    let weatherDescription: Description
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case lightRain = "light rain"
    case moderateRain = "moderate rain"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
}
