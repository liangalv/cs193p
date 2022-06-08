//
//  EmojiMemGameVM.swift
//  mem
//
//  Created by Alvin Liang on 2022-06-05.
//

//import SwiftUI
//
//class EmojiMemGameVM: ObservableObject {
//    private static let emojiMap = ["faceEmojis": ["👽","😃","😁","🤨","🫡","😐","🥱","😵‍💫","🤢"], "animalEmojis":  ["🐳","🦀","🐈","🐭","🐶", "🐮", "🙈", "🦔","🐻", "🐷"], "vehicleEmojis": ["🚗","🛴", "✈️", "🚐", "🚜", "🚁", "🛥", "🛩", "🚀"], "foodEmojis": ["🍔","🍟", "🍖", "🥑", "🍙", "🍜", "🍤", "🍑", "🎂", "🥟"], "weatherEmojis": ["🌈","🌧", "☀️", "🌊", "🌡", "🌩", "🌤", "❄️", "🌦", "⛈", "🌪"], "sportsEmojis": ["⚽️","⚾️", "🏈", "🏓", "🏸", "🏑", "🏎", "🚴‍♂️"]]
//
//    private static let currentTheme: String? = nil
//
//    //we need to generate our emoji memory game, which means we need to specify it's cards array contents
//    @Published private(set) var model = generateEmojiMemoryGame(theme: emojiMap.randomElement()!.value)
//
//    static func generateEmojiMemoryGame(theme: Array<String>)-> MemoryGame<String>{
//
//        let randomCards = Int.random(in: 7..<theme.count)
//        //we still need to randomize the cards that are chosen
//        return MemoryGame(pairsOfCards: randomCards) { pairIndex in
//            theme[pairIndex]
//        }
//    }
//
//    //MARK: - Model Variables
//    
//    var cards: Array<MemoryGame<String>.Card>{
//        return model.cards
//    }
//    var score: String {
//        return String(model.score)
//    }
////    var theme: Theme{
////        return model.theme
////    }
//
//
//
//
//
//    //MARK: - Intents
//    func choose(_ card: MemoryGame<String>.Card) {
//        model.choose(card)
//    }
//    func generateNewGame(){
//        if let theme = EmojiMemGameVM.emojiMap.randomElement()?.value{
//            model = EmojiMemGameVM.generateEmojiMemoryGame(theme: theme)
//        }
//    }
//}
