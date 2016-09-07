//
//  SurveyViewController.swift
//  DataDollars
//
//  Created by StreetCode Academy on 7/13/16.
//  Copyright © 2016 StreetCode Academy. All rights reserved.
//

import UIKit
import Firebase



class SurveyViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet var webView: UIWebView!
    
    var ref: FIRDatabaseReference!
    var organizationID: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.delegate = self
        
        ref = FIRDatabase.database().reference()
        
        setupFeedbackForm()
    }
    
    var activeFormURL: String!
    
    func setupFeedbackForm() {
        let dataRef = self.ref.child("organizations").child(self.organizationID).child("data")
        dataRef.observeEventType(.Value, withBlock: { snapshot in
            if let activeFormURL = snapshot.value!["activeFormURL"] as? String {
                self.activeFormURL = activeFormURL
                let url = NSURL(string: activeFormURL)
                let request = NSURLRequest(URL: url!)
                self.webView.loadRequest(request)
            }
        })
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print (error.debugDescription)
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        if webView.request?.URL?.absoluteString != activeFormURL {
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.logIn()
        }
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