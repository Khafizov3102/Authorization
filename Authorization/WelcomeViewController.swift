//
//  WelcomeViewController.swift
//  Authorization
//
//  Created by Денис Хафизов on 06.10.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, \(username ?? "")"
    }
}
