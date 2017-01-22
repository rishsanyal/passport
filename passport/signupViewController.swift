//
//  signupViewController.swift
//  passport
//
//  Created by Rishab Sanyal on 1/21/17.
//  Copyright © 2017 Rishab Sanyal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import CoreImage

class signupViewController: UIViewController {
    
    var final : String = ""
     var ref: FIRDatabaseReference!
    let refUsers = FIRDatabase.database().reference()
    var workshopsAttended = ""
    var dict : [String : [String]] = [" " : [" "]]

    @IBOutlet weak var firstName: UITextField?
    @IBOutlet weak var shirtSize: UITextField?
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var password1Field: UITextField!
    @IBOutlet weak var password2Field: UITextField!
    @IBOutlet weak var studentIDNumber: UITextField?
    @IBOutlet weak var collegeName: UITextField?
    @IBOutlet weak var collegeYear: UITextField?
    
    func fromString(string : String) -> UIImage? {
        
        let data = string.data(using: String.Encoding.ascii)
        let filter = CIFilter(name: "CICode128BarcodeGenerator")
        filter?.setValue(data, forKey: "inputMessage")
        return UIImage(ciImage: (filter?.outputImage)!)
    }

    
    @IBAction func done(_ sender: Any) {
        if emailField.text! == "" || (password1Field.text != password2Field.text) {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
        }
        
        else {
            FIRAuth.auth()?.createUser(withEmail: emailField.text!, password: password2Field.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                    //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        
         let dict = [(firstName?.text!)! : [emailField.text!, (studentIDNumber?.text!)!,(collegeName?.text!)!, (collegeYear?.text!)! ,(shirtSize?.text!)!,workshopsAttended]]
        
       /* var myDict:[String: [String:String]] = [
            (emailField.text!) : [
            "name":(firstName?.text!)!,
            "ID Number": (studentIDNumber?.text!)!]]
            
            myDict = [
                (emailField.text!) : [
            "School": (collegeName?.text!)!,
            "Year": collegeYear!.text!,
            "WorkShops Attended": ""]]
        
            myDict = [
                (emailField.text!) : [
            "finalstring": ((firstName?.text!)!,emailField.text!,(collegeName?.text!)!,(collegeName?.text!)!,collegeYear!.text!)]]*/
        
        var finalNum = refUsers.child("users/CURRENT").setValue(dict)
        
        performSegue(withIdentifier: "backHome", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
