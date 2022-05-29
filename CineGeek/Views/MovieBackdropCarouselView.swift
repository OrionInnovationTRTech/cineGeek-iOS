//
//  MovieBackdropCarouselView.swift
//  TmdbMovieApp
//
//  Created by Berkay YILDIRIM on 05.04.2022.
//

import SwiftUI

struct MovieBackdropCarouselView: View {

    let title: LocalizedStringKey
    let movies: [Movie]

    var body: some View {
        VStack(alignment: .leading , spacing: 20) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center , spacing: 30) {

             //   List{

                    ForEach(self.movies) { movie in
                        NavigationLink(destination: MovieDetailView(movieId: movie.id, movieTitle: movie.title)) {
                            MovieBackdropCard(movie: movie)
                                .frame(width: 330, height: 150)
                        }
                    }
              //  }
            }
        }
        }
    }
}

struct MovieBackdropCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        MovieBackdropCarouselView(title: "Latest", movies: Movie.stubbedMovies)
    }
}

