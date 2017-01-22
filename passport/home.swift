//
//  ViewController.swift
//  passport
//
//  Created by Rishab Sanyal on 1/21/17.
//  Copyright © 2017 Rishab Sanyal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

public class home: UIViewController {
    @IBOutlet public var username: UITextField!
    @IBOutlet public var password: UITextField!
    
    public func getUsername() -> String {
    return self.username.text!
    }
 
    
    @IBAction func login(_ sender: Any) {
        if self.username.text == "" || self.password.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            FIRAuth.auth()?.signIn(withEmail: self.username.text!, password: self.password.text!) { (user, error) in
                
                if error == nil {
                    
                    /* successfully logged in*/
                    self.performSegue(withIdentifier: "next", sender: self)
                    
                } else {
                    
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }

    }

    @IBAction func forgotPassword(_ sender: Any) {
//        let vc = UIStoryboard(name: "forgotpassword", bundle: nil).instantiateViewController(withIdentifier: "forgotpassword")
//        present(vc, animated: true, completion: nil)
        performSegue(withIdentifier: "forgotpassword", sender: self)
    }
    
    @IBAction func signup(_ sender: Any) {
        performSegue(withIdentifier: "signup", sender: self)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

