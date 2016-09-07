//
//  ViewController.swift
//  DataDollars
//
//  Created by StreetCode Academy on 6/28/16.
//  Copyright © 2016 StreetCode Academy. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    lazy var ref: FIRDatabaseReference = FIRDatabase.database().reference()
    @IBAction func createAccountButton(sender: UIButton) {
        FIRAuth.auth()?.createUserWithEmail(emailField.text!,  password: passwordField.text!, completion: { (user, error) in
            if error != nil {
                print(error?.localizedDescription)
            }
            else{
                
                self.ref.child("users").child((user?.uid)!).child("username").setValue(self.usernameField.text!)
                self.performSegueWithIdentifier("CreateAccount", sender: self)

            }
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
        
        // self.ref.child("users").child("id123").setValue(["username": "RenaRocks"])
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

