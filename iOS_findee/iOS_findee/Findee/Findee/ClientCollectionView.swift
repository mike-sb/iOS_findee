//
//  ClientCollectionView.swift
//  Findee
//
//  Created by михаил on 05/11/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import Foundation
import UIKit

class ClientCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var cells = [ClientModel]()
    let customIdentifier = "ClientCellModel"
    
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
    
    
    func set(cells: [ClientModel])
    {
        self.cells = cells
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: ClientCellModel.reuseID, for: indexPath) as! ClientCellModel
        
        cell.clientImg.image = cells[indexPath.row].img
        cell.questionLabel.text = cells[indexPath.row].question
        cell.namesLabel.text = cells[indexPath.row].lname + " " +  cells[indexPath.row].fname + " " + cells[indexPath.row].oname
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 180)    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
