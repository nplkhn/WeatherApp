//
//  InfoElement.swift
//  WeatherApp
//
//  Created by Никита Плахин on 9/5/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

import UIKit

class InfoElement: UIStackView {
    
    let imageView: UIImageView?
    let textLabel: UILabel?
    
    init(image: UIImage, text: String) {
        imageView = UIImageView(image: image)
        
        textLabel = UILabel()
        textLabel?.text = text
        textLabel?.textAlignment = .center
        textLabel?.font = UIFont.systemFont(ofSize: 18, weight: .light)
        
        super.init(frame: .zero)
        
        self.addArrangedSubview(imageView!)
        self.addArrangedSubview(textLabel!)
        self.axis = .vertical
        self.distribution = .fillEqually
    }
    
    override init(frame: CGRect) {
        imageView = UIImageView()
        textLabel = UILabel()
        
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
