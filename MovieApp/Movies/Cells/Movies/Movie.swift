//
//  Movies.swift
//  Movies
//
//  Created by tamzimun on 18.05.2022.
//

import Foundation

struct Movie: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case name = "original_title"
        case date = "release_date"
        case rating = "vote_average"
        case image = "poster_path"
        case genreIds = "genre_ids"
        case description = "overview"
    }
    
    let decription: String
    let id: Int
    let name: String?
    let date: String?
    let rating: Double
    let posterUrl: String?
    let genreIds: [Int]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try? container.decodeIfPresent(String.self, forKey: .name)
        date = try? container.decodeIfPresent(String.self, forKey: .date)
        rating = try container.decode(Double.self, forKey: .rating)
        decription = try container.decode(String.self, forKey: .description)
        if let image = try? container.decodeIfPresent(String.self, forKey: .image) {
            posterUrl  =  "https://image.tmdb.org/t/p/w200\(image)"
        } else {
            posterUrl = nil
        }
        genreIds = try container.decode([Int].self, forKey: .genreIds)
    }

}

struct MoviesEntity: Decodable {
    let results: [Movie]
}
