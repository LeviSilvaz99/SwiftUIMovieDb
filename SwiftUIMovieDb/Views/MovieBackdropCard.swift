//
//  MovieBackdropCard.swift
//  SwiftUIMovieDb
//
//  Created by Levi  on 23/03/22.
//

import SwiftUI

struct MovieBackdropCard: View {
    
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                        .resizable()
                }
            }
            .aspectRatio(16/9, contentMode: .fit)
            .cornerRadius(8)
            .shadow(radius: 4)
            
            Text(movie.title)
        }
        .onAppear{
            self.imageLoader.loadImage(with: self.movie.backdropURL)
        }
    }
}

struct MovieBackdropCard_Previews: PreviewProvider {
    
    static let stubbedMovies = Movie.stubbedMovies
    
    static var previews: some View {
        Group {
            MovieBackdropCard(title: "Now Playing", movies: Movie.stubbedMovies)
        }
    }
}
