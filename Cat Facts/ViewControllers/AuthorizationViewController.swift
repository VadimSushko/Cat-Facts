//
//  AuthorizationViewController.swift
//  Cat Facts
//
//  Created by Vadym Sushko on 1/19/19.
//  Copyright © 2019 Vadym Sushko. All rights reserved.
//

import UIKit

class AuthorizationViewController: UIViewController {

    @IBOutlet weak var userEmail: UITextField!
    
    @IBOutlet weak var userPassword: UITextField!
    
    @IBOutlet weak var logInButton: UIButton! {
        didSet {
            logInButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            logInButton.layer.cornerRadius = 10
            logInButton.layer.borderWidth = 2
        }
    }
    @IBAction func logInAction(_ sender: Any) {
        
        let email = userEmail.text
        let password = userPassword.text
        
        if !EmailValidation.isValidEmail(testStr: email!) {
            showAlert(title: "Wrong e-mail", message: "Enter correct e-mail adress")
            return
        }
        
        if password!.count < 5 {
            showAlert(title: "Password is too short", message: "It should contain at least 5 symbols")
            return
        }

        UserDefaults.standard.set(email, forKey: Keys.loggedEmail)
        UserDefaults.standard.set(password, forKey: Keys.loggedPassword)

        let registeredEmail = UserDefaults.standard.value(forKey: Keys.registeredEmail) as!
            String
        let loggedEmail = UserDefaults.standard.value(forKey: Keys.loggedEmail) as!
        String
        
        if registeredEmail != loggedEmail {
            showAlert(title: "Wrong e-mail", message: "Entered e-mail is not registered")
            return
        }

        let registeredPassword = UserDefaults.standard.value(forKey: Keys.registeredPassword) as!
        String
        let loggedPassword = UserDefaults.standard.value(forKey: Keys.loggedPassword) as!
        String
        
        if registeredPassword != loggedPassword {
            showAlert(title: "Wrong password", message: "Password does not correspond to e-mail")
            return
        }

        UserDefaults.standard.set(true, forKey: Keys.isLogged)
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
 
    func showAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent // .default
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
