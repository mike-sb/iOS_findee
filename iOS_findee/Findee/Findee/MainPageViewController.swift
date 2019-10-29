//
//  MainPageViewController.swift
//  Findee
//
//  Created by михаил on 08/10/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {
    
    //masorny
   
    @IBOutlet weak var findeeTabBarItem: UITabBarItem!
    
    @IBOutlet weak var searchField: UISearchBar!
    
    private var SpecCollectionView = SpecialistCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    view.addSubview(SpecCollectionView)
       // view.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 200)
        SpecCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        SpecCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
 // SpecCollectionView.topAnchor.constraint(equalTo: searchField.bottomAnchor , constant: 120)
 
    //    SpecCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
            SpecCollectionView.topAnchor.constraint(equalTo: searchField.bottomAnchor , constant: 2).isActive = true
        
 SpecCollectionView.heightAnchor.constraint(equalToConstant: view.frame.height - searchField.frame.height - 20).isActive = true
        
        searchField.layer.zPosition = 1
          print(SpecCollectionView.layer.zPosition)
        
    }
    
    
    //otobrazhenie yacheek(zagruzka dannih)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpecialistCellModel", for: indexPath) as! SpecialistCellModel
        //cell.postTitle.text = posts[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0 //posts.count
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}

