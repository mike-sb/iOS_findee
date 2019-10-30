//
//  SpecialistCollectionViewCell.swift
//  Findee
//
//  Created by михаил on 18/10/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import UIKit

class SpecialistCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "SpecialistCollectionViewCell"
  let imageViewCell: UIImageView =
    {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageViewCell)
        imageViewCell.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageViewCell.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageViewCell.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageViewCell.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
