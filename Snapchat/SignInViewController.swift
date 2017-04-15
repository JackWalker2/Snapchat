//
//  SignInViewController.swift
//  Snapchat
//
//  Created by Jack Walker on 15/4/17.
//  Copyright © 2017 Jack Walker. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func signInTapped(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            print("Sign In")
            if error != nil {
                print("Error: \(String(describing: error))")
                FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                    print("User created")
                    if error != nil {
                        print("Error: \(String(describing: error))")
                    } else {
                        print("User Created Successfully")
                        self.performSegue(withIdentifier: "signInSegue", sender: nil)
                    }
                })
            } else {
                print("Signed In Successfully")
                self.performSegue(withIdentifier: "signInSegue", sender: nil)
            }
        })
    }

}

