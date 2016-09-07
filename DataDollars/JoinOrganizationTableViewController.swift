//
//  OrganizationsTableViewController.swift
//  
//
//  Created by StreetCode Academy on 7/20/16.
//
//

import UIKit
import Firebase
import FirebaseDatabaseUI

class JoinOrganizationTableViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet
    var tableView: UITableView!
    var ref: FIRDatabaseReference!
    var dataSource: FirebaseTableViewDataSource!
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            let userID = FIRAuth.auth()?.currentUser?.uid
            let orgName = cell.textLabel?.text
            ref.child("users").child(userID!).child("groups").child(orgName!).setValue(true)
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
              appDelegate.logIn()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
        let orgRef = ref.child("organizations")
        self.dataSource = FirebaseTableViewDataSource(ref: orgRef, cellReuseIdentifier: "cell", view: self.tableView)
        self.dataSource.populateCellWithBlock { (cell: UITableViewCell, obj:NSObject) in
            let snap = obj as! FIRDataSnapshot
            cell.textLabel?.text = snap.key as String
        }
        
        self.tableView.dataSource = self.dataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
