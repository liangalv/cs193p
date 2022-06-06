//
//  ContentView.swift
//  mem
//
//  Created by Alvin Liang on 2022-06-05.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemGameVM
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                ForEach(viewModel.cards){card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                        viewModel.choose(card)
                    }
                }
            }
        }
    }
}

struct CardView : View{
    //Characteristics of a card
    var card: MemoryGame<String>.Card
    
    var body: some View{
        let shape = RoundedRectangle(cornerRadius: 25)
        if card.isFaceUp{
            ZStack{
                shape
                    .strokeBorder(lineWidth: 3)
                    .foregroundColor(.red)
                Text(card.content)
            }
        }else if card.isMatched{
            shape.opacity(0)
            
        }else{
            shape.fill(.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemGameVM()
        EmojiMemoryGameView(viewModel: game).preferredColorScheme(.dark)
        EmojiMemoryGameView(viewModel: game).preferredColorScheme(.light)
    }
}
