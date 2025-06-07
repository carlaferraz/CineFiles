//
//  ProfileView.swift
//  Cinefiles
//
//  Created by Carla Araujo on 29/05/25.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var movieModel = MovieModel.shared
    
    var body: some View {
    
        NavigationStack{
            ZStack{
                
                LinearGradient(
                    colors: [.black, .azulEscuro], startPoint: .center, endPoint: .bottom)
                .ignoresSafeArea()
                
                ScrollView{
                    VStack{
                        
                        
//                        VStack{
//                            Image("logo")
//                                .resizable()
//                                .scaledToFit( )
//                                .padding(.horizontal, 120)
//                                .padding(.vertical, 24)
//                        }
                        
                        VStack{
                            ZStack {
                                Image("capa-user")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 220)
                                    .clipped()
                                
                                Image("black")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 220)
                                    .clipped()
                                    .opacity(0.5)

                                LinearGradient(
                                    gradient: Gradient(stops: [
                                        .init(color: Color.black.opacity(1.3), location: 0),
                                        .init(color: Color.black.opacity(0.0), location: 0.3),
                                        .init(color: Color.black.opacity(0.0), location: 0.7),
                                        .init(color: Color.black.opacity(1.8), location: 1.1)
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            }
                        }
                        
                        VStack{
                            Image("icon-user")
                                .resizable()
                                .scaledToFit( )
                                .frame(height: 90)
                                .clipShape(Circle())
                                
                            Text("David Britis")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Text("132 pontos")
                                .font(.caption)
                                .fontWeight(.regular)
                                .foregroundStyle(.white)
                        }
                        .offset(x: 0, y: -60)
                        
                        VStack{
                            VStack{
                                if movieModel.movies.contains(where: { $0.isFavorite == true }) {
                                    MovieIsFavoriteView()
                                } else {
                                    Text("Ops! Sem filmes favoritos!")
                                }
                                
                            }
                            .padding(.bottom, 12)
                            
                            VStack{
                                if movieModel.movies.contains(where: { $0.isSeen == true}) {
                                    MovieIsSeenView()
                                } else {
                                    Text("Ops! Você ainda não assistiu nenhum filme!")
                                }
                            }
                        }
                        .offset(x: 0, y: -40)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 40)
                        
                        
                    }
                    .ignoresSafeArea()
                    .padding(.horizontal, 16)

                }
            }
            //.toolbar(.hidden, for: .navigationBar)
          
        }
        
    }
}

#Preview {
    ProfileView()
}
