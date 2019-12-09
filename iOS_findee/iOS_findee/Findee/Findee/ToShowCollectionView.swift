//
//  ToShowCollectionView.swift
//  Findee
//
//  Created by михаил on 03/12/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import UIKit

class ToShowCollectionView:
    UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var email = ""
    var deleg: ToShowDelegate?
    var cell = SpecialistModel(job: "", rating: 0, img: UIImage(named: "Adv1")!, description: "", price: "", fname: "", lname: "", oname: "", category: "", feedback: "", email: "", phone: "", type: "specialist")
    let customId = "ProfileToShow"
    
    init()
{
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    super.init(frame: .zero, collectionViewLayout: layout)
    delegate = self
    dataSource = self
    backgroundColor = .white
    translatesAutoresizingMaskIntoConstraints = false
    print("here3")
    
    register(UINib.init(nibName: customId, bundle: nil), forCellWithReuseIdentifier: ToShowModel.reuseID)
    
    }
    func setDelegate(del: ToShowDelegate)
{
    self.deleg = del
    }
    
    func set(cell: SpecialistModel)
{
    self.cell = cell
    

    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cellProf = dequeueReusableCell(withReuseIdentifier: ToShowModel.reuseID, for: indexPath) as! ToShowModel
        
     
      cellProf.nameLable.text = cell.fname
       cellProf.surnameLable.text = cell.lname
        cellProf.patronLable.text = cell.oname
        cellProf.descriptionText.text = cell.description
        cellProf.phoneLable.text = cell.phone
        cellProf.profImg.image = cell.img
        cellProf.phoneLable.text = cell.phone
        cellProf.emailLable.text = cell.email
    cellProf.delegate = deleg
        
    return cellProf
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: frame.width, height: 620)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    }
    
}
