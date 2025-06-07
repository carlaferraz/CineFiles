//
//  DesafioView.swift
//  Cinefiles
//
//  Created by Carla Araujo on 05/06/25.
//

import SwiftUI

struct DesafioView: View {
    var body: some View {
        ZStack{
            LinearGradient(
                colors: [.cinzaEscuro, .azulEscuro, .black], startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            ScrollView{
                VStack(alignment: .center, spacing: 8){
                    
                    //titulo da pagina
                    VStack(alignment: .center){
                        Image(systemName: "trophy")
                            .font(.system(size: 48))
                            .foregroundColor(.white)
                            .padding(.bottom, 1)
                                
                       
                        Text("Desafio")
                            .font(.system(size: 32))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("da semana")
                            .font(.system(size: 32))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .offset(x: 0, y: -5)
                    }
                    .padding(.top, 24)
                    
                    //desafios
                    VStack(spacing: 16){
                        
                        //desafio1
                        ZStack{
                            Color.rosa
                            HStack{
                                VStack(alignment: .leading, spacing: 8){
                                    Text("Desafio 1")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundStyle(.white)
                                    Text("Assistir 5 filmes\nde comédia")
                                        .font(.caption)
                                        .foregroundStyle(.white)
                                }
                                
                                Spacer()
                                Image("desafio1")
                                
                            }
                            .padding(.vertical, 16)
                            .padding(.horizontal, 24)
                        }
                        .cornerRadius(16)
                        
                        //desafio2
                        ZStack{
                            Color.roxo
                            HStack{
                                VStack(alignment: .leading, spacing: 8){
                                    Text("Desafio 2")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundStyle(.white)
                                    Text("Favoritar 2 filmes não americanos")
                                        .font(.caption)
                                        .foregroundStyle(.white)
                                }
                                
                                Spacer()
                                Image("desafio2")
                                
                            }
                            .padding(.vertical, 16)
                            .padding(.horizontal, 24)
                        }
                        .cornerRadius(16)
                        
                        //desafio3
                        ZStack{
                            Color.azulMedio
                            HStack{
                                VStack(alignment: .leading, spacing: 8){
                                    Text("Desafio 3")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundStyle(.white)
                                    Text("Classificar 5 filmes\ncom nota maior de 7 no IMDB")
                                        .font(.caption)
                                        .foregroundStyle(.white)
                                }
                                
                                Spacer()
                                Image("desafio3")
                                
                            }
                            .padding(.vertical, 16)
                            .padding(.horizontal, 24)
                        }
                        .cornerRadius(16)

                        
                        

                    }
                    .padding(40)
                    
                    
                    
                }
            }
        }
    }
}

#Preview {
    DesafioView()
}
