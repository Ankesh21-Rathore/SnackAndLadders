//
//  ContentView.swift
//  SnackAndLadders
//
//  Created by mac on 11/09/26.
//

import SwiftUI

struct ContentView: View {
    let columns = Array(repeating: GridItem(.flexible(minimum: 0, maximum: .infinity), spacing: 4), count: 10)
    @State private var value = 1
    @State private var player: Int = 1
    @State private var player1Position = 1
    @State private var player2Position = 1
    
    @State private var player1Scale: CGFloat = 1.0
    @State private var player2Scale: CGFloat = 1.0
    
    @State private var isMoving = false
    @State private var isGameOver = false
    @State private var winnerMessage = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                RadialGradient(colors: [.blue, .green, .black], center: .center, startRadius: 10, endRadius: 500)
                    .ignoresSafeArea()
                
                LazyVStack {
                    GridPosition()
                    
                    // Dice View
                    Dice { rolled in
                        value = rolled
                        moveCurrentPawn(by: rolled)
                    }
                    .disabled(isMoving || isGameOver)
                    .alert(winnerMessage, isPresented: $isGameOver) {
                        Button("Play Again") {
                            resetGame()
                        }
                    }
                }
                .navigationBarTitle("Snack & Ladders")
            }
        }
    }
   
    func GridPosition() -> some View {
        VStack(spacing: 10) {
            ForEach((0..<10).reversed(), id: \.self) { row in
                HStack {
                    ForEach(0..<10, id: \.self) { col in
                        
                        let isEvenRow = (row % 2 == 0)
                        let colOffset = isEvenRow ? col : (9 - col)
                        let index = (row) * 10 + (1 + colOffset)
                        
                        RoundedRectangle(cornerRadius: 3)
                            .foregroundStyle(.white)
                            .opacity(0.5)
                            .aspectRatio(1, contentMode: .fit)
                            .overlay(
                                Text("\(index)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 10, weight: .bold)),
                                alignment: .bottomLeading
                            )
                            .overlay(
                                HStack {
                                    if player1Position == index {
                                        PawnShape()
                                            .fill(Color.red)
                                            .frame(width: 12, height: 12)
                                            .scaleEffect(player1Scale)
                                    }
                                    if player2Position == index {
                                        PawnShape()
                                            .fill(Color.yellow)
                                            .frame(width: 12, height: 12)
                                            .scaleEffect(player2Scale)
                                    }
                                }
                                .animation(.spring(response: 0.4, dampingFraction: 0.7), value: player2Position)
                            )
                    }
                }
            }
        }
    }
    
    func moveCurrentPawn(by steps: Int) {
        guard !isGameOver && !isMoving else { return }
        isMoving = true
        
        let targetPosition = min(100, (player == 1 ? player1Position : player2Position) + steps)
        
        // Step-by-step movement animation loop
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
            if player == 1 {
                if player1Position < targetPosition {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        player1Position += 1
                        player1Scale = 1.4
                    }
                    withAnimation(.spring(response: 0.2, dampingFraction: 0.5).delay(0.1)) {
                        player1Scale = 1.0
                    }
                } else {
                    timer.invalidate()
                    isMoving = false
                    
                    if player1Position == 100 {
                        winnerMessage = "Player 1 Wins!"
                        isGameOver = true
                    } else {
                        player = 2
                    }
                }
            } else {
                if player2Position < targetPosition {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                        player2Position += 1
                        player2Scale = 1.4
                    }
                    withAnimation(.spring(response: 0.2, dampingFraction: 0.5).delay(0.1)) {
                        player2Scale = 1.0
                    }
                } else {
                    timer.invalidate()
                    isMoving = false
                    
                    if player2Position == 100 {
                        winnerMessage = "Player 2 Wins!"
                        isGameOver = true
                    } else {
                        player = 1
                    }
                }
            }
        }
    }
    
    func resetGame() {
        player1Position = 1
        player2Position = 1
        player = 1
        isGameOver = false
        isMoving = false
    }
}

#Preview {
    ContentView()
}
