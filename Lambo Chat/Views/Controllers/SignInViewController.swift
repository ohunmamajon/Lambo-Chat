//
//  SignInViewController.swift
//  Lambo Chat
//
//  Created by Okhunjon Mamajonov on 2022/02/14.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func SignInPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text{
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let e = error {
                print(e)
            } else {
                self?.performSegue(withIdentifier: K.SignInSegue, sender: self)
            }
       
        
        }
        }
    
        
    }
    
    
    
}

