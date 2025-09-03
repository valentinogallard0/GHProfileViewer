//
//  Repositorio.swift
//  GHProfiles
//
//  Created by Valentino De Paola Gallardo on 02/09/25.
//

import Foundation

struct Repositorio: Codable{
    let name: String
    let description: String?
    let language: String?
    let fork: Bool
}
