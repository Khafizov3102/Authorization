//
//  ViewController.swift
//  Authorization
//
//  Created by Денис Хафизов on 06.10.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let username = "admin"
    let password = "admin"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "WelcomeSegue" else { return }
        guard let destination = segue.destination as? WelcomeViewController else { return }
        
        destination.username = usernameTextField.text ?? ""
    }
    
    @IBAction func forgotUsernameButtonPressed() {
    }
    
    @IBAction func forgotPassButtonPressed() {
    }
    
    @IBAction func loginButtonPressed() {
        if usernameTextField.text == username &&
            passwordTextField.text == password {
            performSegue(withIdentifier: "WelcomeSegue", sender: self)
        }
    }
}

