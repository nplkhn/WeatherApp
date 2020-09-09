//
//  CurrentWeatherViewController.swift
//  WeatherApp
//
//  Created by Никита Плахин on 9/4/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

import UIKit
import CoreLocation

class CurrentWeatherViewController: UIViewController {
    
    var weatherViewModel: CurrentWeatherViewModel? = nil
    var weatherView: CurrentWeatherView? = nil
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .medium)
    
    private var coordinates: CLLocationCoordinate2D
    
    init(coordinates: CLLocationCoordinate2D) {
        self.coordinates = coordinates
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .lightGray
        
        activityIndicator.color = .white
        activityIndicator.center = self.view.center
        
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        getWeatherData()
    }
    
    override func viewWillLayoutSubviews() {
        activityIndicator.center = self.view.center
        
        if let weatherView = weatherView {
            self.view.backgroundColor = .white
            
            weatherView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                NSLayoutConstraint(item: weatherView, attribute: .leading, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: weatherView, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: weatherView, attribute: .trailing, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: weatherView, attribute: .bottom, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0),
            ])
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.weatherView?.updateLayout()
        
    }
}

extension CurrentWeatherViewController {
    
    private func getWeatherData() {
        
        let parser = weatherDataParser()
        parser.parseCurrentWeather(url: "https://api.openweathermap.org/data/2.5/weather?lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=") { (weather) in
            self.weatherViewModel = CurrentWeatherViewModel(currentWeather: weather)
            DispatchQueue.main.async {
                self.weatherView = CurrentWeatherView()
                self.weatherView?.weather = self.weatherViewModel
                self.view.addSubview(self.weatherView!)
                self.activityIndicator.stopAnimating()
            }
            
            
        }
        
    }
    
    @objc func share() {
        
        let activityVC = UIActivityViewController(activityItems: [weatherViewModel!.sharedInfo], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
    
}
