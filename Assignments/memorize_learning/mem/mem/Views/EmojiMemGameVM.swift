//
//  EmojiMemGameVM.swift
//  mem
//
//  Created by Alvin Liang on 2022-06-05.
//

import SwiftUI

class EmojiMemGameVM: ObservableObject {
    private static let emojis = ["👽","😃","😁","🤨","🫡","😐","🥱","😵‍💫","🤢","👩‍❤️‍💋‍👨","👨‍👨‍👧","💍","🐯","🥖","🍔","🥕","🌽"]
    //we need to generate our emoji memory game, which means we need to specify it's cards array contents
    @Published private(set) var model = generateEmojiMemoryGame()
    static func generateEmojiMemoryGame()-> MemoryGame<String>{
        MemoryGame(pairsOfCards: 6) { pairIndex in
            EmojiMemGameVM.emojis[pairIndex]
        }
    }
    
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    
    //MARK: - Intents
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
