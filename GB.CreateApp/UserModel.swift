//
//  UserModel.swift
//  HW7
//
//  Created by Eugene Zvyagin on 17.07.2023.
//

struct UserModel: Decodable {
    var response: [User]
}
struct User: Decodable {
    let firstName: String?
    let lastName: String?
    var photo: String?
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_400_orig"
    }
}
