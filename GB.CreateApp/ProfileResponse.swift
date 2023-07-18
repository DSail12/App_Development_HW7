//
//  ProfileResponse.swift
//  HW7
//
//  Created by Eugene Zvyagin on 17.07.2023.
//

import Foundation

struct ProfileResponse: Decodable {
    let profiles: [Profile]
}

struct Profile: Decodable {
    let firstName: String
    let lastName: String
    let city: City?
    let bdate: String?
}

struct City: Decodable {
    let title: String
}
