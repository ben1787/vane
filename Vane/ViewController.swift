//
//  ViewController.swift
//  Vane
//
//  Created by Ben Lieblich on 6/15/15.
//  Copyright (c) 2015 Ben Lieblich. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if FBSDKAccessToken.currentAccessToken() == nil {
            println("Not logged in")
        } else {
            println("logged in")
        }
        
        var loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile","email","user_friends"]
        loginButton.center = self.view.center
        loginButton.delegate = self
        self.view.addSubview(loginButton)
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if error == nil {
            println("login complete")
            self.performSegueWithIdentifier("LoggedInSegue", sender: self)
        } else {
            println("error: \(error.localizedDescription)")
        }
        
        
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        println("Logged Out!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

