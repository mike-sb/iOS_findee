//
//  SpecialistCollectionView.swift
//  Findee
//
//  Created by михаил on 18/10/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import UIKit

class SpecialistCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var mainDelegate: MainPageDelegate?
    var cells = [SpecialistModel]()
    let customIdentifier = "SpecialistCell"
    init()
    {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        backgroundColor = .white
 translatesAutoresizingMaskIntoConstraints = false

  
        register(UINib.init(nibName: customIdentifier, bundle: nil), forCellWithReuseIdentifier: SpecialistCellModel.reuseID)
        
    }
    
    
    func set(cells: [SpecialistModel])
    {
     self.cells = cells
    
    }
    
    func setDelegate(delegate: MainPageDelegate)
    {
        self.mainDelegate = delegate
        
    }
  
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: SpecialistCellModel.reuseID, for: indexPath) as! SpecialistCellModel
        
        cell.profileImg.image = cells[indexPath.row].img
        cell.categoryLabel.text = cells[indexPath.row].category
        cell.namesLabel.text = cells[indexPath.row].lname + " " +  cells[indexPath.row].fname + " " + cells[indexPath.row].oname
        cell.feedbackCount.text = cells[indexPath.row].feedback
        cell.email = cells[indexPath.row].email
        cell.cellToShow = cells[indexPath.row]
        if mainDelegate != nil{
        cell.delegate = mainDelegate
        }
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
