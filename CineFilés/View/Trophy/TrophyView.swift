//
//  TrophyView.swift
//  Cinefiles
//
//  Created by Carla Araujo on 29/05/25.
//

import SwiftUI

struct TrophyView: View{
    
    @StateObject var movieModel = MovieModel.shared
    
    let columns: [GridItem] = [
            GridItem(.flexible(), spacing: 16), // Coluna flexível, espaçamento de 16
            GridItem(.flexible(), spacing: 16)  // Coluna flexível, espaçamento de 16
        ]
    
    
    var body: some View {
        
        NavigationStack{
            ZStack {
                LinearGradient(
                    colors: [.cinzaEscuro, .azulEscuro, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
                ScrollView{
                    VStack(alignment: .leading, spacing: 0){
                        //logo
    //                    VStack{
    //                        Image("logo")
    //                            .resizable()
    //                            .scaledToFit( )
    //                            .padding(.horizontal, 100)
    //                            .padding(.vertical, 24)
    //                    }
                        
                    
                                //user
                        NavigationLink(destination: ProfileView()){
                            HStack{
                                Image("icon-user")
                                    .resizable()
                                    .scaledToFit( )
                                    .frame(height: 90)
                                    .clipShape(Circle())
                                    .padding(.trailing, 12)
                                
                                        
                            VStack(alignment: .leading){
                                Text("David Britis")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                Text("132 pontos")
                                    .font(.caption)
                                    .fontWeight(.regular)
                                    .foregroundStyle(.white)
                                }
                                Spacer()
                                    
                                }
                                .padding(.bottom, 24)
                        }
                        
                                
                            //meu clube
                            VStack(alignment: .leading, spacing: 4){
                                Text("Meu Clube")
                                    .font(.system(size: 42))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                                Text("Encontre seus amigos e atualize\nos desafios semanais.")
                                    .font(.subheadline)
                                    .fontWeight(.regular)
                                    .foregroundStyle(.white)
                                    .padding(.bottom, 16)
                                Spacer()
                                
                                
                                
                                //cards com os bests
                                LazyVGrid(columns: columns, spacing: 8){
                                    
                                    //card 1
                                    NavigationLink(destination: JurlaView()){
                                        MemberCardView(background: "purple-gradient", picture: "jurla", name: "Jurla Silva", points: "95 pontos")
                                    }
                                    
                                    
                                    
                                    //card 2
                                    
                                    NavigationLink(destination: DesafioView()){
                                        ZStack{
                                            Image("pink")
                                            VStack(alignment: .leading) {
                                                Image(systemName: "trophy")
                                                    .font(.title)
                                                    .foregroundColor(.white)
                                                    .padding(.bottom, 5)
                                                        
                                               
                                                Text("Desafio da semana")
                                                    .font(.title3)
                                                    .fontWeight(.semibold)
                                                    .foregroundColor(.white)
                                                    .multilineTextAlignment(.leading)
                                                    
                                                    }
                                            .padding(.trailing, 24)
                                   
                                            Spacer()
                                        }
                                        .offset(x:0, y: -55)
                                    }

                                    
                                        
                                    
                                    
                                    //card 3
                                    NavigationLink(destination: HandsomeView()){
                                        VStack{
                                            MemberCardView(background: "verde-escuro", picture: "belo", name: "Handsome", points: "32 pontos")
                                        }
                                    }
                                    .offset(x:0, y: -45)
                                    
                                        
                                    
                                    //card 4
                                    NavigationLink(destination: CarjuView()){
                                        VStack{
                                            MemberCardView(background: "blue-gradient", picture: "carju", name: "Carju Santos", points: "73 pontos")
                                        }
                                    }
                                    .offset(x:0, y: -100)
                                    
                                }
                                
                                
                                
                                }
                                
                            }
                    .padding(.horizontal, 16)
                            
                                
                    }
                 
                }
        }
        .toolbar(.hidden, for: .navigationBar)
        }
    }


#Preview {
    TrophyView()
}
