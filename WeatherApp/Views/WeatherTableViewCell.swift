//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Никита Плахин on 9/9/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    public let timeLabel: UILabel = UILabel()
    public let weatherTypeLabel: UILabel = UILabel()
    public let temperatureLabel: UILabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        timeLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        weatherTypeLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        temperatureLabel.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        
        let infoStack = UIStackView(arrangedSubviews: [timeLabel, temperatureLabel])
        infoStack.axis = .vertical
        infoStack.distribution = .equalCentering
        infoStack.alignment = .center
        infoStack.spacing = 10
        
        infoStack.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(infoStack)
        self.contentView.addSubview(temperatureLabel)
        
        NSLayoutConstraint.activate([
            // temperature label
            NSLayoutConstraint(item: temperatureLabel, attribute: .top, relatedBy: .equal, toItem: self.contentView.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: temperatureLabel, attribute: .trailing, relatedBy: .equal, toItem: self.contentView.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: temperatureLabel, attribute: .bottom, relatedBy: .equal, toItem: self.contentView.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: temperatureLabel, attribute: .width, relatedBy: .equal, toItem: self.contentView.safeAreaLayoutGuide, attribute: .height, multiplier: 1, constant: 0),
            
            // info stack
            NSLayoutConstraint(item: infoStack, attribute: .top, relatedBy: .equal, toItem: self.contentView.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: temperatureLabel, attribute: .leading, relatedBy: .equal, toItem: self.contentView.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: temperatureLabel, attribute: .bottom, relatedBy: .equal, toItem: self.contentView.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: temperatureLabel, attribute: .trailing, relatedBy: .equal, toItem: temperatureLabel, attribute: .leading, multiplier: 1, constant: 0),
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
}
