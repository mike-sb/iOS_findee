//
//  Decoration.swift
//  Findee
//
//  Created by михаил on 01/12/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import Foundation
import UIKit

class Decoration {
  
    func img(img: UIImageView)-> UIImageView {
        img.layer.cornerRadius = img.frame.size.width/2
        img.clipsToBounds = true
        img.layer.borderWidth = 2
        img.layer.borderColor = UIColor(red: 0, green: 88, blue: 136, alpha: 1.0).cgColor
    return img
    }
    
    func Btn(btn: UIButton)->UIButton
    {

        btn.layer.backgroundColor = #colorLiteral(red: 0.04577457504, green: 0.6925668637, blue: 1, alpha: 1)
        btn.setTitleColor(#colorLiteral(red: 0.9233013422, green: 0.997988368, blue: 1, alpha: 1),for: .normal)
    
    btn.layer.cornerRadius = 5
        return btn
    }

}
