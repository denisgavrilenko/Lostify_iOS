//
//  VerifyNumberViewController.swift
//  Lostify_iOS
//
//  Created by Denis Gavrilenko on 1/14/17.
//  Copyright © 2017 DreamTeam. All rights reserved.
//

import UIKit

class VerifyNumberViewController: UIViewController {
    
    @IBOutlet weak var numberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberTextField.becomeFirstResponder()
    }
}
