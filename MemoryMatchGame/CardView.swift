//
//  CardView.swift
//  MemoryMatchGame
//
//  Created by Manish Kumar on 13/02/25.
//

import SwiftUI

struct CardView: View {
    let card: Card
    //Each card face should display one of the following emoji icons:
//    Example emojis: 🐶, 🐱, 🐭, 🦊, 🐻, 🐼, 🐸, 🐵, 🐥, 🐞, 🌻, 🍎, 🍩, 🏀, 🚗, ✈️.

    var body: some View {
        ZStack{
            if card.isFacedUp || card.isMatched {
                Text(card.content)
                    .font(.largeTitle)
                    .frame(width: 70, height: 100)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
                    .frame(width: 70, height: 100)
                    .shadow(radius: 2)
            }
        }
    }
}

#Preview {
    CardView(card: Card(content: ""))
}
