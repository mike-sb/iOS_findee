//
//  SpecialistModel.swift
//  Findee
//
//  Created by михаил on 18/10/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import Foundation

import UIKit
import Firebase
import FirebaseDatabase
 //var ref: DatabaseReference!
 // var ref: DatabaseReference! = Database.database().reference()
struct SpecialistModel {
  
  
    var job: String
    var rating: Double
    var img: UIImage
    var description: String
    var price: String
    var fname: String
    var lname: String
    var oname: String
    var category: String
    var feedback: String
    var email: String
    var phone: String
    var type = "specialist"
   
  /*  func fetchAuthUser() {
        //authorized user
        let userID = Firebase.Auth.auth().currentUser?.uid
        ref.child("users").child(userID!).observeSingleEvent(of: .value, with: {(snapshot) in
            let val = snapshot.value as? NSDictionary
            
            job = val?[""] as? String ?? " ")
            
            self.rating = val?[""] as? Double ?? 0
            self.img = val?[""] as? UIImage ?? UIImage(named: "Adv1")!
            self.description = val?[""] as? String ?? " "
            self.price = val?[""] as? String ?? " "
            self.fname = val?[""] as? String ?? " "
            self.lname = val?[""] as? String ?? " "
            self.oname = val?[""] as? String ?? " "
            self.category = val?[""] as? String ?? " "
            self.feedback = val?[""] as? String ?? " "
            
        }){(error) in
            print(error.localizedDescription)
        }
       
        
    }
    */
    
    
}
