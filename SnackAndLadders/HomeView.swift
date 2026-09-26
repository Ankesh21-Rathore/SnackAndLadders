//
//  HomeView.swift
//  SnackAndLadders
//
//  Created by mac on 24/09/26.
//

import SwiftUI

struct HomeView: View {
    @State private var isPresented: Bool = false
    @State private var selectedPlayerCount: Int = 2
    
    let playerColors: [Color] = [.blue, .yellow, .red, .green, .brown] // for matching 1 to 5 players colors
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.white, .black, .white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.primary)
                    .opacity(0.2)
                    .frame(width: 400, height: 400)
                VStack {
                    HStack {
                        playerView(count: 2)
                        playerView(count: 3)
                    }
                    HStack {
                        playerView(count: 4)
                        playerView(count: 5)
                    }
                }
            }
            .navigationTitle("Snake and Ladders")
        }
        .sheet(isPresented: $isPresented) {
            NavigationStack {
                VStack {
                    NavigationLink(destination: GameView()) {
                        Label("Play Game (\(selectedPlayerCount) Players)", systemImage: "play.circle.fill")
                            .scaledToFit()
                            .foregroundStyle(.mint)
                            .bold()
                    }
                }
            }

        }
    }
    
    func playerView(count: Int) -> some View {
        Button {
            selectedPlayerCount = count
            isPresented.toggle()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.white)
                    .opacity(0.6)
                    .frame(width: 150, height: 150)
    
                    let colorsToDisplay = Array(playerColors.prefix(count))
                    
                    let topRow = Array(colorsToDisplay.prefix(2))
                    let middleRow = Array(colorsToDisplay.dropFirst(2).prefix(2))
                    let bottomRow = Array(colorsToDisplay.dropFirst(4))
                    VStack(spacing: 8) {
                        
                        HStack(spacing: 8) {
                            ForEach(topRow, id: \.self) { color in
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(color)
                                        .frame(width: 40, height: 40)
                                    Image(systemName: "person.fill")
                                        .foregroundStyle(.black)
                                }
                            }
                        }
                            if !middleRow.isEmpty {
                                HStack(spacing: 8) {
                                    ForEach(middleRow, id: \.self) { color in
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(color)
                                                .frame(width: 40, height: 40)
                                            Image(systemName: "person.fill")
                                                .foregroundStyle(.black)
                                        }
                                    }
                                }
                            }
                            if !bottomRow.isEmpty {
                                HStack(spacing: 8) {
                                    ForEach(bottomRow, id: \.self) { color in
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(color)
                                                .frame(width: 40, height: 40)
                                            Image(systemName: "person.fill")
                                                .foregroundStyle(.black)
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
    HomeView()
}
