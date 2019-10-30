//
//  SpecialistCellModel.swift
//  Findee
//
//  Created by михаил on 29/10/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class SpecialistCellModel: UICollectionViewCell{
    
      static let reuseID = "SpecialistCellModel"
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var namesLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var dialogBtn: UIButton!
    @IBOutlet weak var profileBtn: UIButton!

    @IBOutlet weak var feedbackCount: UILabel!
    @IBOutlet weak var ratingImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillCell(with model: SpecialistModel) {
      profileImg.image = model.img
        namesLabel.text = model.lname + " " + model.fname + " " + model.oname
        categoryLabel.text = model.category
        feedbackCount.text = model.feedback
    //    ratingImg.image =  getStars(rate: model.rating)
    }
  
    /*private func getStars(rate: Double) -> UIImage
    {
     let ImgRate: UIImage = UIImage
    switch rate {
        case 0:
           // ImgRate =
            break
        case 0.5:
            //ImgRate =
            break
        case 1:
            //ImgRate =
break
        case 1.5:
            //ImgRate =
break
        case 2:
            //ImgRate =
break
        case 2.5:
            //ImgRate =
break
        case 3:
            //ImgRate
break
        case 3.5:
            //ImgRate =
break
        case 4:
            //ImgRate =
break
        case 4.5:
            //ImgRate =
break
        case 5:
            //ImgRate =
            break
        default:
           // ImgRate = UIImage?(named: "")
        }
     
        return ImgRate
    }*/
    
    @IBAction func dialogDidTap(_ sender: Any) {
    }
    
    @IBAction func profileDidTap(_ sender: Any) {
    }
}

