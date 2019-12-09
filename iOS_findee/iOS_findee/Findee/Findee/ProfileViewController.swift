//
//  ProfileViewController.swift
//  Findee
//
//  Created by михаил on 13/11/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ProfileViewController: UIViewController{
 let deco = Decoration()
    
    @IBOutlet weak var logOutBtn: UIBarButtonItem!
    let specProfileView = SpecialistProfileCollectionView()
    let clientProfileView = ClientProfileCollectionView()
    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(UserState.shared.type == UserType.specialist)
        {
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
                    self.specProfileView.reloadData()
                    self.specProfileView.set(cell: spec)
                }
                
            }
        }
        else if(UserState.shared.type == UserType.client){
             clientProfileView.layer.zPosition = 1
            view.addSubview(clientProfileView)
            
            clientProfileView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            
            clientProfileView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            
            clientProfileView.topAnchor.constraint(equalTo: view.topAnchor , constant: 20).isActive = true
            
            clientProfileView.heightAnchor.constraint(equalToConstant: view.frame.height - 40).isActive = true
            
            let email = UserState.shared.log
            networkManager.loadProfileClient(email: email){ (client) in
                self.clientProfileView.reloadData()
                if client.fname != "" && client.lname != ""{
                    self.clientProfileView.reloadData()
                    self.clientProfileView.reloadData()
                    self.clientProfileView.set(cell: client)
                }
            }
            
        }
        else{
            
            let email = UserState.shared.log
            
            clientProfileView.reloadData()
            networkManager.loadProfileClient(email: email){ (client) in
                print("name: \(client.fname)")
                
                DispatchQueue.main.async {
                    
                
               if client.fname != "" && client.lname != ""{
                    self.clientProfileView.set(cell: client)
                 self.clientProfileView.reloadData()
                }
                }
            }
            clientProfileView.layer.zPosition = 1
            view.addSubview(clientProfileView)
            
            clientProfileView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            
            clientProfileView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            
            clientProfileView.topAnchor.constraint(equalTo: view.topAnchor , constant: 20).isActive = true
            
            clientProfileView.heightAnchor.constraint(equalToConstant: view.frame.height - 40).isActive = true
        }
        
    }
    
    @IBAction func logOutTapped(_ sender: Any) {
      
              if( deleteAllData("LoginFindee"))
              {
        
                    
                    navToLoginPage()
                }
                else
                {
                  print("Failure!")
                }
    }
    
    private func deleteAllData(_ entity:String)->Bool {
        let app = UIApplication.shared.delegate as! AppDelegate
        
        let context = app.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        do {
            let results = try context.fetch(fetchRequest)
            for object in results {
                guard let objectData = object as? NSManagedObject else {continue}
                context.delete(objectData)
            }
            return true
        } catch let error {
            print("Detele all data in \(entity) error :", error)
            return false
        }
    }

    private func navToLoginPage()
    {
        let loginStrBrd = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let loginNavigationVC = loginStrBrd.instantiateViewController(withIdentifier: "LoginViewController") as?
            LoginViewController else {
                return
        }
        
      present(loginNavigationVC,animated: true, completion: nil)
    }
    
}
