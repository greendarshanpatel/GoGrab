//
//  Validator.swift
//  GoGrab
//
//  Created by Darshan Patel on 2020-04-15.
//  Copyright © 2020 GoGrabing. All rights reserved.
//

import Foundation

class ValidationError: Error {
    var message: String
    
    init(_ message: String) {
        self.message = message
    }
}
/// defining validator protocols that returns a validated string or validator integer.
protocol ValidatorConvertible {
    func validated(_ value: String) throws -> String
}
protocol ValidatorConvertibleForInteger {
    func validatedInteger(_ value: Int) throws -> Int
}

enum ValidatorType {
    case email
    case password
    case keyboardKeyword
    case postalCode
    case requiredField(field: String)
}
enum ValidatorTypeForInteger {
    case unit
    case ContactNumber
    
}

enum VaildatorFactory {
    static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
        switch type {
        case .email: return EmailValidator()
        case .password: return PasswordValidator()
        case .keyboardKeyword: return keyboardKeywordValidator()
        case .postalCode: return postalCodeValidator()
        case .requiredField(let fieldName): return RequiredFieldValidator(fieldName)
        }
    }
    static func validatorForInteger(type: ValidatorTypeForInteger) -> ValidatorConvertibleForInteger {
        switch type {
            
        case .unit: return unitValidator()
            
        case .ContactNumber: return contactNumberValidator()
        }
    }
}




struct RequiredFieldValidator: ValidatorConvertible {
    private let fieldName: String
    
    init(_ field: String) {
        fieldName = field
    }
    
    func validated(_ value: String) throws -> String {
        guard !value.isEmpty else {
            throw ValidationError("Required field " + fieldName)
        }
        return value
    }
}

struct PasswordValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        guard value != "" else {throw ValidationError("Password is Required")}
        guard value.count >= 4 else { throw ValidationError("Password must be atleast 4 characters") }
        
        do {
            if try NSRegularExpression(pattern: "^[A-Za-z]{4,}$",  options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationError("Password must be atleast 4 characters")
            }
        } catch {
            throw ValidationError("Password must be atleast 4 characters")
        }
        return value
    }
}

struct EmailValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        guard value != "" else {throw ValidationError("Email is Required")}
        do {
            if try NSRegularExpression(pattern: "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$", options: .caseInsensitive).firstMatch(in: value, options: [], range: NSRange(location: 0, length: value.count)) == nil {
                throw ValidationError("Invalid e-mail Address")
            }
        } catch {
            throw ValidationError("Invalid e-mail Address")
        }
        return value
    }
}
struct unitValidator: ValidatorConvertibleForInteger {
    func validatedInteger(_ value: Int) throws -> Int {
        
        do {
            guard value >= 1 && value <= 9999 else {throw ValidationError("Unit is too large as House")}
        } catch {
            throw ValidationError("Unit is InValid")
        }
        return value
    }
}
struct  contactNumberValidator : ValidatorConvertibleForInteger {
    func validatedInteger(_ value: Int) throws -> Int {
        
        func isValidPhone(phone: Int) -> Bool {
            let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return phoneTest.evaluate(with: value)
        }
        
        if isValidPhone(phone: value) == true {
            return value
        } else { ValidationError("Unit is InValid")}
        
        return value
    }
    
}
struct keyboardKeywordValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        do {
            guard value != "" else {throw ValidationError("Name or Street or City is invalid")}
            guard value.count <= 40 else {throw ValidationError("Name or Street or City is to0 long")}
            if try NSRegularExpression(pattern: "^([a-zA-Z\\s]{1,30})$", options: .caseInsensitive).firstMatch(in: value, options:[], range: NSRange(location: 0, length: value.count)) == nil{
                throw ValidationError("Invalid input")
            }
        } catch {
            throw ValidationError("Invalid input")
        }
        return value
    }
}
//^([a-zA-Z\s]{1,30})$
//^([a-zA-Z]{2,}\\s[a-zA-z]{1,}'?-?[a-zA-Z]{2,}\\s?([a-zA-Z]{1,})?)



struct postalCodeValidator: ValidatorConvertible {
    func validated(_ value: String) throws -> String {
        do {
            guard value != "" else {throw ValidationError("Postal Code is invalid")}
            
            if try NSRegularExpression(pattern: "^[ABCEGHJKLMNPRSTVXYabceghjklmnprstvxy]{1}\\d{1}[A-Za-z]{1}\\d{1}[A-Za-z]{1}\\d{1}$", options: .caseInsensitive).firstMatch(in: value, options:[], range: NSRange(location: 0, length: value.count)) == nil{
                throw ValidationError("Postal Code is invalid")
            }
        } catch {
            throw ValidationError("Postal Code is invalid")
        }
        return value
    }
}
import UIKit.UITextField

extension UITextField {
    func validatedText(validationType: ValidatorType) throws -> String {
        let validator = VaildatorFactory.validatorFor(type: validationType)
        return try validator.validated(self.text!)
    }
}

//Password must be more than 6 characters, with at least one character and one numeric character
