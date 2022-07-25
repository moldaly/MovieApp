//
//  NetworkManager.swift
//  Movies
//
//  Created by Aida Moldaly on 29.05.2022.
//

import Foundation

class NetworkManager {
    private let API_KEY = "e516e695b99f3043f08979ed2241b3db"

    
    static var shared = NetworkManager()
    
    private lazy var urlComponents: URLComponents = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: API_KEY)
        ]
        return components
    }()
    
    private let session: URLSession
    
    init() {
        session = URLSession(configuration: .default)
    }
    
    func loadGenres(completion: @escaping ([Genre]) -> Void) {
        var components = urlComponents
        components.path = "/3/genre/movie/list"
        
        guard let requestUrl = components.url else {
            return
        }
        let task = session.dataTask(with: requestUrl) { data, response, error in
            guard error == nil else {
                print("Error: error calling GET")
                return
            }
            guard let data = data else {
                print("Error: Did not receive data")
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                print("Error: HTTP request failed")
                return
            }
            do {
                let genresEntity = try JSONDecoder().decode(GenresEntity.self, from: data)
                DispatchQueue.main.async {
                    completion(genresEntity.genres)
                }
            } catch {
                DispatchQueue.main.async {
                    completion([])
                }
            }
        }
        
        task.resume()
    }
    
    func loadTodayMovies(completion: @escaping ([Movie]) -> Void) {
        loadMovies(path: "/3/movie/now_playing") { movies in
            completion(movies)
        }
    }
    
    func loadSoonMovies(completion: @escaping ([Movie]) -> Void) {
        loadMovies(path: "/3/movie/upcoming") { movies in
            completion(movies)
        }
    }
    
    func loadTrendingMovies(completion: @escaping ([Movie]) -> Void) {
        loadMovies(path: "/3/trending/movie/week") { movies in
            completion(movies)
        }
    }
    
    
    
    private func loadMovies(path: String, completion: @escaping ([Movie]) -> Void) {
        var components = urlComponents
        components.path = path
        
        guard let requestUrl = components.url else {
            return
        }
            let task = session.dataTask(with: requestUrl) { data, response, error in
                guard error == nil else {
                    print("Error: error calling GET")
                    return
                }
                guard let data = data else {
                    print("Error: Did not receive data")
                    return
                }
                guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                    print("Error: HTTP request failed")
                    return
                }
                do {
                    let moviesEntity = try JSONDecoder().decode(MoviesEntity.self, from: data)
                    DispatchQueue.main.async {
                        completion(moviesEntity.results)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion([])
                    }
                }
            }
        task.resume()
    }
    
//    func loadCastByMovieID(id: Int, completion: @escaping ([Cast]) -> Void ) {
//        loadCast(path: "/movie/\(id)/credits") { cast in
//            completion(cast)
//        }
//    }
//
//    private func loadCast(path: String, completion: @escaping ([Cast]) -> Void) {
//        var components = urlComponents
//        components.path = path
//
//        guard let requestUrl = components.url else {
//            return
//        }
//            let task = session.dataTask(with: requestUrl) { data, response, error in
//                guard error == nil else {
//                    print("Error: error calling GET")
//                    return
//                }
//                guard let data = data else {
//                    print("Error: Did not receive data")
//                    return
//                }
//                guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
//                    print("Error: HTTP request failed")
//                    return
//                }
//                do {
//                    let castEntity = try JSONDecoder().decode(CastEntity.self, from: data)
//                    DispatchQueue.main.async {
//                        completion(castEntity.cast)
//                    }
//                } catch {
//                    DispatchQueue.main.async {
//                        completion([])
//                    }
//                }
//            }
//        task.resume()
//    }
}
