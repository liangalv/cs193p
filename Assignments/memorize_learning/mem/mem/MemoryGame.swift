//
//  MemoryGame.swift
//  mem
//
//  Created by Alvin Liang on 2022-06-05.
//

import Foundation
import SwiftUI

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    var indexOfTheOneAndOnlyFaceUpCard: Int?
    private(set) var score: Int = 0
    private(set) var gameState = true
    private (set) var theme: Theme<CardContent>
    
    
    init(themeInfo: (name: String,contentArray:[String]? ,pairsOfCardsToShow: Int,themeColor: Color)){
        cards = []
        //we must intialize our Theme
        theme = Theme(name: themeInfo.name, contentArray: themeInfo.contentArray, pairsOfCardsToShow: themeInfo.pairsOfCardsToShow, themeColor: themeInfo.themeColor)
        
        for pairIndex in 0..<theme.pairsOfCardsToShow{
            let content = theme.contentArray?[pairIndex]
            var randomIndex1 = 0
            if !(cards.count == 0){
                randomIndex1 = Int.random(in: 0..<cards.count)
            }
            cards.insert(Card(content: content! as! CardContent, id: pairIndex * 2), at: randomIndex1)
            let randomIndex2 = Int.random(in: 0..<cards.count)
            cards.insert(Card(content: content! as! CardContent, id: pairIndex * 2 + 1), at: randomIndex2)
        }
    }

    
    mutating func choose(_ card: Card){
        //First we have to figure out what card they chose in the array
        if let chosenIndex = cards.firstIndex(where:{$0.id == card.id}), !card.isMatched,!card.isFaceUp{
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{ //if there is a card face up
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                    if gameIsOver(){
                        gameState = false
                    }
                }else{
                        if card.previouslySeen || cards[potentialMatchIndex].previouslySeen{
                            score -= 1
                        }
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            }else{ // if there is no card face up
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                reset()
            }
            cards[chosenIndex].isFaceUp.toggle()
            cards[chosenIndex].previouslySeen = true
        }
        
    }
    
//MARK: - structs
    struct Theme<Content>{
        let name: String
        let contentArray: [String]?
        var pairsOfCardsToShow: Int
        //generate when content array gets passed into this Theme constructor
        let themeColor: Color
    }
    
    
    struct Card: Identifiable {
        var isMatched = false
        var isFaceUp = false
        var wasSeen = false
        let content: CardContent
        let id: Int
        var previouslySeen = false
        
    }
    
//MARK: - Helper Funcs
    mutating func reset(){
        for cardIndex in cards.indices{
            cards[cardIndex].isFaceUp = false
        }
    }
    
    private func gameIsOver()-> Bool{
        for content in cards{
            if !content.isMatched{
                return false
            }
        }
        return true
    }
    
    
    
}
