//
//  User.swift
//  GHProfiles
//
//  Created by Valentino De Paola Gallardo on 02/09/25.
//

import Foundation

struct User: Codable {
    let login: String
    let name: String?
    let avatar_url: String
    let followers: Int
}
