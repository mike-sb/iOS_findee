//
//  ClientCellModel.swift
//  Findee
//
//  Created by михаил on 05/11/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import UIKit

class ClientCellModel: UICollectionViewCell {

    static let reuseID = "ClientCellModel"
    @IBOutlet weak var clientImg: UIImageView!
    @IBOutlet weak var namesLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var dialogBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func fillCell(with model: ClientModel) {
        clientImg.image = model.img
        namesLabel.text = model.lname + " " + model.fname + " " + model.oname
        questionLabel.text = model.question

        /*profileImg.image = model.img
        namesLabel.text = model.lname + " " + model.fname + " " + model.oname
        categoryLabel.text = model.category
        feedbackCount.text = model.feedback
        
        ratingLabel.layer.zPosition=1
        print("frame =/////////////////////////////// ")
        print(ratingImg.frame)
        //    ratingImg.image =  getStars(rate: model.rating)
 */
    }
    
    
    @IBAction func DialogTapped(_ sender: Any) {
        
    }
    
}
