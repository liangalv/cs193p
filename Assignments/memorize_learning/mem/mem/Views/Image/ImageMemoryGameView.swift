//
//  ImageMemoryGameView.swift
//  mem
//
//  Created by Alvin Liang on 2022-06-06.
//

import SwiftUI

struct ImageMemoryGameView: View {
    @ObservedObject var viewModel: ImageMemGameVM
    var body: some View {
        VStack{
            Text(viewModel.themeName).font(.largeTitle) //we have our title now, which we should really be extracting from the Theme
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(viewModel.cards){card in
                        ImageCardView(card: card, themeColor: viewModel.themeColor)
                            .padding(1)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                            viewModel.choose(card)
                            
                        }
                    }
                }
            }
            Label(viewModel.score, systemImage: "pencil.circle.fill")
                .padding(.vertical)
                .foregroundColor(.teal).font(.largeTitle)
            Button() {
                viewModel.generateNewGame()
            }label:{
                Label("New Game", systemImage: "gamecontroller")
            }.buttonStyle(.bordered)
                .tint(.pink)
            
        }
    }
}

//we need to change the CardView Struct to change
struct ImageCardView : View{
    //Characteristics of a card
    var card: MemoryGame<String>.Card
    var themeColor: Color
    var body: some View{
        let shape = RoundedRectangle(cornerRadius: 25)
        if card.isFaceUp{
            ZStack{
                shape
                    .strokeBorder(lineWidth: 6)
                shape
                    .foregroundColor(.white)
                Image(card.content)
                    .resizable()
                    .cornerRadius(25)
            }
        }else if card.isMatched{
            shape.opacity(0)
            
        }else{
            shape.fill(themeColor)
        }
    }
}

struct ImageMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = ImageMemGameVM()
        ImageMemoryGameView(viewModel: game).preferredColorScheme(.dark)
        ImageMemoryGameView(viewModel: game).preferredColorScheme(.light)
    }
}
