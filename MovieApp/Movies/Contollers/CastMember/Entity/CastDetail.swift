//
//  CastDetail.swift
//  Movies
//
//  Created by Aida Moldaly on 21.07.2022.
//

import Foundation

struct CastDetail: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case position = "known_for_department"
        case image = "profile_path"
        case birthday
        case biography
        case birthPlace = "place_of_birth"
    }

    let name: String
    let position: String
    let castUrl: String?
    let birthday: String
    let biography: String
    let birthPlace: String
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        position = try container.decode(String.self, forKey: .position)
        
        if let image = try? container.decodeIfPresent(String.self, forKey: .image) {
            castUrl  =  "https://image.tmdb.org/t/p/w200\(image)"
        } else {
            castUrl = nil
        }
        
        birthday = try container.decode(String.self, forKey: .birthday)
        biography = try container.decode(String.self, forKey:.biography)
        birthPlace = try container.decode(String.self, forKey: .birthPlace)
    }
}

