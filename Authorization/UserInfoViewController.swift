//
//  UserInfoViewController.swift
//  Authorization
//
//  Created by Денис Хафизов on 11.10.2023.
//

import UIKit

final class UserInfoViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    
    @IBOutlet weak var userImage: UIImageView!
    
    var userInfo: userInformanion!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "\(userInfo.name) \(userInfo.surname)"
        userImage.image = userInfo.image
        setupLabel()
    }
    
    override func viewDidLayoutSubviews() {
        userImage.layer.cornerRadius = userImage.frame.height / 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "UserInfoSegue" else { return }
        guard let infoViewController = segue.destination as? MoreInfoViewController else { return }
        infoViewController.userInfo = userInfo
    }
    
    func setupLabel() {
        nameLabel.text = "Имя: \(userInfo.name)"
        surnameLabel.text = "Фамилия: \(userInfo.surname)"
        companyLabel.text = "Компания: \(userInfo.company)"
        departmentLabel.text = "Отдел: \(userInfo.department)"
        postLabel.text = "Должность: \(userInfo.post)"
    }
}
