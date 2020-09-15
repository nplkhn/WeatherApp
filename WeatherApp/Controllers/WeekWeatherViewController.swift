//
//  WeekWeatherViewController.swift
//  WeatherApp
//
//  Created by Никита Плахин on 9/8/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

import UIKit
import CoreLocation

class WeekWeatherViewController: UIViewController {
    
    var weatherViewModel: WeekWeatherViewModel? = nil
    let tableView: UITableView = UITableView()
    
    var coordinates: CLLocationCoordinate2D? {
        didSet {
            getWeatherData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(tableView)
        
        setupTableView()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let weatherViewModel = weatherViewModel {
            self.parent?.navigationItem.title = weatherViewModel.city
        }
    }
    
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: "weekWeatherCell")
        tableView.rowHeight = 70
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0),
        ])
        
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func getWeatherData() {
        let parser = weatherDataParser()
        parser.parseWeekWeather(url: "https://api.openweathermap.org/data/2.5/forecast?lat=\(coordinates!.latitude)&lon=\(coordinates!.longitude)&appid=") { (weather) in
            self.weatherViewModel = WeekWeatherViewModel(weekWeather: weather)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
            
        }
        
    }
    
}

extension WeekWeatherViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return (weatherViewModel?.weather.count) ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (weatherViewModel?.weather[section].count) ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let date = Date(timeIntervalSince1970: TimeInterval((weatherViewModel?.weather[section][0].dt)!))
        let calendar = Calendar.current
        
        
        if section == 0 && weatherViewModel?.weather.count == 5 {
            return "Today"
        }
        
        switch calendar.component(.weekday, from: date) {
        case 1:
            return "Sunday"
        case 2:
            return "Monday"
        case 3:
            return "Tuesday"
        case 4:
            return "Wednesday"
        case 5:
            return "Thursday"
        case 6:
            return "Friday"
        case 7:
            return "Saturday"
        default:
            return ""
        }
    }
}

extension WeekWeatherViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weekWeatherCell", for: indexPath) as! WeatherTableViewCell
        
        weatherViewModel?.setCurrentWeather(section: indexPath.section, row: indexPath.row)
        
        cell.imageView?.image = weatherViewModel?.weatherImage
        cell.temperatureLabel.text = weatherViewModel?.temperature
        cell.timeLabel.text = weatherViewModel?.time
        cell.weatherTypeLabel.text = weatherViewModel?.weatherType
        
        return cell
    }
    
}
