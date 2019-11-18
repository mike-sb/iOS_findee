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
import FirebaseDatabase
//var ref: DatabaseReference!
var referen: DatabaseReference! = Database.database().reference()


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
        
        ratingLabel.layer.zPosition=1
        print("frame =/////////////////////////////// ")
        print(ratingImg.frame)
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
        //goto dialog with specialist
    }
    
    @IBAction func profileDidTap(_ sender: Any) {
       //goto profile of specialist
        referen.child("findee-32534").observe(.childAdded, with: {(snapshot) in
            let val = snapshot.value as? NSDictionary
            var user = SpecialistModel(job: "", rating: 0, img: UIImage(named: "Adv1")!, description: "", price: "", fname: "", lname: "", oname: "", category: "", feedback: "", email: "", phone: "", type: "specialist")
            user.category = val?["category"] as? String ?? ""
            user.description = val?["description"] as? String ?? ""
            user.fname = val?["fname"] as? String ?? ""
            user.lname = val?["lname"] as? String ?? ""
            user.oname = val?["oname"] as? String ?? ""
            user.price = val?["price"] as? String ?? ""
            user.rating = val?["rating"] as? Double ?? 0
            user.img = val?["img"] as? UIImage ?? UIImage(named: "Adv1")!
            user.feedback = val?["feedback"] as? String ?? ""
            user.job = val?["job"] as? String ?? ""
           // self.users.append(user)
        })    }
}

