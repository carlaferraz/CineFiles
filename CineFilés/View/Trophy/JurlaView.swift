//
//  JurcaView.swift
//  Cinefiles
//
//  Created by Carla Araujo on 05/06/25.
//

//
//  ProfileListView.swift
//  Cinefiles
//
//  Created by Carla Araujo on 04/06/25.
//

import SwiftUI


struct JurlaView: View {
    
    @StateObject var movieModel = MovieModel.shared
    
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                
                LinearGradient(
                    colors: [.black, .azulEscuro], startPoint: .center, endPoint: .bottom)
                .ignoresSafeArea()
                
                ScrollView{
                    VStack{
                        
                        VStack{
                            ZStack{
                                Image("capa-jurla")
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
                            Image("jurla")
                                .resizable()
                                .scaledToFit( )
                                .frame(height: 90)
                                .clipShape(Circle())
                            
                            Text("Jurla Silva")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            
                            Text("95 pontos")
                                .font(.caption)
                                .fontWeight(.regular)
                                .foregroundStyle(.white)
                        }
                        .offset(x: 0, y: -60)
                        
                        
                        VStack{
                            
                            
                            //filme favorito
                            VStack(alignment: .leading){
                                Text("Favoritos")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                ScrollView(.horizontal){
                                    HStack{
                                        ForEach(movieModel.movies.suffix(5)) { movie in
                                            Image(movie.image)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 120, height: 180)
                                                .clipped()
                                                .cornerRadius(8)
                                        }
                                            
                                    }
                                }
                            }
                            .padding(.bottom, 12)
                            
                            VStack(alignment: .leading){
                                Text("Vistos")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.white)
                                ScrollView(.horizontal){
                                    HStack{
                                        ForEach(movieModel.movies.prefix(8)) { movie in
                                            Image(movie.image)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 120, height: 180)
                                                .clipped()
                                                .cornerRadius(8)
                                        }
                                            
                                    }
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
        }
        
    }
}

#Preview{
    JurlaView()
}
