//
//  PhotoCollectionViewCell.swift
//  Findee
//
//  Created by михаил on 11/11/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import Foundation
import UIKit

class PhotoCollectionViewCell:UICollectionViewCell{
    //temporary class. Later will be changed
    
    static let reusedID = "PhotoCollectionViewCell"
  //  let customIdentifier = "PhotoCell"
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(mainImageView)
   
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
