//
//  Card.swift
//  MemoryMatchGame
//
//  Created by Manish Kumar on 13/02/25.
//

import Foundation

struct Card: Identifiable {
    let id = UUID()
    let content: String
    var isFacedUp: Bool = false
    var isMatched: Bool = false
}
