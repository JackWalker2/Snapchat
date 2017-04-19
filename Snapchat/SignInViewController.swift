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
import FirebaseDatabase

class SignInViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
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
                        let alertVC = UIAlertController(title: "Incorrect Password!", message: nil, preferredStyle: .alert)
                        let OKaction = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alertVC.addAction(OKaction)
                        self.present(alertVC, animated: true, completion: nil)
                    } else {
                        print("User Created Successfully")
                        
                        FIRDatabase.database().reference().child("users").child(user!.uid).child("email").setValue(user!.email!)
                        FIRDatabase.database().reference().child("users").child(user!.uid).child("password").setValue(self.passwordTextField.text!)
                        
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

