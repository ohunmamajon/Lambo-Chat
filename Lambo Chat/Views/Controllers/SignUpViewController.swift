//
//  SignUpViewController.swift
//  Lambo Chat
//
//  Created by Okhunjon Mamajonov on 2022/02/14.
//

import UIKit
import Firebase
class SignUpViewController: UIViewController {
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    

    @IBAction func signUpPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text , let password = passwordTextfield.text{
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print (e)
            } else {
                self.performSegue(withIdentifier:K.SignUpSegue , sender: self)
            }
        }
        }
        
        
        
    }
        
       
    
    
}

