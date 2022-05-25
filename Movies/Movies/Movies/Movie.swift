//
//  Movies.swift
//  Movies
//
//  Created by Aida Moldaly on 18.05.2022.
//

import Foundation
import UIKit

typealias ID = Int

struct Movie {
    var image: UIImage?
    var name: String?
    var rating: Double?
    var genreIds: [ID]
    var id: Int
    
    var descriptionImage: UIImage?
    var date: String?
    var description: String?
    
}
