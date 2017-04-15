//
//  SnapsViewController.swift
//  Snapchat
//
//  Created by Jack Walker on 15/4/17.
//  Copyright © 2017 Jack Walker. All rights reserved.
//

import UIKit

class SnapsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logoutTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
