//
//  SignUpViewController.swift
//  Findee
//
//  Created by михаил on 08/10/2019.
//  Copyright © 2019 михаил. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class SignUpViewController: UIViewController {
    private var handle = AuthStateDidChangeListenerHandle?.self

    @IBOutlet weak var clientLogin: UITextField!
    
    @IBOutlet weak var clientPassword: UITextField!
    
    @IBOutlet weak var clientConfirm: UITextField!
    
    @IBOutlet weak var clientEmail: UITextField!
    
    @IBOutlet weak var clientFName: UITextField!
   
    
    @IBOutlet weak var clientLName: UITextField!
    
    
    @IBOutlet weak var clientRegion: UITextField!
    
    @IBOutlet weak var errLabel: UILabel!
    
    @IBOutlet weak var corpLogin: UITextField!
    
    @IBOutlet weak var corpPassword: UITextField!
    
    @IBOutlet weak var corpConfirm: UITextField!
   
    @IBOutlet weak var corpEmail: UITextField!
    
    @IBOutlet weak var corpRegion: UITextField!
    
    @IBOutlet weak var corpOrg: UITextField!
    
    @IBOutlet weak var corpCategory: UITextField!
    
    @IBOutlet weak var corpFName: UITextField!
    
    @IBOutlet weak var confirmSpecBtn: UIButton!
    
    @IBOutlet weak var corpLName: UITextField!
    
    @IBOutlet weak var confirmBtn: UIButton!
    
    @IBOutlet weak var regSpecBtn: UIButton!
    var deco = Decoration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(confirmBtn != nil)
        {
        confirmBtn = deco.Btn(btn: confirmBtn)
        }
        if(confirmSpecBtn != nil)
        {
        confirmSpecBtn = deco.Btn(btn: confirmSpecBtn)
        }
        regSpecBtn = deco.Btn(btn: regSpecBtn)
       
        errLabel.alpha = 0

    }
    

    
    func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$")
        return passwordTest.evaluate(with: password)
    }

    func validate(mas:[String?], first: String?, second: String?) -> String?{
        
        for elem in mas{
         if(elem == "")
         {
            print("not all text was filled in")
            return "Заполнены не все поля."
            }
        }
        
        
        
        

        
        if(isPasswordValid(first!) == false)
        {
             print("regexp error")
            return "Убедитесь в том что пароль содержит не менее 8 символов! Состоит из чисел, букв, и символов."
           
            
        }
        if(first != second)
        {

             print("not equal passwoerds")
            return "Пароли не совпадают."
           
        }
        
        return nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        

    }
    
    func showError(str: String?)
    {
        errLabel.text = str!
        errLabel.alpha = 1
        
    }
   
  
    @IBAction func confirmClientTapped(_ sender: Any) {
        var mass = [String?]()
       let fname = clientFName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let lname = clientLName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
          let email =  clientEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines)
         let password =  clientPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
         let confirm = clientConfirm.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let region = clientRegion.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        mass.append(fname)
        mass.append(lname)
        mass.append(email)
        mass.append(password)
        mass.append(confirm)
        mass.append(region)
    
        let err = validate(mas: mass, first: password, second: confirm)
        
        if (err != nil) {
         showError(str: err)
        }
        else{
            let password = clientPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = clientEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let fname = clientFName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lname = clientLName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Firebase.Auth.auth().createUser(withEmail: email, password: password){
                (result, err) in
                
                
                if  let err = err{
                    print(err)
                    print("Error creating acc")
                    self.showError(str: "Error creating user")
                }
                else{
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["fname": fname  , "lname": lname, "password": password,"email":email, "region": region!, "type": "client", "uid": result!.user.uid])
                    {
                        (error) in
                        if (error != nil) {
                            self.showError(str: "error saving users data")
                            print("error saving")
                        }
                    }
                    self.transitionHome()
                }
            }
        }
        
    }
    
    
    @IBAction func confirmOrgTapped(_ sender: Any) {
        var mass = [String?]()
        
        //
        let fname = corpFName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let lname = corpLName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let email =  corpEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password =  corpPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let confirm = corpConfirm.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let org = corpOrg.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let region = corpRegion.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let category = corpCategory.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        //
        
        mass.append(fname)
        mass.append(lname)
        mass.append(email)
        mass.append(password)
        mass.append(confirm)
        mass.append(org)
        mass.append(region)
        mass.append(category)
        
        let err = validate(mas: mass, first: password, second: confirm)
        
        if (err != nil) {
            showError(str: err)
        }
        else{
          
            Firebase.Auth.auth().createUser(withEmail: email!, password: password!){
                (result, err) in
                
    
                if  let err = err{
                    print(err)
                    print("Error creating acc")
                    self.showError(str: "Error creating user")
                }
                else{
                    let db = Firestore.firestore()
                    db.collection("specialists").addDocument(data: ["fname": fname!  , "lname": lname!, "password": password!,"email":email!, "org": org!, "region": region!, "category": category!, "type": "specialist", "uid": result!.user.uid])
                    {
                        (error) in
                        if (error != nil) {
                            self.showError(str: "error saving users data")
                            print("error saving")
                        }
                    }
                   self.transitionHome()
                }
            }
        }
        
    }
    
  private  func transitionHome(){
   /* let mainStrBrd = UIStoryboard(name: "Main", bundle: Bundle.main)
    guard let mainNavigationVC = mainStrBrd.instantiateViewController(withIdentifier: "LoginViewController") as?
        LoginViewController else {
            return
    }
    print("go to login page")
    present(mainNavigationVC, animated: true, completion: nil)
 */
        let loginVC = "LoginViewController"
        let logViewController = storyboard?.instantiateViewController(withIdentifier: loginVC) as? LoginViewController
       view.window?.rootViewController = logViewController
        view.window?.makeKeyAndVisible()
        
        
    }
}
