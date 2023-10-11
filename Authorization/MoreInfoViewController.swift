//
//  MoreInfoViewController.swift
//  Authorization
//
//  Created by Денис Хафизов on 11.10.2023.
//

import UIKit

class MoreInfoViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userInformationLabel: UILabel!
    
    var userInfo: userInformanion!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameLabel.text = "\(userInfo.name) \(userInfo.surname)"
        userInformationLabel.text = userInfo.bio
    }
}
