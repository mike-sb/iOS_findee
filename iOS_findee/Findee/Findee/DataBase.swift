//
//  DataBase.swift
//  Findee
//
//  Created by михаил on 14/10/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import Foundation
import UIKit

protocol Auth {
    var login: String? {get set}
    var password: String? {get set}
}

class User {
  //  var name: String?
    var surname: String?
    var birth: String?
    var region: String?
    var auth: Auth?
    
}



class Client: User{
//TO DO

}

/*class Specialist: User{
   
 override init() {
    }
    //TO DO
}
*/

//database connection


