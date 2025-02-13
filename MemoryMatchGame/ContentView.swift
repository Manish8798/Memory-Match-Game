//
//  ContentView.swift
//  MemoryMatchGame
//
//  Created by Manish Kumar on 13/02/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = MemoryGameViewModel()
    
    var body: some View {
        VStack{
            
            HStack {
                Button("Easy") {
                    viewModel.changeDifficultyLevel(to: .easy)
                }
                .padding()
                .background(viewModel.difficultyLevel == .easy ? Color.green : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("Medium") {
                    viewModel.changeDifficultyLevel(to: .medium)
                }
                .padding()
                .background(viewModel.difficultyLevel == .medium ? Color.orange : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("Hard") {
                    viewModel.changeDifficultyLevel(to: .hard)
                }
                .padding()
                .background(viewModel.difficultyLevel == .hard ? Color.red : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()
            
            Spacer()
            
            if viewModel.isGameCompleted {
                Text("You won!!")
                    .font(.largeTitle)
                    .foregroundColor(.green)
                    .padding()
            }
            
            Text("Moves: \(viewModel.moves)")
                .font(.title2)
                .padding()
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 10) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                        .frame(width: 70, height: 100)
                }
            }.padding()
            
            Spacer()
            
            Button(action: {
                viewModel.resetGame()
            }, label: {
                Text("Restart")
                    .padding()
            })
        }
    }
}

#Preview {
    ContentView()
}
