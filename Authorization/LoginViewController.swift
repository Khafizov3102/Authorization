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
    
    let user = UserModel.getUser()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "WelcomeSegue" else { return }
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            } else if let navigationVC = viewController as? UINavigationController {
                guard let userInfoVC = navigationVC.topViewController as? UserInfoViewController else { return }
                userInfoVC.userInfo = user.userInfo
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard usernameTextField.text == user.login, passwordTextField.text == user.password else {
            setupAlert(title: "Неверный логин или пароль", message: "Проверльте правильность ведненных данных и попробуйте еще раз.", textField: passwordTextField)
            return false
        }
        return true
    }
    
    @IBAction func forgotButtonPressed(_ sender: UIButton) {
        if sender.tag == 1 {
            setupAlert(title: "Забыли имя пользователя?", message: "Ваше имя пользователя: \(user.login)")
        } else {
            setupAlert(title: "Забыли пароль?", message: "Ваш пароль: \(user.password)")
        }
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

