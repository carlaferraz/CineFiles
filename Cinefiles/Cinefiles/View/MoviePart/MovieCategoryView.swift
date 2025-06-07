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
        VStack{
            Text(categoryName)
            
            ScrollView(.horizontal){
                HStack(spacing: 20){
                    ForEach(movieModel.movies){ movie in
                        if movie.category.contains(categoryName){
                            NavigationLink(destination: MovieView(movie: movie)){
                                Image(movie.image)
                            }
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MovieCategoryView(categoryName: "Aventura")
}
