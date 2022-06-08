//
//  ImageMemGameVM.swift
//  mem
//
//  Created by Alvin Liang on 2022-06-06.
//

import SwiftUI

class ImageMemGameVM: ObservableObject {
    private static let imageMap = [theme(color: .teal, name: "Terri") : ["t1", "t2","t3", "t4", "t5", "t6", "t7","t8", "t9", "t10", "t11", "t12", "t13","t14", "t15", "t16", "t17"],theme(color: .blue, name: "Nugget"): ["n1", "n2", "n3","n4","n5","n6", "n7", "n8", "n9", "n10", "n11", "n12","n13", "n14", "n15"]]
        
    
    //we need to generate our emoji memory game, which means we need to specify it's cards array contents
    @Published private(set) var model = generateImageMemoryGame(theme: imageMap.randomElement())
    
    static func generateImageMemoryGame(theme: Dictionary<ImageMemGameVM.theme, [String]>.Element?)-> MemoryGame<String>{
        let themeName = theme!.key.name
        let themeColor = theme!.key.color
        let pairsOfCardsToShow = Int.random(in: 7..<theme!.value.count)
        return MemoryGame<String>(themeInfo: (name: themeName, contentArray: theme?.value,pairsOfCardsToShow: pairsOfCardsToShow, themeColor: themeColor))
   }
    
    //MARK: - Model Variables
    
    var cards: Array<MemoryGame<String>.Card>{
        return model.cards
    }
    var score: String {
        return String(model.score)
    }
    var gameState: Bool{
        return model.gameState
    }
    var themeName: String{
        return model.theme.name
    }
    var themeColor: Color{
        return model.theme.themeColor
    }
   
    
    //MARK: - Intents
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    func generateNewGame(){
        if let theme = ImageMemGameVM.imageMap.randomElement(){
            model = ImageMemGameVM.generateImageMemoryGame(theme: theme)
        }
    }
    //MARK: - Struct
     struct theme: Hashable{
        let color: Color
        let name: String
    }
}

