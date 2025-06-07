//
//  MemberCardView.swift
//  Cinefiles
//
//  Created by Carla Araujo on 01/06/25.
//

import SwiftUI

struct MemberCardView: View {
// Opcional, se a imagem for passada como asset name
    let background: String
    let picture: String// Opcional, se a imagem já for uma View.Image
    let name: String
    let points: String
    
    var body: some View {
        
        ZStack{
            
            //background
            Image(background)
            
            
            
            VStack{
                //foto do friend
                Image(picture)
                    .padding(.bottom, 4)
                 
                //nome
                Text(name)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                
                //pontos
                Text(points)
                    .font(.footnote)
                    .foregroundStyle(.white)
                    .fontWeight(.regular)
            }
      
            
            
            
            
        }
        
    }
}


#Preview {
    MemberCardView(background: "purple-gradient", picture: "jurla", name: "Jurla Silva", points: "95 pontos")
}
