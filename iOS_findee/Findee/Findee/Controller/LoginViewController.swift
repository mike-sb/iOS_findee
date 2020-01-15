//
//  LoginViewController.swift
//  Findee
//
//  Created by михаил on 18/10/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore
import FirebaseStorage
import CoreData



struct AllUsr {
    var client = [ClientModel]()
    var specialist = [SpecialistModel]()
    var none:Bool = false
}
var all = AllUsr()
class LoginViewController: UIViewController {
   
  
    var log: LoginFindee?
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var errLabel: UILabel!
    private var networkManager = NetworkManager()
 
    @IBOutlet weak var enterBtn: UIButton!
    let deco = Decoration()
       let group = DispatchGroup()
    @IBOutlet weak var regBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        regBtn = deco.Btn(btn: regBtn)
        enterBtn = deco.Btn(btn: enterBtn)
        errLabel.alpha = 0
        let app = UIApplication.shared.delegate as! AppDelegate
        
        let context = app.persistentContainer.viewContext
        
        let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "LoginFindee")
        
        do
        {
            
            let result = try context.fetch(fetchrequest) as NSArray
            
            if result.count>0
            {
                let objectentity = result.firstObject as! LoginFindee
                
                emailText.text = objectentity.login
                passwordText.text = objectentity.password
                
                UserState.shared.log = objectentity.login
                
                UserState.shared.pas = objectentity.password
            
                //view.layer.layoutIfNeeded()
                
                loadSpecs()
                loadUsers()
               
                group.notify(queue: .main) {
                    
                    let type =  objectentity.type
                    
                
                    if type == "admin" {
                        UserState.shared.type = .admin
                        
                    }
                    else if type == "client" {
                        
                        UserState.shared.type = .client
                        
                    }
                    else {
                        UserState.shared.type = .specialist
                    }
                }
                if(UserState.shared.log != nil)
                {
                self.navToMainPageView(mail: UserState.shared.log!)
                }
            }
            
            
        }
            
        catch
        {
            let fetch_error = error as NSError
            print("error", fetch_error.localizedDescription)
        }
    }
    
    func loadSpecs()
    {
        group.enter()
        networkManager.loadDataSpecialists{ (specs) in
            
            if(!specs.isEmpty)
            {
                self.group.leave()
                all.specialist = specs
                 print("trueeee: \(all.specialist)")
                
            }
            
        }
        
    }
    func loadUsers()
    {
        group.enter()
        networkManager.loadProfileClients{ (cl) in

            if(!cl.isEmpty)
            {
                self.group.leave()
                all.client = cl
                print("trueeee: \(all.client)")
                
                
            }
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
 
    }
    
    func validate(mas:[String?]) -> String?{
        
        for elem in mas{
            if(elem == "")
            {
                print("not all text was filled in")
                return "Заполнены не все поля."
            }
        }
        
        
        
        return nil
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        //DO validation!!!!!!
        
        
        let email = emailText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordText.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        print("login tapped: ")
        print(email + password)
        let err = validate(mas: [email,password])
        if err != nil
        {
        self.errLabel.text = err
        self.errLabel.alpha = 1
        }
        else{
           
        Firebase.Auth.auth().signIn(withEmail: email, password: password) {
            (result, error) in
            if error != nil{
                self.errLabel.text = error!.localizedDescription
                self.errLabel.alpha = 1
            }
            else{
                if(!self.CheckForUserNameAndPasswordMatch(login: email, password: password))
                {
                    print("entered")
                
                    self.loadUsers()
                    self.loadSpecs()
                    
                    self.group.notify(queue: .main){
                    let type = self.findType(specs: all.specialist, clients: all.client, email: email)
                    print("specs and clients in login Tapped")
                    print(all.specialist)
                    print(all.client)
                    print("type in login")
                    print("type: \(type)")
                    self.saveLog(mail: email, pass: password, type: type)
                        
                    self.navToMainPageView(mail: email)
                    }
                
                    print("leave")
                    
                }
              
                
                
            }
        }
        }
        
        
    }
    
  
    
    private func navToMainPageView(mail: String)
    {
    
        let mainStrBrd = UIStoryboard(name: "MainPage", bundle: Bundle.main)
        guard let mainNavigationVC = mainStrBrd.instantiateViewController(withIdentifier: "MainTabBarController") as?
            MainTabBarController else {
                return
        }
        
        let app = UIApplication.shared.delegate as! AppDelegate
        
        let context = app.persistentContainer.viewContext
        
        let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "LoginFindee")
        
        do
        {
            
            let result = try context.fetch(fetchrequest) as NSArray
            
            if result.count>0
            {
                let objectentity = result.firstObject as! LoginFindee
                
                let type = objectentity.type
                    
                    print("searching type fore profile: \(type)")
                
                UserState.shared.log = emailText.text
                UserState.shared.pas = passwordText.text
                
                if type == "admin" {
                    UserState.shared.type = .admin
                    mainNavigationVC.userType = .admin
                }
                else if type == "client" {
                    mainNavigationVC.userType = .client
                    UserState.shared.type = .client
                    
                }
                else {
                    mainNavigationVC.userType = .specialist
                    UserState.shared.type = .specialist
                  
                }
                
                print("UserStates:")
                print(UserState.shared.log)
                print(UserState.shared.pas)
                print(UserState.shared.type)
            }
            
        }
        catch
        {
            let fetch_error = error as NSError
            print("error", fetch_error.localizedDescription)
        }
      
        present(mainNavigationVC, animated: true, completion: nil)
        
    }
    
    private func findType(specs: [SpecialistModel],clients: [ClientModel], email: String)->String
    {
        print("find type")
        var type:String = ""
        
        for item in specs {
            if(item.email == email)
            {
               type = "specialist"
            }
        }
        
        for item in clients {
            if(item.email == email)
            {
                
        
                if(item.email == "on_desk@mail.ru")
                {
            type = "admin"
                }
                else{
                type = "client"
                }
            }
        }
        print("--type: \(type)")
        return type
    }
    
    
    func saveLog(mail: String, pass: String, type: String){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        let loginLog = LoginFindee(entity: LoginFindee.entity(), insertInto: context)
        loginLog.setValue(mail, forKey: "login")
        loginLog.setValue(pass, forKey: "password")
        loginLog.setValue(type, forKey: "type")
        do
        {
            try context.save()
            
        }
        catch let err as NSError {
            print("Couldnt save \(err), \(err.userInfo)")
        }
 
    
        
    }
    
    func CheckForUserNameAndPasswordMatch( login: String, password : String)->Bool
    {
        let app = UIApplication.shared.delegate as! AppDelegate
        
        let context = app.persistentContainer.viewContext
        
        let fetchrequest = NSFetchRequest<NSFetchRequestResult>(entityName: "LoginFindee")
        
        let predicate = NSPredicate(format: "login = %@", login)
        
        fetchrequest.predicate = predicate
        do
        {
            let result = try context.fetch(fetchrequest) as NSArray
            
            if result.count>0
            {
                let objectentity = result.lastObject as! LoginFindee
                print(objectentity)
                
                if (objectentity.login == login && objectentity.password == password)
                {
                    return true
                }
                else
                {
                    return false
                    
                }
            }
        }
            
        catch
        {
            let fetch_error = error as NSError
            print("error", fetch_error.localizedDescription)
        }
        return false
    }
    
}
