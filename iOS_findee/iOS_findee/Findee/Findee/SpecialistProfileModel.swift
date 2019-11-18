//
//  SpecialistProfileModel.swift
//  Findee
//
//  Created by михаил on 13/11/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import UIKit

class SpecialistProfileModel: UICollectionViewCell {
    
    @IBOutlet weak var fnameLable: UITextField!
    @IBOutlet weak var lnameLable: UITextField!
    @IBOutlet weak var patronLable: UITextField!
    @IBOutlet weak var profImg: UIImageView!
    @IBOutlet weak var changeProfImgBtn: UIButton!
    
    @IBOutlet weak var changeInfoBtn: UIButton!
    @IBOutlet weak var phoneTxtbx: UITextField!
    @IBOutlet weak var descriptionLable: UITextField!
    @IBOutlet weak var uploadBtn: UIButton!
    static let reuseID = "SpecialistProfileModel"
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillCell(with model: SpecialistModel){
    fnameLable.text = model.fname
        lnameLable.text = model.lname
        patronLable.text = model.oname
        profImg.image = model.img
        descriptionLable.text = model.description
        phoneTxtbx.text = model.phone
    }
}
