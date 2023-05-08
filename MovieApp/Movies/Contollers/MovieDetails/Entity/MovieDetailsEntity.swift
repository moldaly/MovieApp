//
//  MovieDetail.swift
//  Movies
//
//  Created by tamzimun on 21.07.2022.
//

import Foundation

struct MovieDetailsEntity: Decodable {
    enum CodingKeys: String, CodingKey {
        case name = "original_title"
        case date = "release_date"
        case rating = "vote_average"
        case image = "backdrop_path"
        case description = "overview"
    }
    
    let name: String
    let date: String
    let rating: Double
    let posterUrl: String?
    let decription: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        date = try container.decode(String.self, forKey: .date)
        rating = try container.decode(Double.self, forKey: .rating)
        decription = try? container.decodeIfPresent(String.self, forKey: .description)
        if let image = try? container.decodeIfPresent(String.self, forKey: .image) {
            posterUrl  =  "https://image.tmdb.org/t/p/w200\(image)"
        } else {
            posterUrl = nil
        }
    }

}
