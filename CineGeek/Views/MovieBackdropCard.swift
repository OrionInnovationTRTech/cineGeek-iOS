//
//  MovieBackdropCard.swift
//  TmdbMovieApp
//
//  Created by Berkay YILDIRIM on 05.04.2022.
//

import SwiftUI

struct MovieBackdropCard: View {
    
    let movie: Movie
    @ObservedObject  var movieDetailState = MovieDetailState()
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        
        
        HStack(alignment: .center) {
            ZStack(alignment: .center) {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))

                
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)

                }
            }

            .frame(width: 112, height: 152)
            .aspectRatio(contentMode: .fill)
            .cornerRadius(10)
            .shadow(radius: 4)
            .padding()
            Text("  ")

            ZStack(alignment: .leading){
                VStack{
                Text(movie.title)
                        .foregroundColor(.black)

                Text("Release: " + movie.yearText)
                        .foregroundColor(.black)
                Text("Genre: " + movie.genreText)
                        .foregroundColor(.black)
                  
                Text("Imdb Rating : " + movie.scoreText)
                        .foregroundColor(.yellow)
            }
            }
          
        }
            
        
        .onAppear {
            self.imageLoader.loadImage(with: self.movie.backdropURL)
        }
    }
}

struct MovieBackdropCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieBackdropCard(movie: Movie.stubbedMovie)
    }
}
