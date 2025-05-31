//
//  ActionModal.swift
//  Cinefiles
//
//  Created by Carla Araujo on 29/05/25.
//

import SwiftUI

struct ActionSheetView: View {
    
    @State private var searchText = ""
    @State private var searchIsActive = false
    
    var body: some View {
        NavigationStack {
            VStack{
                List{
                    ForEach(searchResults){ movie in
                        HStack{
                            NavigationLink(destination: MovieView(movie: movie)){
                                Image(movie.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60)
                            }
                            
                        }
                    }
                }
            }
           
        }
        .searchable(text: $searchText, isPresented: $searchIsActive)
    }
    
    var searchResults: [MovieDetailModel] {
            if searchText.isEmpty {
                return MovieModel.shared.movies
            } else {
                return MovieModel.shared.movies.filter {
                    //$0 é o item em questão
                    $0.title.lowercased().contains(searchText.lowercased())
                }
            }
        }
}

#Preview {
    ActionSheetView()
}
