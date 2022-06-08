//
//  ContentView.swift
//  mem
//
//  Created by Alvin Liang on 2022-06-05.
//

//import SwiftUI
//
//struct EmojiMemoryGameView: View {
//    @ObservedObject var viewModel: EmojiMemGameVM
//    var body: some View {
//        VStack{
//            Text("Faces").font(.largeTitle) //we have our title now, which we should really be extracting from the Theme
//            ScrollView{
//                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
//                    ForEach(viewModel.cards){card in
//                        CardView(card: card)
//                            .padding(1)
//                            .aspectRatio(2/3, contentMode: .fit)
//                            .onTapGesture {
//                            viewModel.choose(card)
//
//                        }
//                    }
//                }
//            }
//            Label(viewModel.score, systemImage: "pencil.circle.fill")
//                .padding(.vertical)
//                .foregroundColor(.teal).font(.largeTitle)
//            Button() {
//                viewModel.generateNewGame()
//            }label:{
//                Label("New Game", systemImage: "gamecontroller")
//            }.buttonStyle(.bordered)
//                .tint(.pink)
//
//        }
//    }
//}
//
////we need to change the CardView Struct to change
//struct CardView : View{
//    //Characteristics of a card
//    var card: MemoryGame<String>.Card
//
//    var body: some View{
//        let shape = RoundedRectangle(cornerRadius: 25)
//        if card.isFaceUp{
//            ZStack{
//                shape
//                    .strokeBorder(lineWidth: 6)
//                shape
//                    .foregroundColor(.white)
//                Text(card.content)
//            }
//        }else if card.isMatched{
//            shape.opacity(0)
//
//        }else{
//            shape.fill(.red)
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        let game = EmojiMemGameVM()
//        EmojiMemoryGameView(viewModel: game).preferredColorScheme(.dark)
//        EmojiMemoryGameView(viewModel: game).preferredColorScheme(.light)
//    }
//}
