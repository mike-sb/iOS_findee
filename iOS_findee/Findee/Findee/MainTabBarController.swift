//
//  MainTabBarController.swift
//  Findee
//
//  Created by михаил on 21/10/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    @IBOutlet weak var tabBarFnd: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
tabBarFnd.layer.zPosition = 1
        tabBarFnd.alpha = 1
        tabBarFnd.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    

}
