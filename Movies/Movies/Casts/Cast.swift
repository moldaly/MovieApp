//
//  Casts.swift
//  Movies
//
//  Created by tamzimun on 19.05.2022.
//

import Foundation

struct Cast: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case position = "known_for_department"
        case image = "profile_path"
        case birthday
        case biography
        case birthPlace = "place_of_birth"
    }
    
    let id: Int
    let name: String?
    let position: String?
    let image: String?
    let birthday: String?
    let biography: String?
    let birthPlace: String?
}
