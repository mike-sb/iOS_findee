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
                        
                        var user = SpecialistModel(job: "", rating: 0, img: UIImage(), description: "", price: "", fname: "", lname: "", oname: "", category: "", feedback: "", email: "", phone: "", type: "speciali")
                        
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
                      
                        specs.append(user)
                    }
                    completion(specs)
                    
                }
                else{
                    completion([])
                }
            }
        }
        
    }
    
    func loadDataClients(completion: @escaping ([ClientModel])->Void){
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
                       let ask = val?["question"] as? String
                        if(ask != "")
                        {
                        var user = ClientModel(fname: "", lname: "", oname: "", question: "", img:  UIImage(), email: "", type: "client", phone: "")
                        
                        user.fname = val?["fname"] as? String ?? ""
                        user.lname = val?["lname"] as? String ?? ""
                        user.oname = val?["oname"] as? String ?? ""
                        user.question = val?["question"] as? String ?? ""
                        user.email = val?["email"] as? String ?? ""
                    
                        
                        
                        clients.append(user)
                        }
                    }
                    completion(users)
                    
                }
                else{
                    completion([])
                }
            }
        }
    }
    
    func loadProfileClients(completion: @escaping ([ClientModel])->Void){
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
                        
                        var user = ClientModel(fname: "", lname: "", oname: "", question: "", img:  UIImage(), email: "", type: "client", phone: "")
                        
                        user.fname = val?["fname"] as? String ?? ""
                        user.lname = val?["lname"] as? String ?? ""
                        user.oname = val?["oname"] as? String ?? ""
                        user.question = val?["question"] as? String ?? ""
                        user.email = val?["email"] as? String ?? ""
                        //downloading img for profile
               //         user.img =/* UIImage(named: val?["email"] ) ??*/ UIImage(named: "Adv1")!
                
                        
                        clients.append(user)
                    }
                    completion(users)
                    
                }
                else{
                    completion([])
                }
            }
        }
    }
    
    func loadProfileSpecialists(email: String?, completion: @escaping (SpecialistModel) -> Void) {
        let conf = FirebaseService.shared.configure
        let db = Firestore.firestore()
        let storage = Storage.storage()
        db.collection("specialists").whereField("email", isEqualTo:  email).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                return
            } else {
                var spec = SpecialistModel(job: "", rating: 0, img: UIImage(), description: "", price: "", fname: "", lname: "", oname: "", category: "", feedback: "", email: "", phone: "", type: "specialist")
                if !querySnapshot!.isEmpty {
                    
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        let val = document.data() as? NSDictionary
                        
        
                        
                        spec.category = val?["category"] as? String ?? ""
                        spec.description = val?["description"] as? String ?? ""
                        spec.fname = val?["fname"] as? String ?? ""
                        spec.lname = val?["lname"] as? String ?? ""
                        spec.oname = val?["oname"] as? String ?? ""
                        spec.price = val?["price"] as? String ?? ""
                        spec.rating = val?["rating"] as? Double ?? 0
                        spec.feedback = val?["feedback"] as? String ?? ""
                        spec.job = val?["job"] as? String ?? ""
                        spec.email = val?["email"] as? String ?? ""
                        
                        
                    }
                    completion(spec)
                    
                }
                else{
                    completion(SpecialistModel(job: "", rating: 0, img: UIImage(), description: "", price: "", fname: "", lname: "", oname: "", category: "", feedback: "", email: "", phone: "", type: "specialist"))
                }
            }
        }
        
    }
    
    func loadProfileClient(email: String?, completion: @escaping (ClientModel)->Void){
        let conf = FirebaseService.shared.configure
        let db = Firestore.firestore()
        let storage = Storage.storage()
        print("email in loader: \(email)")
        db.collection("users").whereField("email", isEqualTo: email).getDocuments()  { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                return
            } else {
               
                var user = ClientModel(fname: "", lname: "", oname: "", question: "", img:  UIImage(), email: "", type: "client", phone: "")
                
                if !querySnapshot!.isEmpty {
                    
                    for document in querySnapshot!.documents {
        
                        
                         let val = document.data() as? NSDictionary
                     
                        print("\(document.documentID) => \(document.data())")
                       
                        
                        user.fname = val?["fname"] as? String ?? ""
                        user.lname = val?["lname"] as? String ?? ""
                        user.oname = val?["oname"] as? String ?? ""
                        user.question = val?["question"] as? String ?? ""
                        user.email = val?["email"] as? String ?? ""
                        user.phone = val?["phone"] as? String ?? ""
                        //downloading img for profile
                     //   user.img =/* UIImage(named: val?["email"] ) ??*/ UIImage(named: "Adv1")!
                        
                        
                     
                    }
                    completion(user)
                }
                else{
                    completion(
                   ClientModel(fname: "", lname: "", oname: "", question: "", img:  UIImage(named: "Adv1")!, email: "", type: "client", phone: ""))
                    
                }
            }
        }
    }
    
    
    
    
    func saveProfileSpecialistChanges(email: String?, user: SpecialistModel,completion: @escaping (Bool) -> Void) {
        let conf = FirebaseService.shared.configure
        let db = Firestore.firestore()
        let storage = Storage.storage()
        
        let starsRef = URL(string: "images/\(user.email)Photo")
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        
        
        var data = Data()
        data = user.img.pngData()!
        
        if user.img != UIImage(named: "Adv1")! {
            
            let storeRef = storage.reference().child("images/\(user.email)Photo")
            storeRef.putData(data,metadata: metadata,completion: {(metadata,error) in
                guard let metadata = metadata else{
                    print(error)
                    return
                }
                print(metadata)
            }
            )
        
        }
        
        db.collection("specialists").whereField("email", isEqualTo:  email).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                return
            } else {
                var spec = SpecialistModel(job: "", rating: 0, img: UIImage(named: "Adv1")!, description: "", price: "", fname: "", lname: "", oname: "", category: "", feedback: "", email: "", phone: "", type: "specialist")
                if !querySnapshot!.isEmpty {
                    let doc = querySnapshot!.documents.first
                    doc?.reference.updateData(["fname":user.fname, "lname": user.lname, "oname": user.oname,"phone": user.phone,"description":user.description, "category":user.category])
                    
                    
                    completion(true)
                    print("changes saved")
                }
                else{
                    completion(false)
                    
                }
            }
        }
        
    }
    
    func saveProfileClientChanges(email: String?,user: ClientModel, complection: @escaping (Bool)->Void){
        let conf = FirebaseService.shared.configure
        let db = Firestore.firestore()
        var fl = false
           let storage = Storage.storage()

        let starsRef = URL(string: "images/\(UserState.shared.log!)Photo")!
    
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        

        var data = Data()
        data = user.img.pngData()!
     
        if user.img != UIImage(named: "Adv1")! {
        
        let storeRef = storage.reference().child("images/\(user.email)Photo")
        storeRef.putData(data,metadata: metadata,completion: {(metadata,error) in
        guard let metadata = metadata else{
            print(error)
            return
        }
            print(metadata)
        }
        )
            fl = true
        }
    
        
        
        db.collection("users").whereField("email", isEqualTo: email).getDocuments()  { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                return
            } else {
                 if !querySnapshot!.isEmpty {
                    let doc = querySnapshot!.documents.first
                    doc?.reference.updateData(["fname":user.fname, "lname": user.lname, "oname": user.oname, "phone": user.phone, "img": fl])
                
                    
                    complection(true)
                    print("changes saved")
                }
                else{
                    complection(false)
                    
                }
            }
        }
    }
    
    
}
