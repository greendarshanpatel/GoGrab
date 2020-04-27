//
//  SignUpViewController.swift
//  GoGrab
//
//  Created by Darshan Patel on 2020-04-15.
//  Copyright © 2020 GoGrabing. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    /// Making Outlets of signUp form TextFiellds and services Object of DataServices class.
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var contact: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var repeatPasswordTxtFld: UITextField!
    @IBOutlet weak var streetTxtField: UITextField!
    @IBOutlet weak var unitTxtField: UITextField!
    @IBOutlet weak var cityTxtField: UITextField!
    @IBOutlet weak var postalCodeTxtField: UITextField!
    let services = DataServices()
    /// As view is loaded becomeFirstResponder method show keyboard to first text field in up  form
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Welcome to Go Grabing"
        nameTxtField.becomeFirstResponder()
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func SignUpPressed(_ sender: UIButton) {
        validate()
        performSegue(withIdentifier: "signUpToLogin", sender: nil)
        
    }
    /// Function showAlert, to show alert or error to user, using UIAlertController
    func showAlert(for alert: String) {
        let alertController = UIAlertController(title: nil, message: alert, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    /**
     validate method  tries to validate user input and show error when user input is invalid.
     if user input is valid it passes all valid user inputs  to newUser Object of user and calls addingNewUser Function of services.
     */
    
    func validate() {
        do {
            let newEmail = try emailTxtField.validatedText(validationType: ValidatorType.email)
            
            let newName = try nameTxtField.validatedText(validationType: ValidatorType.keyboardKeyword)
            let newContactNumber = String(contact.text!)
            let newUnit =  String(unitTxtField.text!)
            var NewPassword : String!
            if passwordTxtField.text == repeatPasswordTxtFld.text{
                NewPassword = try passwordTxtField.validatedText(validationType: ValidatorType.password)
            }else{
                showAlert(for: "Password Do Not Match")
            }
            let newStreet = try streetTxtField.validatedText(validationType: ValidatorType.keyboardKeyword)
            let newCity = try cityTxtField.validatedText(validationType: ValidatorType.keyboardKeyword)
            let NewPostalCode = try postalCodeTxtField.validatedText(validationType: ValidatorType.postalCode)
            let Newid = DummyData.users.count + 1
            
            let newUser : User = User(id: Newid, email: newEmail, name: newName, password: NewPassword, contactNumber: newContactNumber, unit: newUnit, street: newStreet, city: newCity, postalCode: NewPostalCode, isAdmin: false)
            
            let data = services.addingNewUser(newUser: newUser)
            if data > 0 {
                showAlert(for: "sign Up Successfull with \(newUser.email)")
                
            }else{ showAlert(for: "Sign Up error")}
            
        } catch(let error) {
            showAlert(for: (error as! ValidationError).message)
        }
    }
}
/// Implenting textFieldShouldReturn with  becomeFirstResponder & resignFirstResponder methods of UITextFieldDelegate protocol.
extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTxtField:
            //stackViewOutLet.topAnchor = self.SafeArea.top - 50
            emailTxtField.becomeFirstResponder()
        case emailTxtField:
            contact.becomeFirstResponder()
        case contact:
            passwordTxtField.becomeFirstResponder()
        case passwordTxtField:
            repeatPasswordTxtFld.becomeFirstResponder()
        case repeatPasswordTxtFld:
            unitTxtField.becomeFirstResponder()
        case unitTxtField:
            streetTxtField.becomeFirstResponder()
        case streetTxtField:
            cityTxtField.becomeFirstResponder()
        case cityTxtField:
            postalCodeTxtField.becomeFirstResponder()
        default:
            postalCodeTxtField.resignFirstResponder()
        }
        
        return true
    }
}
