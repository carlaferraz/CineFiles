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
            ScrollView{
                VStack{
                    
                    //logo
                    VStack{
                        Image("logo")
                    }
                    
                    //usuario
                    HStack{
                        VStack{
                            Text("O que vamos ver hoje,")
                            //MUDARRRR
                            Text("Fulano" + "?")
                        }
                        //MUDARRR
                        VStack{
                            Image(systemName: "person.fill")
                        }
                    }
                    
                    //recomendacao
                    VStack{
                        Text("Filme Filé da Semana")
                        //video edit
                        Image(movieModel.movies[0].image)
                        HStack{
                            Text(movieModel.movies[0].title)
                            Image(systemName: "eye")
                            Image(systemName: "heart")
                        }
                    }
                    
                    //categorias
                    VStack{
                        
                        MovieCategoryView(categoryName: "Ação", movieModel: movieModel)
                        MovieCategoryView(categoryName: "Aventura", movieModel: movieModel)
                        MovieCategoryView(categoryName: "Drama", movieModel: movieModel)
                        MovieCategoryView(categoryName: "Sci-Fi", movieModel: movieModel)
                        MovieCategoryView(categoryName: "Suspense", movieModel: movieModel)
                        
                        //acao
    //                    VStack{
    //                        Text("Ação")
    //
    //                        ScrollView(.horizontal){
    //                            HStack(spacing: 20){
    //                                ForEach(movieModel.movies){ movie in
    //                                   if movie.category.contains("Ação"){
    //                                        Image(movie.image)
    //                                    }
    //                                }
    //                            }
    //                        }
    //                    }
                        
                        

                        
                        

                        
                        

                        
                        

                        
                    }
                
                }
            }
        }
    }
}




#Preview {
    HomeView()
    
}

