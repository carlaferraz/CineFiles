//
//  CustomTabBarView.swift
//  Cinefiles
//
//  Created by Carla Araujo on 29/05/25.
//

import SwiftUI

struct CustomTabBarView: View {
    
    
    @State private var selectedTab: Tab = .home
    @State var showActionModal = false


    let verde = Color("verde")
    let rosa = Color("rosa")
    let cinzaClaro = Color("cinza-claro")

    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            selectedTabView
            //explicacao top do id:
            //Função: O modificador .id() é crucial para que o SwiftUI entenda que a View do conteúdo da aba está mudando (uma View antiga está saindo e uma View nova está entrando) quando o selectedTab é alterado.
                .id(selectedTab)
                .transition(.opacity)
            
            
            if showActionModal {
                Color.black.opacity(0.6)
                    .ignoresSafeArea()
                    .animation(.easeInOut(duration: 0.3), value: showActionModal)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.3)) {
                                showActionModal = false
                                    }
                                }
                        }
            

            VStack {
                Spacer()
                tabBarContent
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .animation(.easeInOut(duration: 0.3), value: selectedTab)
  
        
        //modal de açao
        .sheet(isPresented: $showActionModal) {
            ActionSheetView()
            //como a modal aparece
                .presentationDetents([
                    //.medium, .large,
                    .medium, .large
                ])
        }
    }

    @ViewBuilder
    private var selectedTabView: some View {
        switch selectedTab {
        case .home:
            HomeView()
            
        case .search:
            Text("Search")
                
        case .trophy:
            TrophyView()
          
        case .profile:
            ProfileView()
        }
    }

    private var tabBarContent: some View {
        HStack {
            Spacer()
            TabBarItem(
                imageName: "house.fill",
                isSelected: selectedTab == .home,
                selectedColor: verde
            ) {
                selectedTab = .home
            }
            
            
            Spacer()
            TabBarItem(
                imageName: "magnifyingglass",
                isSelected: selectedTab == .search,
                selectedColor: verde
            ) {
                showActionModal = true
            }
            
            
            Spacer()
            TabBarItem(
                imageName: "trophy.fill",
                isSelected: selectedTab == .trophy,
                selectedColor: verde
            ) {
                selectedTab = .trophy
            }
            
            
            Spacer()
            TabBarItem(
                imageName: "person.fill",
                isSelected: selectedTab == .profile,
                selectedColor: verde
            ) {
                selectedTab = .profile
            }
            Spacer()
        }
        .padding(.horizontal, 20)
        .frame(height: 70)
        .background(
            //ULTRATHIN MATERIAL
            RoundedRectangle(cornerRadius: 36)
                .fill(.ultraThinMaterial)
                .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: -5)
        )
        .padding(.horizontal, 10)
    }
}

//botao

struct TabBarItem: View {
    let imageName: String
    let isSelected: Bool
    let selectedColor: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: imageName)
                .font(.system(size: 24)) // Tamanho do ícone
                .foregroundColor(isSelected ? selectedColor : .gray)
                .animation(.easeIn(duration: 0.2), value: isSelected)
                .frame(width: 44, height: 44)
        }
    }
}


// MARK: - Tab Enum

enum Tab {
    case home
    case search
    case trophy
    case profile
}

// MARK: - Preview

#Preview{
    CustomTabBarView()
        .preferredColorScheme(.dark)
}
