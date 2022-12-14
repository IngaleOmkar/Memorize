//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Omkar Ingale on 16/12/22.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    static let transport: Array<String> = ["đ","đ","đ","đ","đ","đī¸","đ","đ","đ","đ","đģ","đ","đ","đ","đ","đ","đ","âī¸","đŠī¸","đ","đ¸","đ","đ¤","â´ī¸"]
    
    static let food: Array<String> = ["đ","đ","đ","đ","đ","đ","đ","đĨ","đĨ¯","đ","đĨ","đĨ¨","đ§","đĨ","đ§","đĨ","đ§","đĨŠ","đ","đ","đ­","đ","đ","đ"]
    
    static let animals: Array<String> = ["đļ","đą","đ­","đš","đ°","đĻ","đģ","đŧ","đģââī¸","đ¨","đ¯","đĻ","đŽ","đˇ","đŊ","đ¸","đĩ","đ","đ","đ","đ","đ","đ§","đĻ"]
    
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
