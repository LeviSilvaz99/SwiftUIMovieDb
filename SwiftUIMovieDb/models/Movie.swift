//
//  Movie.swift
//  SwiftUIMovieDb
//
//  Created by Levi  on 22/03/22.
//

import Foundation

struct MovieResponse: Decodable {
    
    let results: [Movie]
}

struct Movie: Decodable {
    
    let id: Int
    let title: String
    let backdropPath: String?
    let posterPath: String?
    let overview: String
    let voteAverage: Double
    let voteCount: Int
    let runtime: Int?
    
    var backdropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")! 
    }
    
}
