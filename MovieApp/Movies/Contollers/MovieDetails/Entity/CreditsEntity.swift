//
//  CreditsEntity.swift
//  Movies
//
//  Created by Aida Moldaly on 19.05.2022.
//

import Foundation

struct CreditsEntity: Decodable {
    let cast: [Cast]
}

struct Cast: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case position = "known_for_department"
        case image = "profile_path"
    }
    
    let id: Int
    let name: String
    let position: String
    let castUrl: String?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        position = try container.decode(String.self, forKey: .position)
        if let image = try? container.decodeIfPresent(String.self, forKey: .image) {
            castUrl  =  "https://image.tmdb.org/t/p/w200\(image)"
        } else {
            castUrl = nil
        }
    }
}
