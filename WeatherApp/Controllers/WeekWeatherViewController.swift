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
    
    //    private var
    var weekWeatherViewModel: WeekWeatherViewModel? = nil
    let tableView: UITableView = UITableView()
    
    private let coordinates: CLLocationCoordinate2D
    
    init(coordinates: CLLocationCoordinate2D) {
        self.coordinates = coordinates
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(tableView)
        
        setupTableView()
        
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(WeatherTableViewCell.self, forCellReuseIdentifier: "weekWeatherCell")
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0),
        ])
        
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension WeekWeatherViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return (weekWeatherViewModel?.weather.count) ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (weekWeatherViewModel?.weather[section].count) ?? 0
    }
    
}

extension WeekWeatherViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weekWeatherCell", for: indexPath) as! WeatherTableViewCell
        
        weekWeatherViewModel?.setCurrentWeather(section: indexPath.section, row: indexPath.row)
        
        cell.imageView?.image = weekWeatherViewModel?.weatherImage
        cell.temperatureLabel.text = weekWeatherViewModel?.temperature
        cell.timeLabel.text = weekWeatherViewModel?.time
        cell.weatherTypeLabel.text = weekWeatherViewModel?.weatherType
        
        return cell
    }
    
}
