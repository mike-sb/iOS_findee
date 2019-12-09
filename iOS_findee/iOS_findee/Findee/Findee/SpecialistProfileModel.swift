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
    var deco = Decoration()
    @IBOutlet weak var changeInfoBtn: UIButton!
    @IBOutlet weak var phoneTxtbx: UITextField!
    @IBOutlet weak var descriptionLable: UITextField!
    @IBOutlet weak var uploadBtn: UIButton!
    static let reuseID = "SpecialistProfileModel"

    override func awakeFromNib() {
        super.awakeFromNib()
        if var img = profImg{
            img = deco.img(img: img)
            self.contentView.addSubview(img)
        }
        if var btn = changeInfoBtn{
            btn=deco.Btn(btn: btn)
            self.contentView.addSubview(btn)
        }
        if var btn = changeProfImgBtn {
            btn = deco.Btn(btn: btn)
            self.contentView.addSubview(btn)
        }
        if var btn = uploadBtn{
            btn = deco.Btn(btn: btn)
            self.contentView.addSubview(btn)
        }
        if let txt = fnameLable{
            self.contentView.addSubview(txt)
        }
        if let txt = lnameLable{
            self.contentView.addSubview(txt)
        }
        if let txt = patronLable{
            self.contentView.addSubview(txt)
        }
        if let txt = phoneTxtbx{
            self.contentView.addSubview(txt)
        }
        if let txt = descriptionLable{
            self.contentView.addSubview(txt)
        }
    
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
