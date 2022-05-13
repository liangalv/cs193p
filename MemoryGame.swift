//
//  MemoryGame.swift
//  Memorize
//
//  Created by Alvin Liang on 2022-05-11.
//

//this represents our model 

import Foundation // array, string, dictionary, basic strcuts that you need to build your app

// the goal of ViewModel is either to take a really large complicated model and create little small windows on it, or combine multiple small models
struct MemoryGame<CardContent> { // this struct is going to represent our model
    private(set) var cards: Array<Card>
    
    func choose(_ card: Card){
        
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        //add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            // this content here is hard to determine what to use,as CardContent is a 'don't care' type, it should be the one creating the game that is ultimately respoinsible for the card game type created
            let content = createCardContent(pairIndex) // don't need to define the type of this variable as it can be inferred from the return type 
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))

            
            
        }
    }
    
    struct Card: Identifiable {
        // we've placed this struct inside of a struct, mostly this is just a naming things, this full name is Memorygame.Card
        // by nesting this we make it clear that this is a card that goes into our memorygame
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int // this is really a generic and can be any typeis just needs to be hashable and equateable,must be able to look it up in a hashtable
        
    }
    
}
