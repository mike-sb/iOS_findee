//
//  MainTabBarController.swift
//  Findee
//
//  Created by михаил on 21/10/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import UIKit

enum UserType {
    case specialist
    case client
    case admin
}

class MainTabBarController: UITabBarController {

    @IBOutlet weak var tabBarFnd: UITabBar!
    
   public var userType: UserType = .specialist
 
    override func viewDidLoad() {
        super.viewDidLoad()

tabBarFnd.layer.zPosition = 1
        tabBarFnd.alpha = 1
        tabBarFnd.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    func setIndex(ind: Int)
    {
        selectedIndex = ind
    }

}
