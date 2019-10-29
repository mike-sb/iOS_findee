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

class LoginViewController: UIViewController {
   

    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var errLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        errLabel.alpha = 0
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
                
                self.navToMainPageView()
                
            }
        }
        }
        
        
    }
    
  
    
    private func navToMainPageView()
    {
        let mainStrBrd = UIStoryboard(name: "MainPage", bundle: Bundle.main)
        guard let mainNavigationVC = mainStrBrd.instantiateViewController(withIdentifier: "MainTabBarController") as?
            MainTabBarController else {
                return
        }
        present(mainNavigationVC, animated: true, completion: nil)
    }
    
    
    
    
}
