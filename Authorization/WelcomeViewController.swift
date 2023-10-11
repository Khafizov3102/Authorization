//
//  WelcomeViewController.swift
//  Authorization
//
//  Created by Денис Хафизов on 06.10.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var userInfoLabel: UILabel!
    
    var user: UserModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabel(label: welcomeLabel, text: "Welcome, \(user.login)")
        setupLabel(label: userInfoLabel, text: "My name is \(user.userInfo.name) \(user.userInfo.surname)")
        
    }
    
    private func setupLabel(label: UILabel, text: String) {
        label.font = .boldSystemFont(ofSize: 23)
        label.text = text
    }
}
