//
//  RegistrationViewController.swift
//  iXplore
//
//  Created by Chris Motz on 6/14/16.
//  Copyright © 2016 iXperience. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registrationButtonTapped(sender: AnyObject) {
        let username = self.emailTextField.text
        let password = self.passwordTextField.text
        
        let (failureMessage, user) = UserController.sharedInstance.registerUser(username!, newPassword: password!)
        
        if (user != nil) {
            print("User registered in registration view")

        }   else {
            if (failureMessage != nil) {
                print(failureMessage)
            }
        }
        print("Register here!")
    }
    @IBAction func homeButtonTapped(sender: AnyObject) {
            self.navigationController?.popViewControllerAnimated(true)
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
