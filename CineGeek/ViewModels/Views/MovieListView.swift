//
//  MovieListView.swift
//  TmdbMovieApp
//
//  Created by Berkay YILDIRIM on 05.04.2022.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var movieSearchState = MovieSearchState()
    @ObservedObject private var nowPlayingState = MovieListState()
    @ObservedObject private var popularState = MovieListState()

    var body: some View {
       
        NavigationView {
            
            List {
                Group{

                SearchBarView(placeholder: "Search movies", text: self.$movieSearchState.query)
                                .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                            LoadingView(isLoading: self.movieSearchState.isLoading, error: self.movieSearchState.error) {
                                self.movieSearchState.search(query: self.movieSearchState.query)
                            }
                        
                        
                                if self.movieSearchState.movies != nil {
                                    ForEach(self.movieSearchState.movies!) { movie in
                                       // VStack{
                                        NavigationLink(destination: MovieDetailView(movieId: movie.id, movieTitle: movie.title)) {
                                            
                                            VStack(alignment: .leading) {
                                                Text(movie.title)
                                                Text(movie.yearText)
                                            }
                                        }
                                      //}
                                    }
                                    
                                }
                
                            
                          
                        }
                
                Group {
                    if nowPlayingState.movies != nil {
                        MoviePosterCarouselView(title: LocalizedStringKey("Now Playing"), movies: nowPlayingState.movies!)
                        
                    } else {
                        LoadingView(isLoading: self.nowPlayingState.isLoading, error: self.nowPlayingState.error) {
                            self.nowPlayingState.loadMovies(with: .nowPlaying)
                        }
                    }
                    
                }
                .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                
                
                Group {
                    if popularState.movies != nil {
                        MovieBackdropCarouselView(title:LocalizedStringKey("MostPopular"), movies: popularState.movies!)
                        
                    } else {
                        LoadingView(isLoading: self.popularState.isLoading, error: self.popularState.error) {
                            self.popularState.loadMovies(with: .popular)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 0))
                
                
            
            }
            .navigationBarTitle("CineGeek")
        
        }

        .onAppear {
            self.movieSearchState.startObserve()
            self.nowPlayingState.loadMovies(with: .nowPlaying)
            self.popularState.loadMovies(with: .popular)
        }
        
    
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
