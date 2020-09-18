//
//  WeekWeatherViewModelTests.swift
//  WeatherAppTests
//
//  Created by Никита Плахин on 9/18/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

@testable import WeatherApp
import XCTest

class WeekWeatherViewModelTests: XCTestCase {

    var weekWeatherViewModel: WeekWeatherViewModel!
    
    override func setUp() {
        super.setUp()
        let decoder = JSONDecoder()
        do {
            let weatherData = try decoder.decode(WeekWeatherModel.self, from: jsonData.data(using: .utf8)!)
            weekWeatherViewModel = WeekWeatherViewModel(weekWeather: weatherData)
        } catch {
            XCTAssertNil(error)
        }
        

    }
    
    override func tearDown() {
        weekWeatherViewModel = nil
        super.tearDown()
    }
    
    func testCity() {
        let expectation = "London"
        let current = weekWeatherViewModel.city
        
        XCTAssertEqual(expectation, current)
    }
    
    func testWeatherType() {
        let expectation = "Clouds"
        weekWeatherViewModel.setCurrentWeather(section: 0, row: 0)
        let current = weekWeatherViewModel.weatherType
        
        XCTAssertEqual(expectation, current)
    }
    
    func testTemperature() {
        let expectation = "20º"
        weekWeatherViewModel.setCurrentWeather(section: 0, row: 0)
        let current = weekWeatherViewModel.temperature
        
        XCTAssertEqual(expectation, current)
    }
    
    func testTime() {
        let expectation = "15:00"
        weekWeatherViewModel.setCurrentWeather(section: 0, row: 0)
        let current = weekWeatherViewModel.time
        
        XCTAssertEqual(expectation, current)
    }

}


let jsonData = """
{
  "cod": "200",
  "message": 0,
  "cnt": 40,
  "list": [
    {
      "dt": 1600430400,
      "main": {
        "temp": 292.65,
        "feels_like": 287.77,
        "temp_min": 292.65,
        "temp_max": 293.14,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1020,
        "humidity": 48,
        "temp_kf": -0.49
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "clouds": {
        "all": 38
      },
      "wind": {
        "speed": 6.37,
        "deg": 71
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-09-18 12:00:00"
    },
    {
      "dt": 1600441200,
      "main": {
        "temp": 292.85,
        "feels_like": 288.13,
        "temp_min": 292.85,
        "temp_max": 293.04,
        "pressure": 1022,
        "sea_level": 1022,
        "grnd_level": 1018,
        "humidity": 45,
        "temp_kf": -0.19
      },
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02d"
        }
      ],
      "clouds": {
        "all": 16
      },
      "wind": {
        "speed": 5.89,
        "deg": 69
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-09-18 15:00:00"
    },
    {
      "dt": 1600452000,
      "main": {
        "temp": 290.5,
        "feels_like": 286.4,
        "temp_min": 290.39,
        "temp_max": 290.5,
        "pressure": 1021,
        "sea_level": 1021,
        "grnd_level": 1018,
        "humidity": 61,
        "temp_kf": 0.11
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 5
      },
      "wind": {
        "speed": 5.82,
        "deg": 65
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-09-18 18:00:00"
    },
    {
      "dt": 1600462800,
      "main": {
        "temp": 289.7,
        "feels_like": 285.92,
        "temp_min": 289.68,
        "temp_max": 289.7,
        "pressure": 1021,
        "sea_level": 1021,
        "grnd_level": 1018,
        "humidity": 64,
        "temp_kf": 0.02
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03n"
        }
      ],
      "clouds": {
        "all": 47
      },
      "wind": {
        "speed": 5.36,
        "deg": 60
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-09-18 21:00:00"
    },
    {
      "dt": 1600473600,
      "main": {
        "temp": 289.18,
        "feels_like": 285.65,
        "temp_min": 289.18,
        "temp_max": 289.18,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 1016,
        "humidity": 69,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 61
      },
      "wind": {
        "speed": 5.24,
        "deg": 54
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-09-19 00:00:00"
    },
    {
      "dt": 1600484400,
      "main": {
        "temp": 288.76,
        "feels_like": 285.44,
        "temp_min": 288.76,
        "temp_max": 288.76,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1014,
        "humidity": 73,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 69
      },
      "wind": {
        "speed": 5.12,
        "deg": 52
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-09-19 03:00:00"
    },
    {
      "dt": 1600495200,
      "main": {
        "temp": 288.89,
        "feels_like": 285.18,
        "temp_min": 288.89,
        "temp_max": 288.89,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1014,
        "humidity": 73,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 85
      },
      "wind": {
        "speed": 5.73,
        "deg": 56
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-09-19 06:00:00"
    },
    {
      "dt": 1600506000,
      "main": {
        "temp": 291.72,
        "feels_like": 287.47,
        "temp_min": 291.72,
        "temp_max": 291.72,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1014,
        "humidity": 58,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 6.19,
        "deg": 63
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-09-19 09:00:00"
    },
    {
      "dt": 1600516800,
      "main": {
        "temp": 294.12,
        "feels_like": 289.88,
        "temp_min": 294.12,
        "temp_max": 294.12,
        "pressure": 1016,
        "sea_level": 1016,
        "grnd_level": 1013,
        "humidity": 49,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 6.06,
        "deg": 75
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-09-19 12:00:00"
    },
    {
      "dt": 1600527600,
      "main": {
        "temp": 293.46,
        "feels_like": 289.84,
        "temp_min": 293.46,
        "temp_max": 293.46,
        "pressure": 1015,
        "sea_level": 1015,
        "grnd_level": 1013,
        "humidity": 51,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 5.17,
        "deg": 74
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-09-19 15:00:00"
    },
    {
      "dt": 1600538400,
      "main": {
        "temp": 291.61,
        "feels_like": 288.22,
        "temp_min": 291.61,
        "temp_max": 291.61,
        "pressure": 1015,
        "sea_level": 1015,
        "grnd_level": 1012,
        "humidity": 57,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 4.82,
        "deg": 66
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-09-19 18:00:00"
    },
    {
      "dt": 1600549200,
      "main": {
        "temp": 290.68,
        "feels_like": 287.51,
        "temp_min": 290.68,
        "temp_max": 290.68,
        "pressure": 1016,
        "sea_level": 1016,
        "grnd_level": 1014,
        "humidity": 63,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 4.75,
        "deg": 54
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-09-19 21:00:00"
    },
    {
      "dt": 1600560000,
      "main": {
        "temp": 290.33,
        "feels_like": 287.64,
        "temp_min": 290.33,
        "temp_max": 290.33,
        "pressure": 1016,
        "sea_level": 1016,
        "grnd_level": 1014,
        "humidity": 72,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10n"
        }
      ],
      "clouds": {
        "all": 75
      },
      "wind": {
        "speed": 4.77,
        "deg": 55
      },
      "visibility": 10000,
      "pop": 0.2,
      "rain": {
        "3h": 0.12
      },
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-09-20 00:00:00"
    },
    {
      "dt": 1600570800,
      "main": {
        "temp": 289.84,
        "feels_like": 287.15,
        "temp_min": 289.84,
        "temp_max": 289.84,
        "pressure": 1016,
        "sea_level": 1016,
        "grnd_level": 1013,
        "humidity": 74,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10n"
        }
      ],
      "clouds": {
        "all": 75
      },
      "wind": {
        "speed": 4.74,
        "deg": 53
      },
      "visibility": 10000,
      "pop": 0.54,
      "rain": {
        "3h": 0.86
      },
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-09-20 03:00:00"
    },
    {
      "dt": 1600581600,
      "main": {
        "temp": 289.41,
        "feels_like": 287.29,
        "temp_min": 289.41,
        "temp_max": 289.41,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1014,
        "humidity": 75,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10d"
        }
      ],
      "clouds": {
        "all": 81
      },
      "wind": {
        "speed": 3.83,
        "deg": 59
      },
      "visibility": 10000,
      "pop": 0.56,
      "rain": {
        "3h": 0.79
      },
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-09-20 06:00:00"
    },
    {
      "dt": 1600592400,
      "main": {
        "temp": 291.83,
        "feels_like": 289.27,
        "temp_min": 291.83,
        "temp_max": 291.83,
        "pressure": 1018,
        "sea_level": 1018,
        "grnd_level": 1015,
        "humidity": 63,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 83
      },
      "wind": {
        "speed": 4.32,
        "deg": 60
      },
      "visibility": 10000,
      "pop": 0.37,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-09-20 09:00:00"
    },
    {
      "dt": 1600603200,
      "main": {
        "temp": 295.28,
        "feels_like": 292.11,
        "temp_min": 295.28,
        "temp_max": 295.28,
        "pressure": 1018,
        "sea_level": 1018,
        "grnd_level": 1015,
        "humidity": 45,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 53
      },
      "wind": {
        "speed": 4.45,
        "deg": 70
      },
      "visibility": 10000,
      "pop": 0.35,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-09-20 12:00:00"
    },
    {
      "dt": 1600614000,
      "main": {
        "temp": 295.76,
        "feels_like": 292.05,
        "temp_min": 295.76,
        "temp_max": 295.76,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1014,
        "humidity": 37,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 7
      },
      "wind": {
        "speed": 4.36,
        "deg": 66
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-09-20 15:00:00"
    },
    {
      "dt": 1600624800,
      "main": {
        "temp": 292.39,
        "feels_like": 288.74,
        "temp_min": 292.39,
        "temp_max": 292.39,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1015,
        "humidity": 46,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 3
      },
      "wind": {
        "speed": 4.32,
        "deg": 73
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-09-20 18:00:00"
    },
    {
      "dt": 1600635600,
      "main": {
        "temp": 289.74,
        "feels_like": 286.88,
        "temp_min": 289.74,
        "temp_max": 289.74,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 1016,
        "humidity": 60,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 3.7,
        "deg": 63
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-09-20 21:00:00"
    },
    {
      "dt": 1600646400,
      "main": {
        "temp": 288.3,
        "feels_like": 286.54,
        "temp_min": 288.3,
        "temp_max": 288.3,
        "pressure": 1018,
        "sea_level": 1018,
        "grnd_level": 1015,
        "humidity": 73,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 2.72,
        "deg": 54
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-09-21 00:00:00"
    },
    {
      "dt": 1600657200,
      "main": {
        "temp": 287.41,
        "feels_like": 286.41,
        "temp_min": 287.41,
        "temp_max": 287.41,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1014,
        "humidity": 79,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 1.75,
        "deg": 32
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-09-21 03:00:00"
    },
    {
      "dt": 1600668000,
      "main": {
        "temp": 286.68,
        "feels_like": 285.68,
        "temp_min": 286.68,
        "temp_max": 286.68,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1014,
        "humidity": 81,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 1
      },
      "wind": {
        "speed": 1.63,
        "deg": 17
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-09-21 06:00:00"
    },
    {
      "dt": 1600678800,
      "main": {
        "temp": 289.75,
        "feels_like": 288.48,
        "temp_min": 289.75,
        "temp_max": 289.75,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1014,
        "humidity": 65,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 2
      },
      "wind": {
        "speed": 1.88,
        "deg": 27
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-09-21 09:00:00"
    },
    {
      "dt": 1600689600,
      "main": {
        "temp": 295.12,
        "feels_like": 294.13,
        "temp_min": 295.12,
        "temp_max": 295.12,
        "pressure": 1016,
        "sea_level": 1016,
        "grnd_level": 1013,
        "humidity": 41,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 1
      },
      "wind": {
        "speed": 0.79,
        "deg": 16
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-09-21 12:00:00"
    },
    {
      "dt": 1600700400,
      "main": {
        "temp": 296.41,
        "feels_like": 294.53,
        "temp_min": 296.41,
        "temp_max": 296.41,
        "pressure": 1014,
        "sea_level": 1014,
        "grnd_level": 1011,
        "humidity": 32,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 1.26,
        "deg": 299
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-09-21 15:00:00"
    },
    {
      "dt": 1600711200,
      "main": {
        "temp": 294.03,
        "feels_like": 292.17,
        "temp_min": 294.03,
        "temp_max": 294.03,
        "pressure": 1013,
        "sea_level": 1013,
        "grnd_level": 1011,
        "humidity": 36,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 1.12,
        "deg": 294
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-09-21 18:00:00"
    },
    {
      "dt": 1600722000,
      "main": {
        "temp": 291.93,
        "feels_like": 290.05,
        "temp_min": 291.93,
        "temp_max": 291.93,
        "pressure": 1013,
        "sea_level": 1013,
        "grnd_level": 1010,
        "humidity": 44,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 5
      },
      "wind": {
        "speed": 1.46,
        "deg": 243
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-09-21 21:00:00"
    },
    {
      "dt": 1600732800,
      "main": {
        "temp": 290.27,
        "feels_like": 288.13,
        "temp_min": 290.27,
        "temp_max": 290.27,
        "pressure": 1011,
        "sea_level": 1011,
        "grnd_level": 1008,
        "humidity": 56,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 3
      },
      "wind": {
        "speed": 2.49,
        "deg": 231
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-09-22 00:00:00"
    },
    {
      "dt": 1600743600,
      "main": {
        "temp": 289.2,
        "feels_like": 287.32,
        "temp_min": 289.2,
        "temp_max": 289.2,
        "pressure": 1009,
        "sea_level": 1009,
        "grnd_level": 1006,
        "humidity": 68,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 2.81,
        "deg": 219
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-09-22 03:00:00"
    },
    {
      "dt": 1600754400,
      "main": {
        "temp": 288.35,
        "feels_like": 285.67,
        "temp_min": 288.35,
        "temp_max": 288.35,
        "pressure": 1009,
        "sea_level": 1009,
        "grnd_level": 1006,
        "humidity": 72,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 3.96,
        "deg": 237
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-09-22 06:00:00"
    },
    {
      "dt": 1600765200,
      "main": {
        "temp": 290.7,
        "feels_like": 288.2,
        "temp_min": 290.7,
        "temp_max": 290.7,
        "pressure": 1008,
        "sea_level": 1008,
        "grnd_level": 1005,
        "humidity": 72,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 65
      },
      "wind": {
        "speed": 4.65,
        "deg": 251
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-09-22 09:00:00"
    },
    {
      "dt": 1600776000,
      "main": {
        "temp": 292.57,
        "feels_like": 288.91,
        "temp_min": 292.57,
        "temp_max": 292.57,
        "pressure": 1008,
        "sea_level": 1008,
        "grnd_level": 1005,
        "humidity": 53,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 82
      },
      "wind": {
        "speed": 5.14,
        "deg": 264
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-09-22 12:00:00"
    },
    {
      "dt": 1600786800,
      "main": {
        "temp": 291.62,
        "feels_like": 288.92,
        "temp_min": 291.62,
        "temp_max": 291.62,
        "pressure": 1008,
        "sea_level": 1008,
        "grnd_level": 1005,
        "humidity": 61,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 4.24,
        "deg": 276
      },
      "visibility": 10000,
      "pop": 0.43,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-09-22 15:00:00"
    },
    {
      "dt": 1600797600,
      "main": {
        "temp": 289.08,
        "feels_like": 287.88,
        "temp_min": 289.08,
        "temp_max": 289.08,
        "pressure": 1008,
        "sea_level": 1008,
        "grnd_level": 1005,
        "humidity": 82,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10n"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 2.98,
        "deg": 262
      },
      "visibility": 7240,
      "pop": 0.89,
      "rain": {
        "3h": 3
      },
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-09-22 18:00:00"
    },
    {
      "dt": 1600808400,
      "main": {
        "temp": 286.12,
        "feels_like": 283.5,
        "temp_min": 286.12,
        "temp_max": 286.12,
        "pressure": 1009,
        "sea_level": 1009,
        "grnd_level": 1006,
        "humidity": 80,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 501,
          "main": "Rain",
          "description": "moderate rain",
          "icon": "10n"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 3.65,
        "deg": 344
      },
      "visibility": 10000,
      "pop": 1,
      "rain": {
        "3h": 5.8
      },
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-09-22 21:00:00"
    },
    {
      "dt": 1600819200,
      "main": {
        "temp": 286.38,
        "feels_like": 284.19,
        "temp_min": 286.38,
        "temp_max": 286.38,
        "pressure": 1008,
        "sea_level": 1008,
        "grnd_level": 1006,
        "humidity": 72,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10n"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 2.56,
        "deg": 4
      },
      "visibility": 10000,
      "pop": 1,
      "rain": {
        "3h": 0.37
      },
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-09-23 00:00:00"
    },
    {
      "dt": 1600830000,
      "main": {
        "temp": 285.65,
        "feels_like": 283.98,
        "temp_min": 285.65,
        "temp_max": 285.65,
        "pressure": 1008,
        "sea_level": 1008,
        "grnd_level": 1005,
        "humidity": 76,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03n"
        }
      ],
      "clouds": {
        "all": 47
      },
      "wind": {
        "speed": 1.86,
        "deg": 4
      },
      "visibility": 10000,
      "pop": 0.16,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-09-23 03:00:00"
    },
    {
      "dt": 1600840800,
      "main": {
        "temp": 285.43,
        "feels_like": 284.32,
        "temp_min": 285.43,
        "temp_max": 285.43,
        "pressure": 1008,
        "sea_level": 1008,
        "grnd_level": 1005,
        "humidity": 78,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10d"
        }
      ],
      "clouds": {
        "all": 45
      },
      "wind": {
        "speed": 1.12,
        "deg": 350
      },
      "visibility": 10000,
      "pop": 0.39,
      "rain": {
        "3h": 0.25
      },
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-09-23 06:00:00"
    },
    {
      "dt": 1600851600,
      "main": {
        "temp": 287.75,
        "feels_like": 286.9,
        "temp_min": 287.75,
        "temp_max": 287.75,
        "pressure": 1007,
        "sea_level": 1007,
        "grnd_level": 1005,
        "humidity": 63,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10d"
        }
      ],
      "clouds": {
        "all": 42
      },
      "wind": {
        "speed": 0.43,
        "deg": 216
      },
      "visibility": 10000,
      "pop": 0.36,
      "rain": {
        "3h": 0.37
      },
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-09-23 09:00:00"
    }
  ],
  "city": {
    "id": 2643743,
    "name": "London",
    "coord": {
      "lat": 51.51,
      "lon": -0.13
    },
    "country": "GB",
    "population": 1000000,
    "timezone": 3600,
    "sunrise": 1600407646,
    "sunset": 1600452509
  }
}
"""
