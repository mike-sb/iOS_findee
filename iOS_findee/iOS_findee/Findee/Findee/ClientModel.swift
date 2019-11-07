//
//  ClientModel.swift
//  Findee
//
//  Created by михаил on 05/11/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

struct ClientModel {
    var fname:String
    var lname: String
    var oname: String
    var question: String
    var img: UIImage
    var email: String
  var type = "client"
    
}
