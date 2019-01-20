//
//  EmailValidation.swift
//  Cat Facts
//
//  Created by Vadym Sushko on 1/20/19.
//  Copyright © 2019 Vadym Sushko. All rights reserved.
//

import Foundation

struct EmailValidation {
    static func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
}
