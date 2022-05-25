//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Alvin Liang on 2022-05-06.
//
// High level ideas
//


import SwiftUI
//we're just importing the SwiftUI library
// this is here cause we're actually doing UI in this file


//it's creating a data structure here, structs are essentially collections of variables
// not only can we have varibles inside our structs, we can also have functions in our structs
//swift has support for both OOP and functional programming, we will be using the functional framework in order to build our UI
//we use the OOP model in order to hook up our model(Logic) to our UI
struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    //EmojiMemoryGameView is just the name of our data structure
    // :View this is indicating to swift that this struct that we are building behaves like a "View" because this is functional programming, the behaviour of things is crucial
    //when we declare something as behaving like a view, it's really a double edge sword, the moment that you declare that something behaves like a view you get all the SwiftUI functionality, this also implies that there are respoinsiblities, when you want something to behave like a view and really that just requires for you to have the "body" variable below
    var body: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3,content: { card in
            CardView(card: card)
                .aspectRatio(2/3, contentMode: .fit)
                .onTapGesture{
                    game.choose(card)
        
                }
        })
    }
        
        


//creating these views is the heart of SwiftUI programming

//Zstacks, stack the views such that they are facing towards the user
    // you as the programmer is also at liberty to remove the content parameter label as long as it sits as the last parameter, and as long as the value that is being passed in is an argument
    // you can also pass in the alignment parameter into the Zstack container
struct CardView: View {
     let card: MemoryGame<String>.Card
    
//    init (_ card: MemoryGame<String>.Card){
//        self.card = card
//    }
    // you could place this init here
    
    var body: some View{ // this view is a variable, as it's calculated everytime someone asks for it
        GeometryReader(content: {geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp{
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Text(card.content).font(font(in: geometry.size))
                }
                else if card.isMatched{
                    shape.opacity(0)
                }else{
                    shape.fill()
                }
            }
            
        })
    }
    private func font(in size: CGSize) -> Font {
        // where Font is just a static on font, it has a static func called System, and it will just make a system font of that size
        Font.system(size: min(size.height, size.width)*DrawingConstants.fontScale)
        
    }
    // generating some contants in our code
    private struct DrawingConstants {
        // we're never going to be actually generating any of these structs, they are only going to have static lets
        static let cornerRadius: CGFloat = 20
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.8
        
        // the beauty of generating these constants here, is that they are centralized and not hard coded into the program, such that they can be modified later on
        
        
    }
}


























// this code is the code that glues the EmojiMemoryGameView to the previewer
// we generally do not even touch this code
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)

    }
}
