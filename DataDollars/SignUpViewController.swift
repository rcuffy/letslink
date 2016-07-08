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
    var ref: FIRDatabaseReference?
    
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBAction func createAccountButton(sender: UIButton) {
        FIRAuth.auth()?.createUserWithEmail(emailField.text!,  password: passwordField.text!, completion: { (user, error) in
            if error != nil {
                print(error?.localizedDescription)
            }
            else{
                print("User Created!")
                self.ref?.child("testing").setValue(123)
            }
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
        ref?.child("users").setValue("Rena")
        ref?.child("Organizations").setValue(["EPA Jr. Golf", "Live In Peace"])
            
        
        // Do any additional setup after loading the view, typically from a nib.
 
        
        // self.ref.child("users").child("id123").setValue(["username": "RenaRocks"])
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

