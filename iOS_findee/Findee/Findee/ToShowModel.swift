//
//  ToShowModel.swift
//  Findee
//
//  Created by михаил on 03/12/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import UIKit

class ToShowModel: UICollectionViewCell {
    
    static let reuseID = "ToShowModel"
    let deco = Decoration()
    @IBOutlet weak var nameLable: UILabel!
    
    @IBOutlet weak var surnameLable: UILabel!
    
    @IBOutlet weak var patronLable: UILabel!
    @IBOutlet weak var categoryLable: UILabel!
    @IBOutlet weak var cityLable: UILabel!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var emailLable: UILabel!
    @IBOutlet weak var phoneLable: UILabel!
    @IBOutlet weak var profImg: UIImageView!
     var delegate: ToShowDelegate?
    @IBOutlet weak var cancelBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //...layer.shadowOffset
        if var btn = cancelBtn{
          btn = deco.Btn(btn: btn)
        contentView.addSubview(btn)
        }
        if var img = profImg{
            img = deco.img(img: img)
            contentView.addSubview(img)
        }
    }
    func setDelegate(_delegate: ToShowDelegate)
    {
        delegate = _delegate
    }
    @IBAction func cancelTapped(_ sender: Any) {
        if delegate != nil{
            self.delegate?.cancelDidTapped()
        }
        
    }
}
