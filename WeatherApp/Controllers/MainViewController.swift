//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Никита Плахин on 9/4/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let currentWeatherVC = ViewController()
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
