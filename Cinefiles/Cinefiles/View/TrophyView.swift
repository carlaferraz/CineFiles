//
//  TrophyView.swift
//  Cinefiles
//
//  Created by Carla Araujo on 29/05/25.
//

import SwiftUI

struct TrophyView: View{
    var body: some View {
        
        ZStack { 
            Color.green
            VStack {
                Image(systemName: "trophy.fill")
                Text("trofeu")         
            }
        }
    }
}

#Preview {
    TrophyView()
}
