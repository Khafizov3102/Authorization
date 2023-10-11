//
//  User.swift
//  Authorization
//
//  Created by Денис Хафизов on 11.10.2023.
//

import Foundation
import UIKit

struct UserModel {
    let login: String
    let password: String
    let userInfo: userInformanion
}

struct userInformanion {
    let name: String
    let surname: String
    let company: String
    let department: String
    let post: String
    let image: UIImage?
    let bio: String
}

extension UserModel {
    static func getUser() -> UserModel {
        UserModel(
            login: "admin",
            password: "admin",
            userInfo: userInformanion(
                name: "Tim",
                surname: "Cook",
                company: "Apple",
                department: "Management",
                post: "CEO",
                image: UIImage(named: "Tim Cook"),
                bio: "Ти́моти До́нальд Кук (англ. Timothy Donald Cook; род. 1 ноября 1960 года, Мобил, Алабама, США)[4] — американский топ-менеджер, миллиардер. Генеральный директор компании Apple. Пришёл в компанию в марте 1998 года. Занял должность гендиректора после отставки (в связи с продолжительной болезнью) Стива Джобса 24 августа 2011 года."
            )
        )
    }
}
