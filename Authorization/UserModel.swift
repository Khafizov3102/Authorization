//
//  User.swift
//  Authorization
//
//  Created by Денис Хафизов on 11.10.2023.
//

import Foundation

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
}

extension UserModel {
    static func getUser() -> [UserModel] {
        [UserModel(
            login: "admin",
            password: "admin",
            userInfo: userInformanion(
                name: "1",
                surname: "2",
                company: "3",
                department: "4",
                post: "5"
            )
        )
        ]
    }
}
