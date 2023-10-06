//
//  ViewController.swift
//  Authorization
//
//  Created by Денис Хафизов on 06.10.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let username = "admin"
    private let password = "admin"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "WelcomeSegue" else { return }
        guard let destination = segue.destination as? WelcomeViewController else { return }
        
        destination.username = usernameTextField.text ?? ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard usernameTextField.text == username, passwordTextField.text == password else {
            showLoginAlert()
            usernameTextField.text = ""
            passwordTextField.text = ""
            return false
        }
        return true
    }
    
    @IBAction func forgotUsernameButtonPressed() {
        showUsernameAlert()
    }
    
    @IBAction func forgotPassButtonPressed() {
        showPasswordAlert()
    }
    
    @IBAction func loginButtonPressed() {
        if shouldPerformSegue(withIdentifier: "WelcomeSegue", sender: self) {
            performSegue(withIdentifier: "WelcomeSegue", sender: self)
        }
    }
    
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    func showUsernameAlert() {
        let usernameAlertController = UIAlertController(
            title: "Forgot your username?",
            message: "Your username is \(username)",
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(title: "OK", style: .default)
        
        usernameAlertController.addAction(action)
        
        present(usernameAlertController, animated: true, completion: nil)
    }
    
    func showPasswordAlert() {
        let passwordAlertController = UIAlertController(
            title: "Forgot password?",
            message: "Your password is \(password)",
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(title: "OK", style: .default)
        
        passwordAlertController.addAction(action)
        
        present(passwordAlertController, animated: true, completion: nil)
    }
    
    func showLoginAlert() {
        let loginAlertController = UIAlertController(
            title: "Invalid username or password",
            message: "Please, enter correct username and password",
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(title: "OK", style: .default)
        
        loginAlertController.addAction(action)
        
        present(loginAlertController, animated: true, completion: nil)
    }
}

