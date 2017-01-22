//
//  forgotPassword.swift
//  passport
//
//  Created by Rishab Sanyal on 1/21/17.
//  Copyright © 2017 Rishab Sanyal. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class forgotpassword: UIViewController {
    
    var sent : Bool = false
    
    // Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBAction func goHome(_ sender: Any) {
        performSegue(withIdentifier: "backHome2", sender: self)
    }
    
    
    // Reset Password Action
   
    @IBAction func resetPassword(_ sender: Any) {
        if self.emailTextField.text == "" {
            let alertController = UIAlertController(title: "Oops!", message: "Please enter an email.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            FIRAuth.auth()?.sendPasswordReset(withEmail: self.emailTextField.text!, completion: { (error) in
                
                var title = ""
                var message = ""
                
                if error != nil {
                    title = "Error!"
                    message = (error?.localizedDescription)!
                } else {
                    title = "Success!"
                    message = "Password reset email sent."
                    self.emailTextField.text = ""
                    self.sent = true
                }
                
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
                
            })
        }
    }
}

