//
//  SpecialistProfileCollectionView.swift
//  Findee
//
//  Created by михаил on 13/11/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import UIKit

class SpecialistProfileCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var cell = SpecialistModel(job: "", rating: 0, img: UIImage(named: "Adv1")!, description: "", price: "", fname: "", lname: "", oname: "", category: "", feedback: "", email: "", phone: "", type: "specialist")
    let customIdentifier = "ProfileSpecialist"
    
    init()
    {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
        
        register(UINib.init(nibName: customIdentifier, bundle: nil), forCellWithReuseIdentifier: SpecialistProfileModel.reuseID)
        
    }
    
    
    func set(cell: SpecialistModel)
    {
        self.cell = cell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellProf = dequeueReusableCell(withReuseIdentifier: SpecialistProfileModel.reuseID, for: indexPath) as! SpecialistProfileModel
        
        cellProf.fnameLable.text = cell.fname
        cellProf.lnameLable.text = cell.lname
        cellProf.patronLable.text = cell.oname
        cellProf.descriptionLable.text = cell.description
        cellProf.phoneTxtbx.text = cell.phone
        cellProf.profImg.image = cell.img
        
        return cellProf
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 620)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
