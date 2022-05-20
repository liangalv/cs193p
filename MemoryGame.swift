//
//  MemoryGame.swift
//  Memorize
//
//  Created by Alvin Liang on 2022-05-11.
//

//this represents our model 

import Foundation // array, string, dictionary, basic strcuts that you need to build your app

// the goal of ViewModel is either to take a really large complicated model and create little small windows on it, or combine multiple small models
// we've turned this don't care into a mostly don't care 
struct MemoryGame<CardContent> where CardContent: Equatable { // this struct is going to represent our model
    private(set) var cards: Array<Card>
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    // we need to check whether or there is a card face up
    
    mutating func choose(_ card: Card){
        // you can't use && in an if statement if you start out with the let so we use "," instead
        // choosing cards that are already matched, or already faceup should not affect the state of the model
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched{
            // this line of code locates the "card" object which was clicked that is in Array<Card>
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                //this sets the "potenialMatchIndex" to some variable if there is a card faceup
                if (cards[chosenIndex].content == cards[potentialMatchIndex].content) {
                    // this line of code checks the content and sees if they are the same
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
                // once those cards are matched, then there is no chosen faceup card and therefore isn't selected
            } else { // in this case where there's no match
                //either they are already face down, or there are two cards face up
                for index in cards.indices {// indices var here returns the range
                    cards[index].isFaceUp = false
                    
                }
                // this for-loops makes all the cards facedown
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                // this sets a value for this optional
            }
            cards[chosenIndex].isFaceUp.toggle()
            // the card we just chose is going remain faceup, as it gets toggled back on for sure
            
        }
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
