//
//  CurrentWeatherViewModelTests.swift
//  WeatherAppTests
//
//  Created by Никита Плахин on 9/17/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

@testable import WeatherApp
import XCTest

class CurrentWeatherViewModelTests: XCTestCase {
    
    var currentWeatherViewModel: CurrentWeatherViewModel!
    
    override func setUp() {
        super.setUp()
        currentWeatherViewModel = CurrentWeatherViewModel(currentWeather: CurrentWeather(coord: Coord(lon: -0.13, lat: 51.51), weather: [Weather(id: 800, main: "Clear", weatherDescription: "clear sky", icon: "01d")], base: "stations", main: Main(temp: 294.52, feelsLike: 288.48, tempMin: 293.71, tempMax: 295.37, pressure: 1027, humidity: 40), visibility: 10000, wind: Wind(speed: 7.7, deg: 340), clouds: Clouds(all: 0), dt: 1600354533, sys: Sys(type: 1, id: 1414, country: "GB", sunrise: 1600321151, sunset: 1600366249), timezone: 3600, id: 2643743, name: "London", cod: 200))
    }
    
    override func tearDown() {
        currentWeatherViewModel = nil
        super.tearDown()
    }

    func testWeatherType() {
        let expectation = "Clear"
        let current = currentWeatherViewModel.weatherType
        
        XCTAssertEqual(current, expectation)
    }
    
    func testLocation() {
        let expectation = "London, GB"
        let current = currentWeatherViewModel.location
        
        XCTAssertEqual(current, expectation)
    }
    
    func testGeneralInfo() {
        let expectation = "21 ºC | Clear"
        let current = currentWeatherViewModel.generalInfo
        
        XCTAssertEqual(current, expectation)
    }
    
    func testTemperature() {
        let expectation = "21 ºC"
        let current = currentWeatherViewModel.temperature
        
        XCTAssertEqual(current, expectation)
    }
    
    func testHumidity() {
        let expectation = "40%"
        let current = currentWeatherViewModel.humidity
        
        XCTAssertEqual(current, expectation)
    }
    
    func testPressure() {
        let expectation = "1027 hPa"
        let current = currentWeatherViewModel.pressure
        
        XCTAssertEqual(current, expectation)
    }
    
    func testWindSpeed() {
        let expectation = "27.7 km/h"
        let current = currentWeatherViewModel.windSpeed
        
        XCTAssertEqual(current, expectation)
    }
    
    func testFeelsLike() {
        let expectation = "15 ºC"
        let current = currentWeatherViewModel.feelsLike
        
        XCTAssertEqual(current, expectation)
    }
    
    func testSunrise() {
        let expectation = "8:39"
        let current = currentWeatherViewModel.sunrise
        
        XCTAssertEqual(current, expectation)
    }
    
    func testSunset() {
        let expectation = "21:10"
        let current = currentWeatherViewModel.sunset
        
        XCTAssertEqual(current, expectation)
    }
    
    func testSharedInfo() {
        let expectation = """
        London, GB, 21 ºC, feels like 15 ºC;
        Wind: 27.7 km/h, N.
        """
        let current = currentWeatherViewModel.sharedInfo
        
        XCTAssertEqual(current, expectation)
    }
    
    func testWindDirection() {
        var weatherModel = CurrentWeatherViewModel(currentWeather: CurrentWeather(coord: Coord(lon: -0.13, lat: 51.51), weather: [Weather(id: 800, main: "Clear", weatherDescription: "clear sky", icon: "01d")], base: "stations", main: Main(temp: 294.52, feelsLike: 288.48, tempMin: 293.71, tempMax: 295.37, pressure: 1027, humidity: 40), visibility: 10000, wind: Wind(speed: 7.7, deg: 340), clouds: Clouds(all: 0), dt: 1600354533, sys: Sys(type: 1, id: 1414, country: "GB", sunrise: 1600321151, sunset: 1600366249), timezone: 3600, id: 2643743, name: "London", cod: 200))
        
        var expectation = "N"
        var current = weatherModel.windDirection
        
        XCTAssertEqual(current, expectation)
        
        
        weatherModel = CurrentWeatherViewModel(currentWeather: CurrentWeather(coord: Coord(lon: -0.13, lat: 51.51), weather: [Weather(id: 800, main: "Clear", weatherDescription: "clear sky", icon: "01d")], base: "stations", main: Main(temp: 294.52, feelsLike: 288.48, tempMin: 293.71, tempMax: 295.37, pressure: 1027, humidity: 40), visibility: 10000, wind: Wind(speed: 7.7, deg: 80), clouds: Clouds(all: 0), dt: 1600354533, sys: Sys(type: 1, id: 1414, country: "GB", sunrise: 1600321151, sunset: 1600366249), timezone: 3600, id: 2643743, name: "London", cod: 200))
        
        expectation = "E"
        current = weatherModel.windDirection
        
        XCTAssertEqual(current, expectation)
        
        
        weatherModel = CurrentWeatherViewModel(currentWeather: CurrentWeather(coord: Coord(lon: -0.13, lat: 51.51), weather: [Weather(id: 800, main: "Clear", weatherDescription: "clear sky", icon: "01d")], base: "stations", main: Main(temp: 294.52, feelsLike: 288.48, tempMin: 293.71, tempMax: 295.37, pressure: 1027, humidity: 40), visibility: 10000, wind: Wind(speed: 7.7, deg: 380), clouds: Clouds(all: 0), dt: 1600354533, sys: Sys(type: 1, id: 1414, country: "GB", sunrise: 1600321151, sunset: 1600366249), timezone: 3600, id: 2643743, name: "London", cod: 200))
        
        expectation = ""
        current = weatherModel.windDirection
        
        XCTAssertEqual(current, expectation)
        
        
        weatherModel = CurrentWeatherViewModel(currentWeather: CurrentWeather(coord: Coord(lon: -0.13, lat: 51.51), weather: [Weather(id: 800, main: "Clear", weatherDescription: "clear sky", icon: "01d")], base: "stations", main: Main(temp: 294.52, feelsLike: 288.48, tempMin: 293.71, tempMax: 295.37, pressure: 1027, humidity: 40), visibility: 10000, wind: Wind(speed: 7.7, deg: 150), clouds: Clouds(all: 0), dt: 1600354533, sys: Sys(type: 1, id: 1414, country: "GB", sunrise: 1600321151, sunset: 1600366249), timezone: 3600, id: 2643743, name: "London", cod: 200))
        
        expectation = "S"
        current = weatherModel.windDirection
        
        XCTAssertEqual(current, expectation)
        
        
        weatherModel = CurrentWeatherViewModel(currentWeather: CurrentWeather(coord: Coord(lon: -0.13, lat: 51.51), weather: [Weather(id: 800, main: "Clear", weatherDescription: "clear sky", icon: "01d")], base: "stations", main: Main(temp: 294.52, feelsLike: 288.48, tempMin: 293.71, tempMax: 295.37, pressure: 1027, humidity: 40), visibility: 10000, wind: Wind(speed: 7.7, deg: 210), clouds: Clouds(all: 0), dt: 1600354533, sys: Sys(type: 1, id: 1414, country: "GB", sunrise: 1600321151, sunset: 1600366249), timezone: 3600, id: 2643743, name: "London", cod: 200))
        
        expectation = "SW"
        current = weatherModel.windDirection
        
        XCTAssertEqual(current, expectation)
        
        
        weatherModel = CurrentWeatherViewModel(currentWeather: CurrentWeather(coord: Coord(lon: -0.13, lat: 51.51), weather: [Weather(id: 800, main: "Clear", weatherDescription: "clear sky", icon: "01d")], base: "stations", main: Main(temp: 294.52, feelsLike: 288.48, tempMin: 293.71, tempMax: 295.37, pressure: 1027, humidity: 40), visibility: 10000, wind: Wind(speed: 7.7, deg: 40), clouds: Clouds(all: 0), dt: 1600354533, sys: Sys(type: 1, id: 1414, country: "GB", sunrise: 1600321151, sunset: 1600366249), timezone: 3600, id: 2643743, name: "London", cod: 200))
        
        expectation = "NE"
        current = weatherModel.windDirection
        
        XCTAssertEqual(current, expectation)
        
        
        weatherModel = CurrentWeatherViewModel(currentWeather: CurrentWeather(coord: Coord(lon: -0.13, lat: 51.51), weather: [Weather(id: 800, main: "Clear", weatherDescription: "clear sky", icon: "01d")], base: "stations", main: Main(temp: 294.52, feelsLike: 288.48, tempMin: 293.71, tempMax: 295.37, pressure: 1027, humidity: 40), visibility: 10000, wind: Wind(speed: 7.7, deg: 120), clouds: Clouds(all: 0), dt: 1600354533, sys: Sys(type: 1, id: 1414, country: "GB", sunrise: 1600321151, sunset: 1600366249), timezone: 3600, id: 2643743, name: "London", cod: 200))
        
        expectation = "SE"
        current = weatherModel.windDirection
        
        XCTAssertEqual(current, expectation)
        
        
        weatherModel = CurrentWeatherViewModel(currentWeather: CurrentWeather(coord: Coord(lon: -0.13, lat: 51.51), weather: [Weather(id: 800, main: "Clear", weatherDescription: "clear sky", icon: "01d")], base: "stations", main: Main(temp: 294.52, feelsLike: 288.48, tempMin: 293.71, tempMax: 295.37, pressure: 1027, humidity: 40), visibility: 10000, wind: Wind(speed: 7.7, deg: 244), clouds: Clouds(all: 0), dt: 1600354533, sys: Sys(type: 1, id: 1414, country: "GB", sunrise: 1600321151, sunset: 1600366249), timezone: 3600, id: 2643743, name: "London", cod: 200))
        
        expectation = "W"
        current = weatherModel.windDirection
        
        XCTAssertEqual(current, expectation)
        
        
        weatherModel = CurrentWeatherViewModel(currentWeather: CurrentWeather(coord: Coord(lon: -0.13, lat: 51.51), weather: [Weather(id: 800, main: "Clear", weatherDescription: "clear sky", icon: "01d")], base: "stations", main: Main(temp: 294.52, feelsLike: 288.48, tempMin: 293.71, tempMax: 295.37, pressure: 1027, humidity: 40), visibility: 10000, wind: Wind(speed: 7.7, deg: 301), clouds: Clouds(all: 0), dt: 1600354533, sys: Sys(type: 1, id: 1414, country: "GB", sunrise: 1600321151, sunset: 1600366249), timezone: 3600, id: 2643743, name: "London", cod: 200))
        
        expectation = "NW"
        current = weatherModel.windDirection
        
        XCTAssertEqual(current, expectation)
    }
    
    func testWeatherImage() {
        var weatherModel = CurrentWeatherViewModel(currentWeather: CurrentWeather(coord: Coord(lon: -0.13, lat: 51.51), weather: [Weather(id: 200, main: "Clear", weatherDescription: "clear sky", icon: "01d")], base: "stations", main: Main(temp: 294.52, feelsLike: 288.48, tempMin: 293.71, tempMax: 295.37, pressure: 1027, humidity: 40), visibility: 10000, wind: Wind(speed: 7.7, deg: 301), clouds: Clouds(all: 0), dt: 1600354533, sys: Sys(type: 1, id: 1414, country: "GB", sunrise: 1600321151, sunset: 1600366249), timezone: 3600, id: 2643743, name: "London", cod: 200))
        
        var expecatation = UIImage(named: "storm-1")
        var current = weatherModel.weatherImage
        
        XCTAssertEqual(expecatation, current)
        
        
        weatherModel = CurrentWeatherViewModel(currentWeather: CurrentWeather(coord: Coord(lon: -0.13, lat: 51.51), weather: [Weather(id: 511, main: "Clear", weatherDescription: "clear sky", icon: "01d")], base: "stations", main: Main(temp: 294.52, feelsLike: 288.48, tempMin: 293.71, tempMax: 295.37, pressure: 1027, humidity: 40), visibility: 10000, wind: Wind(speed: 7.7, deg: 301), clouds: Clouds(all: 0), dt: 1600354533, sys: Sys(type: 1, id: 1414, country: "GB", sunrise: 1600321151, sunset: 1600366249), timezone: 3600, id: 2643743, name: "London", cod: 200))
        
        expecatation = UIImage(named: "snowy-2")
        current = weatherModel.weatherImage
        
        XCTAssertEqual(expecatation, current)
        
        
        weatherModel = CurrentWeatherViewModel(currentWeather: CurrentWeather(coord: Coord(lon: -0.13, lat: 51.51), weather: [Weather(id: 502, main: "Clear", weatherDescription: "clear sky", icon: "01d")], base: "stations", main: Main(temp: 294.52, feelsLike: 288.48, tempMin: 293.71, tempMax: 295.37, pressure: 1027, humidity: 40), visibility: 10000, wind: Wind(speed: 7.7, deg: 301), clouds: Clouds(all: 0), dt: 1600354533, sys: Sys(type: 1, id: 1414, country: "GB", sunrise: 1600321151, sunset: 1600366249), timezone: 3600, id: 2643743, name: "London", cod: 200))
        
        expecatation = UIImage(named: "storm-2")
        current = weatherModel.weatherImage
        
        XCTAssertEqual(expecatation, current)
        
        
        weatherModel = CurrentWeatherViewModel(currentWeather: CurrentWeather(coord: Coord(lon: -0.13, lat: 51.51), weather: [Weather(id: 611, main: "Clear", weatherDescription: "clear sky", icon: "01d")], base: "stations", main: Main(temp: 294.52, feelsLike: 288.48, tempMin: 293.71, tempMax: 295.37, pressure: 1027, humidity: 40), visibility: 10000, wind: Wind(speed: 7.7, deg: 301), clouds: Clouds(all: 0), dt: 1600354533, sys: Sys(type: 1, id: 1414, country: "GB", sunrise: 1600321151, sunset: 1600366249), timezone: 3600, id: 2643743, name: "London", cod: 200))
        
        expecatation = UIImage(named: "snowy-1")
        current = weatherModel.weatherImage
        
        XCTAssertEqual(expecatation, current)
        
        
        weatherModel = CurrentWeatherViewModel(currentWeather: CurrentWeather(coord: Coord(lon: -0.13, lat: 51.51), weather: [Weather(id: 700, main: "Clear", weatherDescription: "clear sky", icon: "01d")], base: "stations", main: Main(temp: 294.52, feelsLike: 288.48, tempMin: 293.71, tempMax: 295.37, pressure: 1027, humidity: 40), visibility: 10000, wind: Wind(speed: 7.7, deg: 301), clouds: Clouds(all: 0), dt: 1600354533, sys: Sys(type: 1, id: 1414, country: "GB", sunrise: 1600321151, sunset: 1600366249), timezone: 3600, id: 2643743, name: "London", cod: 200))
        
        expecatation = UIImage(named: "fog")
        current = weatherModel.weatherImage
        
        XCTAssertEqual(expecatation, current)
        
        
        weatherModel = CurrentWeatherViewModel(currentWeather: CurrentWeather(coord: Coord(lon: -0.13, lat: 51.51), weather: [Weather(id: 802, main: "Clear", weatherDescription: "clear sky", icon: "01d")], base: "stations", main: Main(temp: 294.52, feelsLike: 288.48, tempMin: 293.71, tempMax: 295.37, pressure: 1027, humidity: 40), visibility: 10000, wind: Wind(speed: 7.7, deg: 301), clouds: Clouds(all: 0), dt: 1600354533, sys: Sys(type: 1, id: 1414, country: "GB", sunrise: 1600321151, sunset: 1600366249), timezone: 3600, id: 2643743, name: "London", cod: 200))
        
        expecatation = UIImage(named: "cloudy")
        current = weatherModel.weatherImage
        
        XCTAssertEqual(expecatation, current)
    }
}
