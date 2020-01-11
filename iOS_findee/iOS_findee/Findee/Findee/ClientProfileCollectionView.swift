//
//  ClientProfileCollectionView.swift
//  Findee
//
//  Created by михаил on 13/11/2019.
//  Copyright © 2019 михаил. All rights reserved.
//


import UIKit
import FirebaseFirestore
import FirebaseDatabase
import FirebaseStorage

class ClientProfileCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var imageDelegate: ProfileImageDelegate?
    var cell = ClientModel(fname: "", lname: "", oname: "", question: "", img: UIImage() , email: "", type: "client", phone: "")
    
    let customIdentifier = "ProfileClient"
    
    func setDelegate(delegate: ProfileImageDelegate)
    {
        imageDelegate = delegate
    }
    init()
    {
      
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        super.init(frame: .zero, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
       
        register(UINib.init(nibName: customIdentifier, bundle: nil), forCellWithReuseIdentifier: ClientProfileModel.reuseID)
 
        
    }
    
    
    func set(cell: ClientModel)
    {
     self.cell = cell
        
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellProf = dequeueReusableCell(withReuseIdentifier: ClientProfileModel.reuseID, for: indexPath) as! ClientProfileModel
        cellProf.fnameTxtbx.text = cell.fname
        cellProf.lnameTxtbx.text = cell.lname
        cellProf.patronTxtbx.text = cell.oname
        cellProf.phoneTxtbx.text = cell.phone
        cellProf.emailTxtbx.text = cell.email
        cellProf.profImg.image = cell.img
        let storage = Storage.storage()
        let pathRef = storage.reference(withPath: "images/\(UserState.shared.log!)Photo")
        
        
        print(UserState.shared.log!)
       
        pathRef.getData(maxSize: 1 * 4024 * 4024) { data, error in
            if let error = error {
                print(error)
              cellProf.profImg.image = UIImage(named: "Adv1")!
            } else {
                print(data)
                cellProf.profImg.image = UIImage(data: data!)!
                
            }
        }
        
    cellProf.errLable.alpha = 0
        if (imageDelegate != nil)
        {
            cellProf.proto = imageDelegate
        }
        return cellProf
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 700)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
}
