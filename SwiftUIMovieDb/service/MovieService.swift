//
//  MovieService.swift
//  SwiftUIMovieDb
//
//  Created by Levi  on 22/03/22.
//

import Foundation

protocol MovieService {
    
    func fetchMovies(from endpoint: MovieListEndpoint, completion: @escaping (Result<MovieResponse, MovieError>) -> ())
    
    func fetchMovie(id: Int, completion: @escaping (Result<Movie, MovieError>) -> ())
    func searchMovie(query: String, completion: @escaping (Result<MovieResponse, MovieError>) -> ())
}

enum MovieListEndpoint: String, CaseIterable{
    case nowPlaying = "now_playing"
    case upcoming
    case topRated = "top_rated"
    case popular
    
    var description: String {
        switch self {
        case .nowPlaying:
            return "Now Playing"
        case .upcoming:
            return "Upcoming"
        case .topRated:
            return "Top Rated"
        case .popular:
            return "Popular"
        }
    }
}

enum MovieError: Error, CustomNSError {
    case apiError, invalidEndPoint, invalidResponse, noData, serializationError
    
    var localizedDescription: String {
        switch self {
        case .apiError:
            return "Failed to fetch data"
        case .invalidEndPoint:
            return "Invalid endpoint"
        case .invalidResponse:
            return "Invalid response"
        case .noData:
            return "No data"
        case .serializationError:
            return "Failed to decode data"
        }
    }
    
    var errorUserInfo: [String: Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}


