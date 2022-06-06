//
//  AspectVGrid.swift
//  Memorize
//
//  Created by Alvin Liang on 2022-05-25.
//

import SwiftUI

struct AspectVGrid<Item, ItemView>: View where ItemView: View, Item: Identifiable{
    var items: [Item] //Generic Type
    var aspectRatio: CGFloat
    var content: (Item) -> ItemView // Generic Type
    
    var body: some View {
        let width: CGFloat = 100
        LazyVGrid(columns:[GridItem(.adaptive(minimum: width))]){
            ForEach(items){ item in
                content(item).aspectRatio(aspectRatio, contentMode: .fit )
                }
            }
            
        }
    }

//struct AspectVGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        AspectVGrid()
//    }
//}
