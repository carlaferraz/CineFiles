//
//  MoviesIsFavoriteView.swift
//  Cinefiles
//
//  Created by Carla Araujo on 31/05/25.
//


import SwiftUI

struct MovieIsFavoriteView: View {
    
    @StateObject var movieModel = MovieModel.shared
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Favoritos")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 20){
                    ForEach($movieModel.movies){ $movie in
                        if movie.isFavorite {
                            NavigationLink(destination: MovieView(movie: $movie)){
                                Image(movie.image)
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(8)
                                    .frame(height: 170)
                            }
                        }
                    }
                }
                .padding(.horizontal, 4)
                .padding(.vertical, 4)
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .padding(.vertical, 16)
    }
}

