//
//  MemoryGameViewModel.swift
//  MemoryMatchGame
//
//  Created by Manish Kumar on 13/02/25.
//

import Foundation

enum DifficultyLevel: Int {
    case easy = 4
    case medium = 6
    case hard = 8
}

class MemoryGameViewModel: ObservableObject {
    @Published var cards: [Card] = []
    private var firstSelectedCardIndex: Int?
    @Published var moves = 0
    var isGameCompleted: Bool {
        cards.allSatisfy{$0.isMatched}
    }
    
    @Published var difficultyLevel: DifficultyLevel = .easy
    
    init() {
        resetGame()
    }
    
    func changeDifficultyLevel(to newDiffculty: DifficultyLevel) {
        difficultyLevel = newDiffculty
        resetGame()
    }
    
    func resetGame() {
        let allEmojis = ["🐶", "🐱", "🐭", "🦊", "🐻", "🐼", "🐸", "🐵", "🐥", "🐞", "🌻", "🍎", "🍩", "🏀", "🚗", "✈️"]
        let numPairs = difficultyLevel.rawValue
        let selectedEmojis = Array(allEmojis.shuffled().prefix(numPairs))
        let shuffledPairs = (selectedEmojis + selectedEmojis).shuffled()
        
        cards = shuffledPairs.map{ Card(content: $0) }
        moves = 0
    }
    
    //choose
    func choose(_ card: Card) {
        guard let index = cards.firstIndex(where: {$0.id == card.id}), !cards[index].isFacedUp, !cards[index].isMatched else { return }
       
        cards[index].isFacedUp.toggle()
        moves += 1
        
        if let firstIndex = firstSelectedCardIndex {
            checkForMatch(firstIndex: firstIndex, secondIndex: index)
            firstSelectedCardIndex = nil
        } else {
            firstSelectedCardIndex = index
        }
        
    }
    
    private func checkForMatch(firstIndex: Int, secondIndex: Int) {
        if cards[firstIndex].content == cards[secondIndex].content {
            cards[firstIndex].isMatched = true
            cards[secondIndex].isMatched = true
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now()+1){
                self.cards[firstIndex].isFacedUp = false
                self.cards[secondIndex].isFacedUp = false
            }
        }
    }
}
