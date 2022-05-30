//
//  Genres.swift
//  Movies
//
//  Created by Aida Moldaly on 19.05.2022.
//

import Foundation

struct Genre: Decodable {
    var id: Int
    var name: String?
}

struct GenresEntity: Decodable {
    let genres: [Genre]
}
