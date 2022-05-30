//
//  Movies.swift
//  Movies
//
//  Created by Aida Moldaly on 18.05.2022.
//

import Foundation


struct Movie: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case name = "original_title"
        case date = "released_date"
        case rating = "vote_average"
        case image = "poster_path"
        case genreIds = "genre_ids"
    }
    var id: Int
    var name: String?
    var date: String?
    var rating: Double
    var image: String?
    var genreIds: [Int]

}

struct MoviesEntity: Decodable {
    let results: [Movie]
}
