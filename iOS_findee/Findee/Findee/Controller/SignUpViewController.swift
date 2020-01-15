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

    @IBOutlet weak var emailTxtBx: UITextField!
    
    @IBOutlet weak var passwordTxtBx: UITextField!
    
    @IBOutlet weak var confirmTxtBx: UITextField!
    
    @IBOutlet weak var categoryTxtBx: UITextField!
    
    @IBOutlet weak var fnameTxtBx: UITextField!
    
    @IBOutlet weak var lnameTxtBx: UITextField!
    
    @IBOutlet weak var regionTxtBx: UITextField!
    
    @IBOutlet weak var orgTxtBx: UITextField!
    
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var errLabel: UILabel!
    
    @IBOutlet weak var regSpecBtn: UIButton!
    var typeClient: Bool = true
    
    var deco = Decoration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(confirmBtn != nil)
        {
        confirmBtn = deco.Btn(btn: confirmBtn)
        }
        
        if(regSpecBtn != nil)
        {
        regSpecBtn = deco.Btn(btn: regSpecBtn)
        }
        
        errLabel.alpha = 0
        
       changeToSpec()
    }
    
    @IBAction func confirmTapped(_ sender: Any) {
        if(typeClient)
        {
            confirmClientTapped()
        }
        else{
            confirmSpecTapped()
        }
    }
    
    @IBAction func changeToSpectapped(_ sender: Any) {
    if(typeClient)
    {
      changeToClient()
        
    }
    else{
        changeToSpec()
        }
     
    }
    func changeToClient()
    {

        regSpecBtn.setTitle("Регистрация для клиентов", for: .normal)
        typeClient = false
        categoryTxtBx.isEnabled = true
        categoryTxtBx.alpha = 1
        orgTxtBx.isEnabled = true
        orgTxtBx.alpha = 1
        
    }
    func changeToSpec()
    {
        regSpecBtn.setTitle("Регистрация для исполнителей", for: .normal)
        categoryTxtBx.isEnabled = false
        categoryTxtBx.alpha = 0
        orgTxtBx.isEnabled = false
        orgTxtBx.alpha = 0
        typeClient = true
        
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
   
  
    func confirmClientTapped() {
        var mass = [String?]()
       let fname = fnameTxtBx.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let lname = lnameTxtBx.text?.trimmingCharacters(in: .whitespacesAndNewlines)
          let email =  emailTxtBx.text?.trimmingCharacters(in: .whitespacesAndNewlines)
         let password =  passwordTxtBx.text?.trimmingCharacters(in: .whitespacesAndNewlines)
         let confirm = confirmTxtBx.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let region = regionTxtBx.text?.trimmingCharacters(in: .whitespacesAndNewlines)
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
            let password = passwordTxtBx.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTxtBx.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let fname = fnameTxtBx.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lname = lnameTxtBx.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Firebase.Auth.auth().createUser(withEmail: email, password: password){
                (result, err) in
                
                
                if  let err = err{
                    print(err)
                    print("Error creating acc")
                    self.showError(str: "Error creating user")
                }
                else{
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["fname": fname  , "lname": lname,"email":email, "region": region!, "type": "client", "uid": result!.user.uid])
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
    
    
    func confirmSpecTapped() {
        var mass = [String?]()
        
        //
        let fname = fnameTxtBx.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let lname = lnameTxtBx.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let email =  emailTxtBx.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password =  passwordTxtBx.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let confirm = confirmTxtBx.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let org = orgTxtBx.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let region = regionTxtBx.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let category = categoryTxtBx.text?.trimmingCharacters(in: .whitespacesAndNewlines)
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
                    db.collection("specialists").addDocument(data: ["fname": fname!  , "lname": lname!,"email":email!, "org": org!, "region": region!, "category": category!, "rating": 0, "description": "", "type": "specialist", "uid": result!.user.uid])
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
