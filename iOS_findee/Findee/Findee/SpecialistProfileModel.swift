//
//  SpecialistProfileModel.swift
//  Findee
//
//  Created by михаил on 13/11/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import UIKit

class SpecialistProfileModel: UICollectionViewCell {
    
    @IBOutlet weak var emailTxtBx: UITextField!
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
    let networkManager = NetworkManager()
       var proto: ProfileImageDelegate?
      var spec = SpecialistModel(job: "", rating: 0, img: UIImage(), description: "", price: "", fname: "", lname: "", oname: "", category: "", feedback: "", email: "", phone: "", type: "specialist")
    func setDelegate(delegate: ProfileImageDelegate)
    {
        proto = delegate
    }

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
            btn.alpha = 0
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
        if let txt = emailTxtBx{
            self.contentView.addSubview(txt)
        }
        
    }
    
    func fillCell(with model: SpecialistModel){
        spec = model
    fnameLable.text = model.fname
        lnameLable.text = model.lname
        patronLable.text = model.oname
        profImg.image = model.img
        descriptionLable.text = model.description
        emailTxtBx.text = model.email
        phoneTxtbx.text = model.phone
    }
    
    @IBAction func loadProfImg(_ sender: Any) {
        if proto != nil{
            self.proto?.changeImage(sender: sender as! UIView)
        }
        
           let user =  SpecialistModel(job: spec.job, rating: spec.rating, img: profImg.image!, description: descriptionLable.text!, price: spec.price, fname: fnameLable.text!, lname: lnameLable.text!, oname: patronLable.text ?? "", category: spec.category, feedback: spec.feedback, email: emailTxtBx.text!, phone: phoneTxtbx.text ?? "", type: "specialist")
        networkManager.saveProfileSpecialistChanges(email: UserState.shared.log, user: user){
            (fl) in
            if fl
            {
                print("okkkk")
                
            }
            else{
                print("smthing went wrong")
            }
        }
    }
    
    @IBAction func changesSaveTapped(_ sender: Any) {
        let user =  SpecialistModel(job: spec.job, rating: spec.rating, img: profImg.image!, description: descriptionLable.text!, price: spec.price, fname: fnameLable.text!, lname: lnameLable.text!, oname: patronLable.text ?? "", category: spec.category, feedback: spec.feedback, email: emailTxtBx.text!, phone: phoneTxtbx.text ?? "", type: "specialist")

        print("changes tapped: \(user)")
        
        networkManager.saveProfileSpecialistChanges(email: UserState.shared.log, user: user){
            (fl) in
            
            if fl
            {
                print("okkkk")
                
            }
            else{
                print("smthing went wrong")
            }
        }
    }
    
}


extension SpecialistProfileModel: ImagePickerDelegate {
    
    func didSelect(image: UIImage?) {
        self.profImg.image = image
    }
}
