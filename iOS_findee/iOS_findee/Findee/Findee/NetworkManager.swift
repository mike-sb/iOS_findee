//
//  NetworkManager.swift
//  Findee
//
//  Created by михаил on 06/11/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseDatabase
import FirebaseStorage

class FirebaseService: NSObject {
    let configure = FirebaseApp.configure()
    static let shared = FirebaseService()
    
   override init() {
    super.init()
    }
}

final class NetworkManager{
 
    func loadDataSpecialists(completion: @escaping ([SpecialistModel]) -> Void) {
        let conf = FirebaseService.shared.configure
        let db = Firestore.firestore()
        let storage = Storage.storage()
        db.collection("specialists").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                return
            } else {
                var specs = [SpecialistModel]()
                if !querySnapshot!.isEmpty {
                    
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        let val = document.data() as? NSDictionary
                        
                        var user = SpecialistModel(job: "", rating: 0, img: UIImage(named: "Adv1")!, description: "", price: "", fname: "", lname: "", oname: "", category: "", feedback: "", email: "", type: "speciali")
                        
                        user.category = val?["category"] as? String ?? ""
                        user.description = val?["description"] as? String ?? ""
                        user.fname = val?["fname"] as? String ?? ""
                        user.lname = val?["lname"] as? String ?? ""
                        user.oname = val?["oname"] as? String ?? ""
                        user.price = val?["price"] as? String ?? ""
                        user.rating = val?["rating"] as? Double ?? 0
                        user.feedback = val?["feedback"] as? String ?? ""
                        user.job = val?["job"] as? String ?? ""
                        user.email = val?["email"] as? String ?? ""
                        
                        //downloading img for profile
                        let pathRef = storage.reference(withPath: "images/\(val?["img"] ?? UIImage(named: "Adv1")!)")
                        
                        pathRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
                            if let error = error {
                                print(error)
                            } else {
                                // Data for "images/island.jpg" is returned
                                user.img = UIImage(data: data!) ?? UIImage(named: "Adv1")!
                            }
                        }
                        
                        specs.append(user)
                    }
                    completion(specs)
                    
                }
                else{
                    completion([])
                }
            }
        }    }
    
    func loadDataClients(complection: @escaping ([ClientModel])->Void){
        let conf = FirebaseService.shared.configure
        let db = Firestore.firestore()
        let storage = Storage.storage()
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                return
            } else {
                let users=[ClientModel]()
                if !querySnapshot!.isEmpty {
                    
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        let val = document.data() as? NSDictionary
                        
                        var user = ClientModel(fname: "", lname: "", oname: "", question: "", img:  UIImage(named: "Adv1")!, email: "", type: "client")
                        
                        user.fname = val?["fname"] as? String ?? ""
                        user.lname = val?["lname"] as? String ?? ""
                        user.oname = val?["oname"] as? String ?? ""
                        user.question = val?["question"] as? String ?? ""
                        user.email = val?["email"] as? String ?? ""
                        //downloading img for profile
                        user.img =/* UIImage(named: val?["email"] ) ??*/ UIImage(named: "Adv1")!
                        
                         /*       let pathRef = storage.reference(withPath: "images/\(val?["img"] ?? UIImage(named: "Adv1")!)")
                         
                         pathRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
                         if let error = error {
                         print(error)
                         } else {
                         
                         user.img = UIImage(data: data!) ?? UIImage(named: "Adv1")!
                         }
                         }*/
                        
                        
                        clients.append(user)
                    }
                    complection(users)
                    
                }
                else{
                    complection([])
                }
            }
        }
    }
    
  }
