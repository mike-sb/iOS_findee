//
//  SpecialistCollectionView.swift
//  Findee
//
//  Created by михаил on 18/10/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import UIKit

class SpecialistCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cells = [SpecialistModel]()
    let customIdentifier = "SpecialistCellModel"
    
    init()
    {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        backgroundColor = .white
 translatesAutoresizingMaskIntoConstraints = false
    register(SpecialistCollectionViewCell.self, forCellWithReuseIdentifier: SpecialistCollectionViewCell.reuseID)
  
        //register(UINib.init(nibName: customIdentifier, bundle: nil), forCellWithReuseIdentifier: SpecialistCollectionViewCell.reuseID)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10//cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: SpecialistCollectionViewCell.reuseID, for: indexPath) //as! SpecialistCollectionViewCell
       // cell.imageViewCell.image = cells[indexPath.row].img
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 200)
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
/*
extension TableView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = modelArray[indexPath.row]
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: customIdentifier, for: indexPath)
        if let customTableViewCell = tableViewCell as? TableViewCell {
            customTableViewCell.fillCell(with: model)
        }
        return tableViewCell
    }
    
    
}
*/
