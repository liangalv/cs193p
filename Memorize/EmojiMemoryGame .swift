//
//  EmojiMemoryGame .swift
//  Memorize
//
//  Created by Alvin Liang on 2022-05-13.
//

import SwiftUI

class EmojiMemoryGame {
    static let emojis = ["👽","😃","😁","🤨","🫡","😐","🥱","😵‍💫","🤢","👩‍❤️‍💋‍👨","👨‍👨‍👧","💍","🐯","🥖","🍔","🥕","🌽"]
    //static keyword here makes this a 'Type Property' meaning that it's a property not on the particular instance of EmojiMemoryGame but rather a property on the type
    // our ViewModel needs a connection to model, our ViewModel is going to create it's own model, that's not always the case for a ViewModel
    
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame(numberOfPairsOfCards: 4){pairIndex in
            emojis[pairIndex]
        }
    }
    // this is a "Type Method" meaning that the method is specific to the type, not an INSTANCE of the Type  
    
    private var model: MemoryGame<String> = createMemoryGame()
    //gatekeeper role of the ViewModel, it protects the model from any ill intending Views, one of the ways we can do that is to make it so that the model is private, this is so that that the ViewModel is the only code that can see the model
    //private(set) can see the value, but cannot change values
    // in classes your class variables have to be given a value
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    // this variables values is read only, and privatizes the setting ability of the cards because it needs to calculated by calling a function
}
