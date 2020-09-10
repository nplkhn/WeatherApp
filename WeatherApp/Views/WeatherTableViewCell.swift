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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        timeLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        weatherTypeLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        temperatureLabel.font = UIFont.systemFont(ofSize: 40, weight: .regular)
        temperatureLabel.textAlignment = .center
        temperatureLabel.textColor = .systemBlue
        temperatureLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        //        self.textLabel = weatherTypeLabel
        //        self.detailTextLabel = timeLabel
        
        let infoStack = UIStackView(arrangedSubviews: [timeLabel, weatherTypeLabel])
        infoStack.axis = .vertical
        infoStack.distribution = .equalCentering
        infoStack.alignment = .fill
        
        let containerStackView = UIStackView(arrangedSubviews: [infoStack, temperatureLabel])
        containerStackView.axis = .horizontal
        containerStackView.distribution = .fill
        containerStackView.alignment = .center
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        addSubview(containerStackView)
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: containerStackView, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: containerStackView, attribute: .leading, relatedBy: .equal, toItem: self.imageView, attribute: .trailing, multiplier: 1.1, constant: 0),
            NSLayoutConstraint(item: containerStackView, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: containerStackView, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 0.95, constant: 0),
        ])
        
        self.isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
}
