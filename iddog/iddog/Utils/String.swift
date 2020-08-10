//
//  String.swift
//  iddog
//
//  Created by Caroline Jardim Siqueira on 09/08/20.
//  Copyright © 2020 Caroline Jardim Siqueira. All rights reserved.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var isValidPhone: Bool {
        let phoneRegEx = "[0-9]{10,11}" // "[(][0-9]{2}[)]\\s[0-9]{4,5}-[0-9]{4}"//
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", phoneRegEx)
        return phoneTest.evaluate(with: self)
    }
    
    var isValidCNPJ: Bool {
        let cnpjRegEx = "[0-9]{2}.?[0-9]{3}.?[0-9]{3}/?[0-9]{4}-?[0-9]{2}"
        let cnpjTest = NSPredicate(format:"SELF MATCHES %@", cnpjRegEx)
        return cnpjTest.evaluate(with: self)
    }
    
    var isValidCPF: Bool {
        let cpfRegEx = "[0-9]{3}.?[0-9]{3}.?[0-9]{3}-?[0-9]{2}"
        let cpfTest = NSPredicate(format:"SELF MATCHES %@", cpfRegEx)
        return cpfTest.evaluate(with: self)
    }
    
    var isValidAccount: Bool {
        let accountRegEx = "[0-9]{2,6}.?[0-9]{2,6}-[A-Z0-9a-z]{1,2}"
        let accountTest = NSPredicate(format:"SELF MATCHES %@", accountRegEx)
        return accountTest.evaluate(with: self)
    }
    
    var isValidAgency: Bool {
        let agencyRegEx = "[0-9]{2,5}-[0-9]{1}"
        let agencyTest = NSPredicate(format:"SELF MATCHES %@", agencyRegEx)
        return agencyTest.evaluate(with: self)
    }
    var isValidBank: Bool {
        let bankRegEx = "[A-Z0-9a-z._ -]{2,5}-[A-Z0-9a-z._ -]{2,64}"
        let bankTest = NSPredicate(format:"SELF MATCHES %@", bankRegEx)
        return bankTest.evaluate(with: self)
    }
    
    var isValidUser: Bool {
        let emailRegEx = "[A-Z0-9a-z._ -]{6,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var isValidName: Bool {
        let nameRegEx = "[A-Za-z ]{6,64}"
        let nameTest = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
        return nameTest.evaluate(with: self)
    }
    
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted).joined(separator: "")
    }
    
    var integer: Int {
        return Int(digits) ?? 0
    }
    
    var double: Double {
        return Double(digits) ?? 0.0
    }
    
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func isEqualToString(find: String) -> Bool {
        return String(format: self) == find
    }
    
    mutating func replace(_ originalString:String, with newString:String) {
        self = self.replacingOccurrences(of: originalString, with: newString)
    }
}
