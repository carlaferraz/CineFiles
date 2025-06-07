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
    @StateObject var movieModel = MovieModel.shared
    
    var body: some View {
        NavigationStack {
            ZStack{
                
                Color.black
                    .ignoresSafeArea()
                
                VStack{
                    List{
                        ForEach($movieModel.movies.filter{
                            searchText.isEmpty || $0.wrappedValue.title.lowercased().contains(searchText.lowercased())
                            }){ $movie in
                            HStack{
                                NavigationLink(destination: MovieView(movie: $movie)){
                                    
                                    Image(movie.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 60)
                                    
                                    Text(movie.title)
                                        .lineLimit(1)
                                    
                                    Spacer()
                                    
                                    Button{
                                        withAnimation{
                                            movie.isFavorite.toggle()
                                        }
                                    } label: {
                                        Image(systemName: movie.isFavorite ? "heart.fill" : "heart")
                                            .imageScale(.large)
                                            .foregroundColor(movie.isFavorite ? .rosa : .gray)
                                    }
                                    .buttonStyle(.plain)
                                    
                                    Button{
                                        withAnimation{
                                            movie.isSeen.toggle()
                                        }
                                    } label: {
                                        Image(systemName: movie.isSeen ? "eye.fill" : "eye")
                                            .imageScale(.large)
                                            .foregroundColor(movie.isSeen ? .verde : .gray)
                                    }
                                    .buttonStyle(.plain)
                                }
                                
                            }
                                
                                
                        }
                    }
                }
            }
            
        
      
           
        }
        .searchable(text: $searchText, isPresented: $searchIsActive)
        .navigationTitle("Buscar Filme") //nome da pagina
        .navigationBarTitleDisplayMode(.inline)
    }
    
//    var searchResults: [MovieDetailModel] {
//            if searchText.isEmpty {
//                return MovieModel.shared.movies
//            } else {
//                return MovieModel.shared.movies.filter {
//                    //$0 é o item em questão
//                    $0.title.lowercased().contains(searchText.lowercased())
//                }
//            }
//        }
}

#Preview {
    ActionSheetView()
}
