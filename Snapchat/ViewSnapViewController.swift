//
//  ViewSnapViewController.swift
//  Snapchat
//
//  Created by Jack Walker on 17/4/17.
//  Copyright © 2017 Jack Walker. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage

class ViewSnapViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    var snap = Snap()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = snap.descrip
        imageView.sd_setImage(with: URL(string: snap.imageURL))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        FIRDatabase.database().reference().child("users").child(FIRAuth.auth()!.currentUser!.uid).child("snaps").child(snap.key).removeValue()
        FIRStorage.storage().reference().child("Images").child("\(snap.uuid).jpg").delete { (error) in
            print("Deleted Image")
        }
    }
    
}
