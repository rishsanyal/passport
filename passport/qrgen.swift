//
//  qrgen.swift
//  passport
//
//  Created by Rishab Sanyal on 1/21/17.
//  Copyright © 2017 Rishab Sanyal. All rights reserved.
//

import UIKit
import CoreImage
import Firebase
import FirebaseDatabase
import FirebaseAuth

class qrgen: UIViewController {
    
var final = "test singhtest@test.com999"
    
    @IBAction func wantBack(_ sender: Any) {
        performSegue(withIdentifier: "headBack", sender: self)
    }
    @IBOutlet weak var img: UIImageView!

func fromString(string : String) -> UIImage? {
        
        let data = string.data(using: String.Encoding.ascii)
        let filter = CIFilter(name: "CICode128BarcodeGenerator")
        filter?.setValue(data, forKey: "inputMessage")
        return UIImage(ciImage: (filter?.outputImage)!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        img.image = fromString(string: final)
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
