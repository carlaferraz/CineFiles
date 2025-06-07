//
//  HomeView.swift
//  Cinefiles
//
//  Created by Carla Araujo on 29/05/25.
//

import SwiftUI

struct HomeView: View {
    
    //escrever isso em cada view sempre pra acessar o singleton :))))
    @StateObject var movieModel = MovieModel.shared
    
//    @Binding var movie: [MovieDetail]
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                
                LinearGradient(
                    colors: [.cinzaEscuro, .azulEscuro, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
                ScrollView{
                    VStack{
                        
                        
//                        //logo
//                        VStack{
//                            Image("logo")
//                                .resizable()
//                                .scaledToFit( )
//                                .padding(.horizontal, 100)
//                                .padding(.vertical, 24)
//                        }
                        
                        //usuario
                        NavigationLink(destination: ProfileView()){
                            HStack{
                                VStack(alignment: .leading){
                                    Text("O que vamos ver hoje,")
                                        .font(.title2)
                                        .bold()
                                        .foregroundStyle(.white)
                                    //MUDARRRR
                                    Text("David Britis" + "?")
                                        .font(.title2)
                                        .bold()
                                        .foregroundStyle(.cinzaClaro)
                                }
                                //MUDARRR
                                Spacer()
                                    Image("icon-user")
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    .frame(width: 70)
                            }
                        }
                        .padding(.bottom, 36)
                        .padding(.top, 16)
                        
                        // Recommendation (Filme Filé da Semana)
                        VStack {
                            
                            HStack{
                                Text("Filme Filé da Semana")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                
                                Spacer()
                                
                                Button{
                                    withAnimation{
                                        movieModel.movies[0].isFavorite.toggle()
                                    }
                                } label: {
                                    Image(systemName: movieModel.movies[0].isFavorite ? "heart.fill" : "heart")
                                        .imageScale(.large)
                                        .foregroundColor(movieModel.movies[0].isFavorite ? .rosa : .gray)
                                }
                                .buttonStyle(.plain)
                                
                                
                                Button{
                                    withAnimation{
                                        movieModel.movies[0].isSeen.toggle()
                                    }
                                } label: {
                                    Image(systemName: movieModel.movies[0].isSeen ? "eye.fill" : "eye")
                                        .imageScale(.large)
                                        .foregroundColor(movieModel.movies[0].isSeen ? .verde : .gray)
                                }
                                .buttonStyle(.plain)
                            }
                            
                                
                            
                            if let firstMovie = movieModel.movies.first {
                                VStack(alignment: .leading, spacing: 12) {
                                    Image("shrek-capa")
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(16)
                              
                                    
                                    HStack {
                                        Text(firstMovie.title)
                                            .font(.headline)
                                            .fontWeight(.medium)
                                            .foregroundStyle(.white)
                                    }
                       
                                }
                            } else {
                                Text("Carregando filme em destaque...")
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.bottom, 24)
                        
                        Spacer()
                        
                        //categorias
                        VStack{
                            
                            MovieCategoryView(categoryName: "Ação", movieModel: movieModel)
                            MovieCategoryView(categoryName: "Aventura", movieModel: movieModel)
                            MovieCategoryView(categoryName: "Animação", movieModel: movieModel)
                            MovieCategoryView(categoryName: "Comédia", movieModel: movieModel)
                            MovieCategoryView(categoryName: "Drama", movieModel: movieModel)
                            MovieCategoryView(categoryName: "Sci-Fi", movieModel: movieModel)
                            MovieCategoryView(categoryName: "Suspense", movieModel: movieModel)
                        }
                        .padding(.bottom, 100)
                    
                    }
                    
                    .ignoresSafeArea()
                    .padding(.horizontal, 16)
                }
            }
            .toolbar(.hidden, for: .navigationBar)
            
        }
    }
}




#Preview {
    HomeView()
        .preferredColorScheme(.dark)
    
}

