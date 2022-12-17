//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Omkar Ingale on 16/12/22.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    static let transport: Array<String> = ["🚗","🚕","🚙","🚌","🚎","🏎️","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🚖","🚝","🚆","✈️","🛩️","🚀","🛸","🚁","🚤","⛴️"]
    
    static let food: Array<String> = ["🍏","🍎","🍐","🍊","🍋","🍌","🍇","🥐","🥯","🍞","🥖","🥨","🧀","🥚","🧈","🥞","🧇","🥩","🍗","🍖","🌭","🍔","🍟","🍕"]
    
    static let animals: Array<String> = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯","🦁","🐮","🐷","🐽","🐸","🐵","🙈","🙉","🙊","🐒","🐔","🐧","🐦"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { index in
            return transport[index]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card){
        model.choose(card)
    }
}
