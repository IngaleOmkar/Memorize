//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Omkar Ingale on 14/12/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    let viewModel = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
