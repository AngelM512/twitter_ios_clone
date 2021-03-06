//
//  LoginViewController.swift
//  Twitter
//
//  Created by Angel Moreta on 2/26/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "toLogin", sender: self)
        }
    }

    @IBAction func loginButton(_ sender: Any) {
        TwitterAPICaller.client?.login(url: "https://api.twitter.com/oauth/request_token", success: {
            
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            self.performSegue(withIdentifier: "toLogin", sender: self)
            
        }, failure: { (Error) in
            print("could not login")
        })
    }
    
  
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
