//
//  OrganizationsViewController.swift
//  DataDollars
//
//  Created by StreetCode Academy on 7/27/16.
//  Copyright © 2016 StreetCode Academy. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabaseUI


class OrganizationsViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet
    var tableView: UITableView!
    var ref: FIRDatabaseReference!
    var dataSource: FirebaseTableViewDataSource!
    
    @IBAction func signOutTapped(sender: UIBarButtonItem) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.signOut()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
        let userID = FIRAuth.auth()?.currentUser?.uid
        let myOrgsRef = ref.child("users").child(userID!).child("groups")
        self.dataSource = FirebaseTableViewDataSource(ref: myOrgsRef, cellReuseIdentifier: "My Org Cell", view: self.tableView)
        self.dataSource.populateCellWithBlock { (cell: UITableViewCell, obj:NSObject) in
            let snap = obj as! FIRDataSnapshot
            cell.textLabel?.text = snap.key as String
        }
        
        self.tableView.dataSource = self.dataSource
        // Do any additional setup after loading the view.
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            let orgName = cell.textLabel?.text
            performSegueWithIdentifier("Show Chat", sender: orgName)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "Show Chat" {
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let orgName = sender as! String
            appDelegate.orgRef = ref.child("organizations").child(orgName)
            let destinationViewController = segue.destinationViewController as! TabBarController
            destinationViewController.orgName = orgName
        }
        
        
    }
    
}
