//
//  Dice.swift
//  SnackAndLadders
//
//  Created by mac on 12/09/26.
//

import SwiftUI
import SceneKit

struct Dice: View {
    @State private var value = 1
    @State private var rotaion: Double = 0.0
    
    var onRoll: (Int) -> Void
    
    var body: some View {
        ZStack { // For Dice
            Button(action: rollDice) { // For Dice rotation as botton
                
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .shadow(color: .red.opacity(0.6), radius: 8, x: 0, y: 4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.white.opacity(0.5), lineWidth: 2)
                    )
            }
            .buttonStyle(.plain)
            DiceFace(value: value)
        }
        .frame(width: 100, height: 100)
        .rotation3DEffect(.degrees(rotaion), axis: (x: 1, y: 1, z: 0.2), perspective: 0.5)
        .scaleEffect(0.8)
        .animation(.interactiveSpring(response: 0.4, dampingFraction: 0.6), value: rotaion)
    }
    
    public func rollDice() {
        let rolledValue = Int.random(in: 1...6)
        value = rolledValue
        rotaion += 360
        
        onRoll(rolledValue)
    }
    
}


struct DiceFace: View {
    let value: Int
    
    var body: some View {
        ZStack {
            if value == 1 {
                Dot()
            } else if value == 2 {
                HStack {
                    Dot()
                    Spacer()
                    Dot()
                }
                .padding()
            } else if value == 3 {
                Grid {
                    GridRow {
                        Spacer()
                        Spacer()
                        Spacer()
                        Dot()
                    }
                    GridRow {
                        Spacer()
                        Spacer()
                        Dot()
                        Spacer()
                    }
                    GridRow {
                        Dot()
                        Spacer()
                        Spacer()
                    }
                }
                .padding()
            }
            else if value == 4 {
                HStack {
                    VStack {
                        Dot()
                        Spacer()
                        Dot()
                    }
                    
                    Spacer()
                    
                    VStack {
                        Dot()
                        Spacer()
                        Dot()
                    }
                }
                .padding()
            } else if value == 5 {
                HStack {
                    VStack {
                        Dot()
                        Spacer()
                        Dot()
                    }
                    Dot()
                    VStack {
                        Dot()
                        Spacer()
                        Dot()
                    }
                }
                .padding()
            } else if value == 6 {
                HStack {
                    VStack {
                        Dot()
                        Dot()
                        Dot()
                    }
                    
                    VStack {
                        Dot()
                        Dot()
                        Dot()
                    }
                }
                .padding()
            }
        }
    }
    
    private func Dot() -> some View {
        Circle()
            .fill(Color.black)
            .frame(width: 25, height: 25)
            .aspectRatio(1, contentMode: .fit)
    }
}
