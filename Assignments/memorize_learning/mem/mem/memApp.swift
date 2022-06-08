//
//  memApp.swift
//  mem
//
//  Created by Alvin Liang on 2022-06-05.
//

import SwiftUI

@main
struct memApp: App {
//    let game = EmojiMemGameVM()
    let game = ImageMemGameVM()
    var body: some Scene {
        WindowGroup {
//            EmojiMemoryGameView(viewModel: game)
            ImageMemoryGameView(viewModel: game)
            
        }
    }
}
