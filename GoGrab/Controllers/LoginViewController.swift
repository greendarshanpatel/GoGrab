//
//  LoginViewController.swift
//  GoGrab
//
//  Created by Darshan Patel on 2020-04-15.
//  Copyright © 2020 GoGrabing. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    /// Making Outlets of emailTextFeild, passwordTextField of UITextField and services object of DataServices class
    
    @IBOutlet weak var emailTextFeild: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    let services = DataServices()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login"
        
        // Do any additional setup after loading the view.
    }
    /// IBAction of UItabpGestureRecognizer to minimize/ resign keyboard when user taps outside keyboard
    @IBAction func resignKeyBoard(_ sender: UITapGestureRecognizer) {
        emailTextFeild.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    /// LoginPressed method is callled whrn user taps login button and calls validate method.
    @IBAction func LoginPressed(_ sender: Any) {
        validate()
    }
    ///signUpPressed method is called when user taps signUpPressed button and calls performSegue method to switch view to SignUpViewController
    @IBAction func signUpPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "LoginToSignUp", sender: nil)
    }
    
    /// Function showAlert, to show alert or error to user, using UIAlertController
    func showAlert(for alert: String) {
        let alertController = UIAlertController(title: nil, message: alert, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    /// validate method  tries to validate user input and show error when user input is invalid or does not exist.
    func validate() {
        do {
            let email = try emailTextFeild.validatedText(validationType: ValidatorType.email)
            let password = try passwordTextField.validatedText(validationType: ValidatorType.password)
            let data = services.loginService(email: email, password: password)
            if data > 0 {
                print("loggedin User \(DummyData.curruntUser.email )")
                performSegue(withIdentifier: "LoginToItems", sender: nil)
            }else{ showAlert(for: "Login Error")}
        } catch(let error) {
            showAlert(for: (error as! ValidationError).message)
        }
    }
}
