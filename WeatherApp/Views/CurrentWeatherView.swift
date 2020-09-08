//
//  CurrentWeatherView.swift
//  WeatherApp
//
//  Created by Никита Плахин on 9/5/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

import UIKit

class CurrentWeatherView: UIView {
    
    public let weatherImageView: UIImageView = UIImageView()
    public let locationLabel: UILabel = UILabel()
    public let infoLabel: UILabel = UILabel()
    public let humidity: InfoElement = InfoElement(image: UIImage(named: "humidity")!, text: "")
    public let pressure: InfoElement = InfoElement(image: UIImage(named: "pressure")!, text: "")
    public let windSpeed: InfoElement = InfoElement(image: UIImage(named: "windSpeed")!, text: "")
    public let windDirection: InfoElement = InfoElement(image: UIImage(named: "windDirection")!, text: "")
    public let sunrise: InfoElement = InfoElement(image: UIImage(named: "sunrise")!, text: "")
    public let sunset: InfoElement = InfoElement(image: UIImage(named: "sunset")!, text: "")
    public let shareButton: UIButton = UIButton()
    
    // stack views
    var containerStackView: UIStackView?
    var topContainerStackView: UIStackView?
    var infoElementsStackView: UIStackView?
    var infoElementsTopStack: UIStackView?
    var infoElementsBottomStack: UIStackView?
    var rightContainerStackView: UIStackView?
    
    private var currentConstraints: [NSLayoutConstraint] = []
    private var rightStackView: UIStackView? = nil
    
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
        
        topContainerStackView = UIStackView(arrangedSubviews: [weatherImageView, locationLabel, infoLabel])
        topContainerStackView?.axis = .vertical
        
        // location label setup
        locationLabel.textAlignment = .center
        locationLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        
        // general info label setup
        infoLabel.textAlignment = .center
        infoLabel.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        infoLabel.textColor = .systemBlue
        
        // info elemnents top stack view setup
        infoElementsTopStack = UIStackView(arrangedSubviews: [humidity, pressure, windSpeed, windDirection])
        infoElementsTopStack?.axis = .horizontal
        infoElementsTopStack?.distribution = .fillEqually
        infoElementsTopStack?.spacing = 20
        
        // info elements bottom stack view setup
        infoElementsBottomStack = UIStackView(arrangedSubviews: [sunrise, sunset])
        infoElementsBottomStack?.axis = .horizontal
        infoElementsBottomStack?.distribution = .fillEqually
        infoElementsBottomStack?.spacing = 30
        
        
        // info elements stack view setup
        infoElementsStackView = UIStackView(arrangedSubviews: [infoElementsTopStack!, infoElementsBottomStack!])
        infoElementsStackView?.axis = .vertical
        infoElementsStackView?.distribution = .fillEqually
        infoElementsStackView?.alignment = .center
        
        infoElementsStackView?.translatesAutoresizingMaskIntoConstraints = false
        
        // share button setup
        shareButton.setTitle("Share", for: .normal)
        shareButton.setTitleColor(.orange, for: .normal)
        shareButton.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        
        // container stack view setup
        containerStackView = UIStackView(arrangedSubviews: [topContainerStackView!, infoElementsStackView!, shareButton])
        
        containerStackView?.translatesAutoresizingMaskIntoConstraints = false
        addSubview(containerStackView!)
        
        if UIDevice.current.orientation.isLandscape {
            landscapeSetup()
        } else {
            portraitSetup()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func portraitSetup() {
        containerStackView?.axis = .vertical
        containerStackView?.distribution = .equalCentering
        containerStackView?.alignment = .center
        containerStackView?.setCustomSpacing(100, after: topContainerStackView!)
        
        self.infoElementsStackView?.setCustomSpacing(100, after: infoElementsTopStack!)
        
        if self.currentConstraints.count != 0 {
            NSLayoutConstraint.deactivate(self.currentConstraints)
        }
        
        if self.rightStackView != nil {
            self.rightStackView!.removeArrangedSubview(self.infoElementsStackView!)
            self.rightStackView!.removeArrangedSubview(self.shareButton)
            self.rightStackView?.removeFromSuperview()
            self.rightStackView = nil
            
            self.containerStackView?.addArrangedSubview(self.infoElementsStackView!)
            self.containerStackView?.addArrangedSubview(self.shareButton)
        }
        
        self.currentConstraints = [
            // container stack view
            NSLayoutConstraint.init(item: containerStackView!, attribute: .centerY, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint.init(item: containerStackView!, attribute: .height, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .height, multiplier: 0.9, constant: 0),
            NSLayoutConstraint.init(item: containerStackView!, attribute: .width, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .width, multiplier: 1, constant: 0),
            
            // info elements stack view
            NSLayoutConstraint.init(item: infoElementsStackView!, attribute: .width, relatedBy: .equal, toItem: containerStackView!.safeAreaLayoutGuide, attribute: .width, multiplier: 0.9, constant: 0),
        ]
        
        NSLayoutConstraint.activate(self.currentConstraints)
    }
    
    private func landscapeSetup() {
        containerStackView?.axis = .horizontal
        containerStackView?.distribution = .equalCentering
        containerStackView?.alignment = .center
        
        if self.currentConstraints.count != 0 {
            NSLayoutConstraint.deactivate(self.currentConstraints)
        }
        
        self.containerStackView?.removeArrangedSubview(self.infoElementsStackView!)
        self.containerStackView?.removeArrangedSubview(self.shareButton)
        
        self.rightStackView = UIStackView(arrangedSubviews: [self.infoElementsStackView!, self.shareButton])
        self.rightStackView?.axis = .vertical
        self.rightStackView?.distribution = .equalCentering
        self.rightStackView?.alignment = .center
        
        self.containerStackView?.addArrangedSubview(self.rightStackView!)
        self.containerStackView?.setCustomSpacing(0, after: self.topContainerStackView!)
        self.infoElementsStackView?.setCustomSpacing(50, after: infoElementsTopStack!)
        
        self.currentConstraints = [
            NSLayoutConstraint(item: containerStackView!, attribute: .centerX, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: containerStackView!, attribute: .width, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .width, multiplier: 0.8, constant: 0),
            NSLayoutConstraint(item: containerStackView!, attribute: .top, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: containerStackView!, attribute: .bottom, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0),
        ]
        
        NSLayoutConstraint.activate(self.currentConstraints)
    }
    
    public func updateLayout() {
        if UIDevice.current.orientation.isLandscape {
            landscapeSetup()
        } else {
            portraitSetup()
        }
    }
}
