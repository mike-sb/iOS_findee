//
//  ProfileToShowViewController.swift
//  Findee
//
//  Created by михаил on 24/11/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import UIKit
import CoreData

class ProfileToShowViewController: UIViewController {

    let specProfileView = SpecialistProfileCollectionView()
    let networkManager = NetworkManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(specProfileView)
        
        specProfileView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        specProfileView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        specProfileView.topAnchor.constraint(equalTo: view.topAnchor , constant: 20).isActive = true
        
        specProfileView.heightAnchor.constraint(equalToConstant: view.frame.height  - 40).isActive = true
        let email = UserState.shared.log!
        
        networkManager.loadProfileSpecialists(email: email) { (spec) in
            self.specProfileView.reloadData()
            if spec.fname != ""&&spec.lname != ""{
                self.specProfileView.reloadData()
                self.specProfileView.set(cell: spec)
            }
            
        }    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
