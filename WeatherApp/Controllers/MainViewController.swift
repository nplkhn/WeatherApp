//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Никита Плахин on 9/4/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    private var currentWeatherVC: CurrentWeatherViewController {
        let CWVC = CurrentWeatherViewController()
        let tabBarItem = UITabBarItem(title: "Today", image: UIImage(systemName: "sun.min"), selectedImage: UIImage(systemName: "sun.min.fill"))
        CWVC.tabBarItem = tabBarItem
        return CWVC
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
            
        self.viewControllers = [currentWeatherVC]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
