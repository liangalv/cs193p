//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Alvin Liang on 2022-05-06.
//

import SwiftUI

@main // this is the main program
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    // notice here that we're setting this as a let, now we want to change the game, but because a class is a reference type this means that the only thing that's immutable is the pointer, the actual object itself can still change value
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game) //this points to content, and this content view is what describes this app looks like 
        }
    }
}
