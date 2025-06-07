//
//  MovieView.swift
//  Cinefiles
//
//  Created by Carla Araujo on 30/05/25.
//

import SwiftUI

struct MovieView: View {
    
    
    //let movie: MovieDetailModel
    @Binding var movie: MovieDetailModel
    //@StateObject var movieModel = MovieModel.shared
    
    var body: some View {
        ZStack{
            LinearGradient(
                colors: [.cinzaEscuro, .azulEscuro, .black], startPoint: .topLeading, endPoint: .bottom)
            .ignoresSafeArea()
            
            ScrollView{
                VStack (alignment: .leading, spacing: 0){
                    
                    //capa, titulo, rating
                    HStack{
                        
                        //capa
                        VStack{
                            Image(movie.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 225)
                                .cornerRadius(8)
                            }
                        .padding(.trailing, 30)
                        
                        
                        //titulo, rating, visto
                        VStack(alignment: .leading, spacing: 24){
                            
                            Text(movie.title)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .lineLimit(3)
                               
                            //RATING - MODIFICACAO SUSPEITA DO BOTAO FAVORITAR
                            HStack(spacing: 4) {
                                    ForEach(1..<6) { index in
                                        Button {
                                            withAnimation {
                                                movie.rating = (movie.rating == index) ? 0 : index
                                            }
                                        } label: {
                                            Image(systemName: index <= movie.rating ? "star.fill" : "star")
                                                .foregroundColor(.blue)
                                        }
                                        .buttonStyle(.plain)
                                    }
                                }
                            .padding(.bottom, 4)
                            
                            
                            HStack(spacing: 20){
                                
                                //BOTAO DE FAVORITAR
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
                                
                                //BOTAO DE VISTO
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
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding(.bottom, 40)
                    
                    //sinopse e infos
                    VStack(alignment: .leading, spacing: 16){
                        //sinopse
                        VStack(alignment: .leading, spacing: 12){
                            Text(movie.title)
                                .foregroundColor(.white)
                            Text(movie.description)
                                .foregroundColor(.cinzaClaro)
                        }
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        //diretor
                        HStack{
                            Text("Direção: " )
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .padding(.top, 8)
                                .fontWeight(.bold)
                            Text(movie.direction)
                                .font(.subheadline)
                                .foregroundColor(.cinzaClaro)
                                .padding(.top, 8)
                        }
                    
                        //ano
                        HStack{
                            Text("Ano: ")
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .padding(.top, 8)
                                .fontWeight(.bold)
                            Text(movie.year)
                                .font(.subheadline)
                                .foregroundColor(.cinzaClaro)
                                .padding(.top, 8)
                        }
                    }
                    .padding(.bottom, 24)
     
                    
                    //streaming e imdb
                    HStack{
                        //streaming
                        VStack{
                            Text("Onde Assistir")
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            HStack{
                                ForEach(movie.streaming, id: \.self) {streamingService in
                                    Image(streamingService)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40)
                                       
                                }
                            }
                        }
                        Spacer()
                        //imdb
                        VStack{
                            HStack(spacing: 5){
                                Image(systemName: "star.fill")
                                Text(movie.imdb)
                                    
                            }
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            
                            Image("imdb")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 70, height: 35)
                                .cornerRadius(8)
                            
                        }
                    }
                    
                }
                .padding(16)
            }
        }
        //.toolbar(.hidden, for: .navigationBar)
    }
}




#Preview {
    // ESSENCIAL: .constant() cria um Binding "somente leitura" para o preview
    MovieView(
        movie: .constant(
            MovieDetailModel(
                title: "Os Incríveis",
                category: ["Animação", "Ação", "Aventura"],
                image: "os-incriveis",
                description: "Depois do governo banir o uso de superpoderes, o maior herói do planeta, o Sr. Incrível, vive de forma pacata com sua família. Apesar de estar feliz com a vida doméstica, o Sr. Incrível ainda sente falta dos tempos em que viveu como super-herói, e sua grande chance de entrar em ação novamente surge quando um velho inimigo volta a atacar. Só que agora ele precisa contar com a ajuda de toda a família para vencer o vilão.",
                streaming: ["disney-plus", "amazon"],
                imdb: "8.0 / 10",
                direction: "Brad Bird",
                year: "2004",
                rating: 0,
                isFavorite: false, // Forneça um valor inicial
                isSeen: false      // Forneça um valor inicial
            )
        )
    )
}
