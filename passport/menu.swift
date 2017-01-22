//
//  menu.swift
//  passport
//
//  Created by Rishab Sanyal on 1/21/17.
//  Copyright © 2017 Rishab Sanyal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class menu: UIViewController {

    @IBAction func eventspage(_ sender: Any) {
    performSegue(withIdentifier: "eventPage", sender: self)
    }
    @IBAction func checkInOut(_ sender: Any) {
        UIApplication.shared.open(NSURL(string:"http://www.reddit.com/") as! URL, options: [:], completionHandler: nil)
    }
    @IBAction func AvailableFood(_ sender: Any) {
        UIApplication.shared.open(NSURL(string:"http://www.reddit.com/") as! URL, options: [:], completionHandler: nil)
        
    }
    @IBAction func qrcode(_ sender: Any) {
        performSegue(withIdentifier: "qrbridge", sender: self)
    }
    @IBAction func sponsors(_ sender: Any) {
        UIApplication.shared.open(NSURL(string:"https://hackdavis.io/hardware/") as! URL, options: [:], completionHandler: nil)
    }
    @IBAction func Challenges(_ sender: Any) {
        UIApplication.shared.open(NSURL(string:"https://hackdavis.io/challenges/") as! URL, options: [:], completionHandler: nil)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logout(_ sender: Any) {
        //performSegue(withIdentifier: "Home", sender: self)
        if FIRAuth.auth()?.currentUser != nil {
            do {
                try FIRAuth.auth()?.signOut()
                /*let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signup")
                present(vc, animated: true, completion: nil)
                */
                performSegue(withIdentifier: "logout", sender: self)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
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
