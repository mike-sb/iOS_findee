//
//  ProfileToShowViewController.swift
//  Findee
//
//  Created by михаил on 24/11/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import UIKit
import CoreData

protocol ToShowDelegate
{
   func cancelDidTapped()
    
}

class ProfileToShowViewController: UIViewController, ToShowDelegate {

    let specProfileView = SpecialistProfileCollectionView()
    let networkManager = NetworkManager()
    let toShowView = ToShowCollectionView()
     var cell = SpecialistModel(job: "", rating: 0, img: UIImage(named: "Adv1")!, description: "", price: "", fname: "", lname: "", oname: "", category: "", feedback: "", email: "", phone: "", type: "specialist")
    var mail = ""
    var toShow = false
    
    func cancelDidTapped()
    {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        print("2")
        super.viewDidLoad()
        toShowView.setDelegate(del: self)
        toShowView.set(cell: cell)
        toShowView.reloadData()
        view.addSubview(toShowView)
        toShowView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        toShowView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        toShowView.topAnchor.constraint(equalTo: view.topAnchor , constant: 20).isActive = true
        
        toShowView.heightAnchor.constraint(equalToConstant: view.frame.height  - 40).isActive = true

            
           
            print("cell: ")
            print(cell)
        
        /*
            networkManager.loadProfileSpecialists(email: mail) { (spec) in
               
                if spec.fname != ""&&spec.lname != ""{
        
                DispatchQueue.main.async{
                    
                    print("here email: ")
                    print(spec.email)
                    self.toShowView.set(cell: spec)
                    self.toShowView.reloadData()
                    
                    }
                }
                else
                {
                print(spec)
                }
 
            }
            */
       /* else{
            print("kk")
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
            
        }
        }*/
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
