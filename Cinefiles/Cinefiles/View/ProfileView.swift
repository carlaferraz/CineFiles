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
    
        ScrollView{
            VStack{
                VStack{
                    Image("logo")
                }
                
                VStack{
                    Image(systemName: "person.circle")
                     //   .offset(y)
                    Text("Fulano")
                    
                }
                
                VStack{
                    Text("Favoritos")
                    ScrollView(.horizontal){
                        HStack(spacing: 20){
                            ForEach(movieModel.movies){ movie in
                                if movie.category.contains("Ação"){
                                    Image(movie.image)
                                }
                            }
                        }
                    }
                }
                
                VStack{
                    Text("Vistos")
                    ScrollView(.horizontal){
                        HStack(spacing: 20){
                            ForEach(movieModel.movies){ movie in
                                if movie.category.contains("Ação"){
                                    Image(movie.image)
                                }
                            }
                        }
                    }
                }
                
            }
        }
        
    }
}

#Preview {
    ProfileView()
}
