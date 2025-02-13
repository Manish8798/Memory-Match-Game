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
            
            Button(action: {
                viewModel.resetGame()
            }, label: {
                Text("Restart")
            })
        }
    }
}

#Preview {
    ContentView()
}
