//
//  MovieView.swift
//  Cinefiles
//
//  Created by Carla Araujo on 30/05/25.
//

import SwiftUI

struct MovieView: View {
    
    
    let movie: MovieDetailModel
    //@Binding var movie: MovieDetailModel
    //@StateObject var movieModel = MovieModel.shared
    
    var body: some View {
        VStack{
            
            //capa, titulo, rating
            HStack{
                //capa
                VStack{
                    Image(movie.image)
                }
                //titulo, rating, visto
                VStack{
                    Text(movie.title)
                    HStack{
                        Image(systemName: "star")
                        Image(systemName: "star")
                        Image(systemName: "star")
                        Image(systemName: "star")
                        Image(systemName: "star")
                    }
                    
                    HStack{
                        Image(systemName: "heart")
                        Image(systemName: "eye")
                    }
                }
            }
            //sinopse e infos
            VStack{
                //sinopse
                Text(movie.description)
                
                //diretor
                HStack{
                    Text("Direção:" )
                    Text(movie.direction)
                }
            
                //ano
                HStack{
                    Text("Ano: ")
                    Text(movie.year)
                }
            }
            
            //streaming e imdb
            HStack{
                //streaming
                VStack{
                    Text("Onde Assistir")
                    HStack{
                        ForEach(movie.streaming, id: \.self) {streamingService in
                            Image(streamingService)
                        }
                    }
                }
                //imdb
                VStack{
                    Text(movie.imdb)
                    Image("imdb")
                    
                }
            }
            
        }
    }
}




#Preview {
    MovieView(
        movie: (
            MovieDetailModel(
                title: "Os Incríveis",
                category: ["Animação", "Ação", "Aventura"],
                image: "os-incriveis",
                description: "Depois do governo banir o uso de superpoderes, o maior herói do planeta, o Sr. Incrível, vive de forma pacata com sua família. Apesar de estar feliz com a vida doméstica, o Sr. Incrível ainda sente falta dos tempos em que viveu como super-herói, e sua grande chance de entrar em ação novamente surge quando um velho inimigo volta a atacar. Só que agora ele precisa contar com a ajuda de toda a família para vencer o vilão.",
                streaming: ["disney-plus", "amazon"],
                imdb: "8.0 / 10",
                direction: "Brad Bird",
                year: "2004",
                isFavorite: false,
                isSeen: false
            )
        )
    )
}
