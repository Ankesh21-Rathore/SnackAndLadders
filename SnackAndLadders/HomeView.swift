//
//  HomeView.swift
//  SnackAndLadders
//
//  Created by mac on 24/09/26.
//

import SwiftUI

struct HomeView: View {
    @State private var isPresented: Bool = false
    
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
                        Button {
                            isPresented.toggle()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(.white)
                                    .opacity(0.6)
                                    .frame(width: 150, height: 150)
                                
                                VStack {
                                    HStack {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(.yellow)
                                                .frame(width: 40, height: 40)
                                            Image(systemName: "person.fill")
                                                .foregroundStyle(.black)
                                        }
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(.blue)
                                                .frame(width: 40, height: 40)
                                            Image(systemName: "person.fill")
                                                .foregroundStyle(.black)
                                        }
                                        
                                    }
                                }
                            }
                        }
                        Button {
                            isPresented.toggle()
                        } label: {
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(.white)
                                    .opacity(0.6)
                                    .frame(width: 150, height: 150)
                                
                                VStack {
                                    
                                    HStack {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(.yellow)
                                                .frame(width: 40, height: 40)
                                            Image(systemName: "person.fill")
                                                .foregroundStyle(.black)
                                        }
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(.blue)
                                                .frame(width: 40, height: 40)
                                            Image(systemName: "person.fill")
                                                .foregroundStyle(.black)
                                        }
                                    }
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundStyle(.red)
                                            .frame(width: 40, height: 40)
                                        Image(systemName: "person.fill")
                                            .foregroundStyle(.black)
                                    }
                                }
                            }
                        }
                    }
                    HStack {
                        Button {
                            isPresented.toggle()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(.white)
                                    .opacity(0.6)
                                    .frame(width: 150, height: 150)
                                
                                VStack {
                                    HStack {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(.yellow)
                                                .frame(width: 40, height: 40)
                                            Image(systemName: "person.fill")
                                                .foregroundStyle(.black)
                                        }
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(.blue)
                                                .frame(width: 40, height: 40)
                                            Image(systemName: "person.fill")
                                                .foregroundStyle(.black)
                                        }
                                    }
                                    HStack {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(.red)
                                                .frame(width: 40, height: 40)
                                            Image(systemName: "person.fill")
                                                .foregroundStyle(.black)
                                        }
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(.green)
                                                .frame(width: 40, height: 40)
                                            Image(systemName: "person.fill")
                                                .foregroundStyle(.black)
                                        }
                                    }
                                }
                            }
                        }
                        
                        Button {
                            isPresented.toggle()
                        } label: {
                            ZStack(alignment: .center) {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(.white)
                                    .opacity(0.6)
                                    .frame(width: 150, height: 150)
                                VStack {
                                    HStack {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(.yellow)
                                                .frame(width: 40, height: 40)
                                            Image(systemName: "person.fill")
                                                .foregroundStyle(.black)
                                        }
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(.blue)
                                                .frame(width: 40, height: 40)
                                            Image(systemName: "person.fill")
                                                .foregroundStyle(.black)
                                        }
                                    }
                                    HStack {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(.red)
                                                .frame(width: 40, height: 40)
                                            Image(systemName: "person.fill")
                                                .foregroundStyle(.black)
                                        }
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 10)
                                                .foregroundStyle(.green)
                                                .frame(width: 40, height: 40)
                                            Image(systemName: "person.fill")
                                                .foregroundStyle(.black)
                                        }
                                    }
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundStyle(.brown)
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
            .navigationTitle("Snake and Ladders")
        }
        .sheet(isPresented: $isPresented) {
            NavigationStack {
                VStack {
                    NavigationLink(destination: GameView()) {
                        Label("Play Game", systemImage: "play.circle.fill")
                            .scaledToFit()
                            .foregroundStyle(.mint)
                            .bold()
                    }
                }
            }

        }
    }
}

#Preview {
    HomeView()
}
