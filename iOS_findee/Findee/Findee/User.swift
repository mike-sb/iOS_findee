//
//  User.swift
//  Findee
//
//  Created by михаил on 14/10/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import Foundation

    protocol Auth {
    var login: String? {get set}
    var password: String? {get set}
}

protocol User {
    var name: String? {get set}
    var surname: String? {get set }
    var birth: String? {get set}
    var region: String? {get set}
    var auth: Auth? {get set}
}

