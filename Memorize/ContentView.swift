//
//  ContentView.swift
//  Memorize
//
//  Created by Omkar Ingale on 14/12/22.
//

import SwiftUI

struct ContentView: View {
    
    var transport: Array<String> = ["🚗","🚕","🚙","🚌","🚎","🏎️","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🚖","🚝","🚆","✈️","🛩️","🚀","🛸","🚁","🚤","⛴️"]
    
    var food: Array<String> = ["🍏","🍎","🍐","🍊","🍋","🍌","🍇","🥐","🥯","🍞","🥖","🥨","🧀","🥚","🧈","🥞","🧇","🥩","🍗","🍖","🌭","🍔","🍟","🍕"]
    
    var animals: Array<String> = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯","🦁","🐮","🐷","🐽","🐸","🐵","🙈","🙉","🙊","🐒","🐔","🐧","🐦"]
    
    @State var emojis: Array<String> = ["🚗","🚕","🚙","🚌","🚎","🏎️","🚓","🚑","🚒","🚐","🛻","🚚","🚛","🚜","🚖","🚝","🚆","✈️","🛩️","🚀","🛸","🚁","🚤","⛴️"]
    
    @State var emojiCount = 6
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self){ emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            themeChooser
                .padding(.vertical)
                .font(.largeTitle)
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding()
        
    }
    
    var themeChooser: some View {
        HStack{
            transportTheme
            Spacer()
            foodTheme
            Spacer()
            animalTheme
        }
    }
    
    var transportTheme: some View {
        Button(
            action:{
                emojis = transport.shuffled()
            },
            label: {
                Image.init(systemName: "car.fill")
            }
        )
    }
    
    var foodTheme: some View {
        Button(
            action:{
                emojis = food.shuffled()
            },
            label: {
                Image.init(systemName: "takeoutbag.and.cup.and.straw")
            }
        )
    }
    
    var animalTheme: some View {
        Button(
            action:{
                emojis = animals.shuffled()
            },
            label: {
                Image.init(systemName: "pawprint.circle")
            }
        )
    }
    
    var add: some View {
        Button(
            action: {
                if(emojiCount < emojis.count){
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
                shape.strokeBorder(lineWidth: 3)
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
