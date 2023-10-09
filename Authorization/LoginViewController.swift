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
        
        destination.username = usernameTextField.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard usernameTextField.text == username, passwordTextField.text == password else {
            setupAlert(title: "Неверный логин или пароль", message: "Проверльте правильность ведненных данных и попробуйте еще раз.", textField: passwordTextField)
            return false
        }
        return true
    }
    
    @IBAction func forgotUsernameButtonPressed() {
        setupAlert(title: "Забыли имя пользователя?", message: "Ваше имя пользователя: \(username)")
    }
    
    @IBAction func forgotPassButtonPressed() {
        setupAlert(title: "Забыли пароль?", message: "Ваш пароль: \(password)")
    }
    
    @IBAction func loginButtonPressed() {
    }
    
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func setupAlert(title: String, message: String?, textField: UITextField? = nil) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        let action = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
}

