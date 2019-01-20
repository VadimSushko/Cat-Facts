//
//  RegistrationViewController.swift
//  Cat Facts
//
//  Created by Vadym Sushko on 1/19/19.
//  Copyright © 2019 Vadym Sushko. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var userEmail: UITextField!
    
    @IBOutlet weak var userPassword: UITextField!
    
    @IBOutlet weak var userPasswordConfirmation: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!{
        didSet {
            registerButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            registerButton.layer.cornerRadius = 10
            registerButton.layer.borderWidth = 2
        }
    }
 
    @IBAction func registerAction(_ sender: Any) {
        
        let email = userEmail.text
        let password = userPassword.text
        let passwordConfirmation = userPasswordConfirmation.text
        
        
        if !EmailValidation.isValidEmail(testStr: email!) {
            showAlert(title: "Wrong e-mail", message: "Enter correct e-mail adress")
            return
        }
        
        if password!.count < 5 {
            showAlert(title: "Wrong password", message: "It should contain at least 5 symbols")
            return
        }
        
        if passwordConfirmation != password {
            showAlert(title: "Wrong password confirmation", message: "Сonfirmation of the password must match the password")
            return
        }
        
        UserDefaults.standard.set(email, forKey: Keys.registeredEmail)
        UserDefaults.standard.set(password, forKey: Keys.registeredPassword)
        UserDefaults.standard.set(passwordConfirmation, forKey: Keys.registeredPasswordConfirmation)
        UserDefaults.standard.set(true, forKey: Keys.isRegistered)
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
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
