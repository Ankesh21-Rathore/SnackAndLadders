//
//  HomeView.swift
//  SnackAndLadders
//
//  Created by mac on 24/09/26.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.black, .white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                NavigationLink(destination: GameView()) {
                    Label("Play Game", systemImage: "play.circle.fill")
                }
                .foregroundStyle(.mint)
                .bold()
            }
        }
    }
}

#Preview {
    HomeView()
}
