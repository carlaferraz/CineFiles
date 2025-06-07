//
//  MovieCategoryView.swift
//  Cinefiles
//
//  Created by Carla Araujo on 30/05/25.
//

import SwiftUI

struct MovieCategoryView: View {
    
    let categoryName: String
    
    @StateObject var movieModel = MovieModel.shared
    
    var body: some View {
        VStack(alignment: .leading){
            Text(categoryName)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 16){
                    ForEach($movieModel.movies){ $movie in
                        if movie.category.contains(categoryName){
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
        .padding(.vertical, 16)
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    MovieCategoryView(categoryName: "Aventura")
}
