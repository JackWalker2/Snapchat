//
//  AddFriendViewController.swift
//  Snapchat
//
//  Created by Jack Walker on 20/4/17.
//  Copyright © 2017 Jack Walker. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class AddFriendViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
        FIRDatabase.database().reference().child("users").child(FIRAuth.auth()!.currentUser!.uid).child("friends").childByAutoId().child("email").setValue(emailTextField.text!)
        emailTextField.resignFirstResponder()
        emailTextField.text! = ""
        let alertVC = UIAlertController(title: "Contact Added!", message: nil, preferredStyle: .alert)
        let OKaction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertVC.addAction(OKaction)
        self.present(alertVC, animated: true, completion: nil)
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
    }
    

}
