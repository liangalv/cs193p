//
//  MemoryGame.swift
//  mem
//
//  Created by Alvin Liang on 2022-06-05.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card){
        //First we have to figure out what card they chose in the array
        if let chosenIndex = cards.firstIndex(where:{$0.id == card.id}), !card.isMatched,!card.isFaceUp{
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{ //if there is a card face up
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            }else{ // if there is no card face up
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                reset()
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    init(pairsOfCards: Int, generateCardContent: (Int) -> CardContent){
        cards = []
        for pairIndex in 0..<pairsOfCards{
            let content = generateCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    mutating func reset(){
        for cardIndex in cards.indices{
            cards[cardIndex].isFaceUp = false
        }
    }
    
    
    
    struct Card: Identifiable {
        var isMatched = false
        var isFaceUp = false
        let content: CardContent
        let id: Int
    }
    
}
