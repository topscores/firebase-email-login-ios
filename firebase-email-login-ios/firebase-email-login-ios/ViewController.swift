//
//  ViewController.swift
//  firebase-email-login-ios
//
//  Created by vorapart on 3/22/2560 BE.
//  Copyright © 2560 vorapart. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var PassField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func LoginBtnPressed(_ sender: Any) {
        Login()
    }
    
    func Login(){
        FIRAuth.auth()?.signIn(withEmail: EmailField.text!, password: PassField.text!, completion: { (user, error) in
            if error != nil{
                print("Login Error")
            } else {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Profiles")
                self.present(vc!, animated: true, completion: nil)
            }
        })
    }
    
    
    @IBAction func CreateAccount(_ sender: Any) {
        FIRAuth.auth()?.createUser(withEmail: EmailField.text!, password: PassField.text!, completion: { (user, error) in
            if error != nil {
                print("Create Error")
            } else {
                print("User is created")
                self.Login()
            }
        })
    }

}

