//
//  ContentView.swift
//  Memorize
//
//  Created by Omkar Ingale on 14/12/22.
//

import SwiftUI

struct ContentView: View {
    
    var transport: Array<String> = ["🚗","🚕","🚙","🚌","🚎","🏎️","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🚖"]
    
    @State var emojiCount = 6
    
    var body: some View {
        VStack {
            HStack {
                ForEach(transport[0..<emojiCount], id: \.self){ emoji in
                    CardView(content: emoji)
                }
            }
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding()
        .foregroundColor(.red)
    }
    
    var add: some View {
        Button(
            action: {
                if(emojiCount < transport.count){
                    emojiCount += 1
                }
            },
            label: {
                Image(systemName: "plus.circle")
                
            }
        )
    }
    
    var remove: some View {
        Button(
            action: {
                if(emojiCount > 1){
                    emojiCount -= 1
                }
            },
            label: {
                Image(systemName: "minus.circle")
                
            }
        )
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20.0)
        ZStack(content: {
            if(isFaceUp){
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        })
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
