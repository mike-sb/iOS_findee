//
//  MainPageViewController.swift
//  Findee
//
//  Created by михаил on 08/10/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
//var ref: DatabaseReference!
protocol MainPageDelegate
{
    func profileButtonDidTapped(cell: SpecialistModel)
    func chatButtonTapped()
    
}
  
var specs = [SpecialistModel]()
var clients = [ClientModel]()
class MainPageViewController: UIViewController, MainPageDelegate {
  
    
    
    //masorny

    var userType: UserType = .specialist
    
    @IBOutlet weak var findeeTabBarItem: UITabBarItem!
    
    @IBOutlet weak var searchField: UISearchBar!
    
    @IBOutlet weak var findBtn: UIButton!
    //view controllers
    private var SpecCollectionView = SpecialistCollectionView()
    private var ClCollectionView = ClientCollectionView()
    //networking
    private var networkManager = NetworkManager()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.addSubview(SpecCollectionView)
        userType = (UserState.shared.type)!
        //fetching specialist or/and users from DB
        
        switch (userType) {

        case .client:
           
           SpecCollectionView.setDelegate(delegate: self)
            view.addSubview(SpecCollectionView)
           
            SpecCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            
            SpecCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            
            SpecCollectionView.topAnchor.constraint(equalTo: searchField.bottomAnchor , constant: 2).isActive = true
            
            SpecCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height - searchField.frame.height - 20).isActive = true
            
            searchField.layer.zPosition = 1
            
            networkManager.loadDataSpecialists { (specs) in
             
                if !specs.isEmpty{
                    DispatchQueue.main.async {
                        
                        self.SpecCollectionView.set(cells: specs)
                          self.SpecCollectionView.reloadData()
                    }
                }
                
            }
            
            
        case .specialist:
           
            view.addSubview(ClCollectionView)
            
            ClCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            
            ClCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            
            ClCollectionView.topAnchor.constraint(equalTo: searchField.bottomAnchor , constant: 2).isActive = true
            
            ClCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height - searchField.frame.height - 20).isActive = true
            searchField.isHidden = true
            findBtn.isHidden = true
            
            
            networkManager.loadDataClients { (usr) in
                self.ClCollectionView.reloadData()
                if !usr.isEmpty{
                    DispatchQueue.main.async {
                         var cli = [ClientModel]()
                        
                        for u in usr
                        {
                            if(u.question != "" && u.question != nil)
                            {
                            cli.append(u)
                            }
                        }
                    self.ClCollectionView.set(cells: cli)
                         self.ClCollectionView.reloadData()
                        
                    }
                }
                
            }
           
        case .admin://///vremenno
            
          SpecCollectionView.setDelegate(delegate:  self)
            view.addSubview(SpecCollectionView)
            
            SpecCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            
            SpecCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            
            SpecCollectionView.topAnchor.constraint(equalTo: searchField.bottomAnchor , constant: 2).isActive = true
            
            SpecCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height - searchField.frame.height - 20).isActive = true
            
            searchField.layer.zPosition = 1
            networkManager.loadDataSpecialists { (specs) in
                DispatchQueue.main.async {
                    
              
                if !specs.isEmpty{
            //        let delegate = MainPageDelegate()
                    self.SpecCollectionView.set(cells: specs)
                     self.SpecCollectionView.reloadData()
                    
                    }
                }
            }
            break
            
        default:
            print("failed")
        }
        
        
    
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
   


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    func chatButtonTapped() {
        
        self.tabBarController?.selectedIndex = 2
        
    }
    
    func profileButtonDidTapped(cell: SpecialistModel)
    {
        
        
         let strBrd = UIStoryboard(name: "MainPage", bundle: Bundle.main)
         guard let profileVC = strBrd.instantiateViewController(withIdentifier: "profileToShow") as?
         ProfileToShowViewController else {
         return
         }
       profileVC.toShow = true
        profileVC.cell = cell
    
        show(profileVC, sender: ProfileToShowViewController())
        
        
        
    }}


