//
//  LandingViewController.swift
//  iXplore
//
//  Created by Chris Motz on 6/14/16.
//  Copyright © 2016 iXperience. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logInButtonTapped(sender: AnyObject) {
        let logInViewController = LogInViewController(nibName: "LogInViewController", bundle: nil)
        self.navigationController?.pushViewController(logInViewController, animated: true)
    }

    @IBAction func registerButtonTapped(sender: AnyObject) {
        let registrationInViewController = RegistrationViewController(nibName: "RegistrationViewController", bundle: nil)
        self.navigationController?.pushViewController(registrationInViewController, animated: true)
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
