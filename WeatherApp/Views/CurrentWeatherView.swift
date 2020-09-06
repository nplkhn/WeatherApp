//
//  CurrentWeatherView.swift
//  WeatherApp
//
//  Created by Никита Плахин on 9/5/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

import UIKit

class CurrentWeatherView: UIView {
    
    public var weatherImageView: UIImageView = UIImageView()
    public var locationLabel: UILabel = UILabel()
    public var infoLabel: UILabel = UILabel()
    public var humidity: InfoElement = InfoElement(image: UIImage(named: "humidity")!, text: "")
    public var pressure: InfoElement = InfoElement(image: UIImage(named: "pressure")!, text: "")
    public var windSpeed: InfoElement = InfoElement(image: UIImage(named: "windSpeed")!, text: "")
    public var windDirection: InfoElement = InfoElement(image: UIImage(named: "windDirection")!, text: "")
    
    public var weather: CurrentWeatherViewModel? {
        didSet {
            if let weather = weather {
                self.weatherImageView.image = weather.weatherImage
                self.locationLabel.text = weather.location
                self.infoLabel.text = weather.generalInfo
                self.humidity.textLabel?.text = weather.humidity
                self.pressure.textLabel?.text = weather.pressure
                self.windSpeed.textLabel?.text = weather.windSpeed
                self.windDirection.textLabel?.text = weather.windDirection
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        let topContainerStackView = UIStackView(arrangedSubviews: [weatherImageView, locationLabel, infoLabel])
        topContainerStackView.axis = .vertical
        topContainerStackView.distribution = .equalSpacing
        
        // location label setup
        locationLabel.textAlignment = .center
        
        locationLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        
        // general info label setup
        infoLabel.textAlignment = .center
        infoLabel.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        infoLabel.textColor = .systemBlue
        
        // info elements stack view setup
        let infoElementsStackView = UIStackView(arrangedSubviews: [humidity, pressure, windSpeed, windDirection])
        infoElementsStackView.axis = .horizontal
        infoElementsStackView.distribution = .fillEqually
        infoElementsStackView.spacing = 25
        infoElementsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // container stack view setup
        let containerStackView = UIStackView(arrangedSubviews: [topContainerStackView, infoElementsStackView])
        containerStackView.axis = .vertical
        containerStackView.distribution = .equalSpacing
        containerStackView.alignment = .center
        
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerStackView)
        
        NSLayoutConstraint.activate([
            // container stack view
            NSLayoutConstraint.init(item: containerStackView, attribute: .centerY, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: containerStackView, attribute: .height, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .height, multiplier: 0.9, constant: 0),
            NSLayoutConstraint.init(item: containerStackView, attribute: .width, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .width, multiplier: 1, constant: 0),

            
            // info elements stack view
            NSLayoutConstraint.init(item: infoElementsStackView, attribute: .height, relatedBy: .equal, toItem: containerStackView.safeAreaLayoutGuide, attribute: .height, multiplier: 0.2, constant: 0),
            NSLayoutConstraint.init(item: infoElementsStackView, attribute: .width, relatedBy: .equal, toItem: containerStackView.safeAreaLayoutGuide, attribute: .width, multiplier: 0.9, constant: 0),
            
            // weather image view
            NSLayoutConstraint.init(item: weatherImageView, attribute: .height, relatedBy: .equal, toItem: containerStackView.safeAreaLayoutGuide, attribute: .width, multiplier: 0.6, constant: 0),
            NSLayoutConstraint.init(item: weatherImageView, attribute: .width, relatedBy: .equal, toItem: containerStackView.safeAreaLayoutGuide, attribute: .width, multiplier: 0.6, constant: 0),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
