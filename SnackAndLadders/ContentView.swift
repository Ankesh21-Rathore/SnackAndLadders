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
                RadialGradient(colors: [.mint, .green, .black], center: .center, startRadius: 10, endRadius: 500)
                    .ignoresSafeArea()
                
                LazyVStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(.white)
                            .opacity(0.5)
                        
                        GridPosition()
                    }
                    .frame(width: 405, height: 405)
                    .padding()
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
                            .foregroundStyle(styledColour(index: index)) // colour according to indices
                            .opacity(0.9)
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
                                            .fill(Color.mint)
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
                    
                    // Snake & Lader section
                    let newPos = laddersAndSnack(at: player1Position) ?? player1Position
                    
                    if newPos != player1Position {
                        // Trigger smooth slide/climb animation if position changed
                        withAnimation(.easeInOut(duration: 0.6)) {
                            player1Position = newPos
                        }
                    }
                    
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
                    // --- SNAKE & LADDER LOGIC START ---
                    let newPos = laddersAndSnack(at: player2Position) ?? player2Position
                                    
                    if newPos != player2Position {
                        withAnimation(.easeInOut(duration: 0.6)) {
                            player2Position = newPos
                        }
                    }
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
    
    func styledColour(index: Int) -> Color {
        if index % 2 == 0 {
            return .white
        } else {
            return .red
        }
    }
    
    func laddersAndSnack(at position: Int) -> Int? {
        switch position {
            case 5:  return 67
            case 16: return 58
            case 42: return 64
            case 59: return 98
            case 99: return 4
            case 92: return 71
            case 69: return 19
            case 62: return 42
            case 56: return 36
            case 19: return 7
            case 32: return 13
            default: return position
            }
    }
}

#Preview {
    ContentView()
}
