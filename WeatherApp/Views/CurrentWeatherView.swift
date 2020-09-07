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
    public var sunrise: InfoElement = InfoElement(image: UIImage(named: "sunrise")!, text: "")
    public var sunset: InfoElement = InfoElement(image: UIImage(named: "sunset")!, text: "")
    public var shareButton: UIButton = UIButton()
    
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
                self.sunrise.textLabel?.text = weather.sunrise
                self.sunset.textLabel?.text = weather.sunset
            }
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        let topContainerStackView = UIStackView(arrangedSubviews: [weatherImageView, locationLabel, infoLabel])
        topContainerStackView.axis = .vertical
//        topContainerStackView.distribution = .
        
        
        // location label setup
        locationLabel.textAlignment = .center
        locationLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        
        // general info label setup
        infoLabel.textAlignment = .center
        infoLabel.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        infoLabel.textColor = .systemBlue
        
        // info elemnents top stack view setup
        let infoElementsTopStack = UIStackView(arrangedSubviews: [humidity, pressure, windSpeed, windDirection])
        infoElementsTopStack.axis = .horizontal
        infoElementsTopStack.distribution = .fillEqually
        infoElementsTopStack.spacing = 20
        
        // info elements bottom stack view setup
        let infoElementsBottomStack = UIStackView(arrangedSubviews: [sunrise, sunset])
        infoElementsBottomStack.axis = .horizontal
        infoElementsBottomStack.distribution = .fillEqually
        infoElementsBottomStack.spacing = 30
        
        
        // info elements stack view setup
        let infoElementsStackView = UIStackView(arrangedSubviews: [infoElementsTopStack, infoElementsBottomStack])
        infoElementsStackView.axis = .vertical
        infoElementsStackView.distribution = .fillEqually
        infoElementsStackView.alignment = .center
        infoElementsStackView.setCustomSpacing(100, after: infoElementsTopStack)
        infoElementsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // share button setup
        shareButton.setTitle("Share", for: .normal)
        shareButton.setTitleColor(.orange, for: .normal)
        shareButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        
        // container stack view setup
        let containerStackView = UIStackView(arrangedSubviews: [topContainerStackView, infoElementsStackView, shareButton])
        containerStackView.axis = .vertical
        containerStackView.distribution = .equalCentering
        containerStackView.alignment = .center
//        containerStackView.spacing = 25
        containerStackView.setCustomSpacing(100, after: topContainerStackView)
        
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerStackView)
        

        
        NSLayoutConstraint.activate([
            // container stack view
            NSLayoutConstraint.init(item: containerStackView, attribute: .centerY, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: containerStackView, attribute: .height, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .height, multiplier: 0.9, constant: 0),
            NSLayoutConstraint.init(item: containerStackView, attribute: .width, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .width, multiplier: 1, constant: 0),

            // top container stack view
//            NSLayoutConstraint(item: topContainerStackView, attribute: .height, relatedBy: .equal, toItem: containerStackView.safeAreaLayoutGuide, attribute: .height, multiplier: 0.3, constant: 0),
            
            
            // info elements stack view
//            NSLayoutConstraint.init(item: infoElementsStackView, attribute: .height, relatedBy: .equal, toItem: containerStackView.safeAreaLayoutGuide, attribute: .height, multiplier: 0.3, constant: 0),
            NSLayoutConstraint.init(item: infoElementsStackView, attribute: .width, relatedBy: .equal, toItem: containerStackView.safeAreaLayoutGuide, attribute: .width, multiplier: 0.9, constant: 0),
            
            // share button
//            NSLayoutConstraint(item: shareButton, attribute: .height, relatedBy: .equal, toItem: containerStackView.safeAreaLayoutGuide, attribute: .height, multiplier: 0.3, constant: 0),
            
            // weather image view
//            NSLayoutConstraint.init(item: weatherImageView, attribute: .height, relatedBy: .equal, toItem: containerStackView.safeAreaLayoutGuide, attribute: .width, multiplier: 1, constant: 0),
//            NSLayoutConstraint.init(item: weatherImageView, attribute: .width, relatedBy: .equal, toItem: containerStackView.safeAreaLayoutGuide, attribute: .width, multiplier: 0.6, constant: 0),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
