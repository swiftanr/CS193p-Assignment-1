//
//  ContentView.swift
//  A1
//
//  Created by swiftanr on 18/04/24.
//

import SwiftUI

struct ContentView: View {
    
    //    13 unique animal emojis
    let animalEmojis: [String] = ["🐐", "🐕", "🐈", "🐠", "🐡", "🍤", "🦀", "🐍", "🐢", "🦆", "🦅", "🦩", "🦉", "🐐", "🐕", "🐈", "🐠", "🐡", "🍤", "🦀", "🐍", "🐢", "🦆", "🦅", "🦩", "🦉"]
    
    //    11 unique transport emojis
    let transportEmojis: [String] = ["🚀", "🚍", "🚂", "🚗", "🚑", "🚴🏻", "🏍️", "🚢", "🚣🏽‍♀️", "✈️", "🛺", "🚀", "🚍", "🚂", "🚗", "🚑", "🚴🏻", "🏍️", "🚢", "🚣🏽‍♀️", "✈️", "🛺"]
    
    //    22 unique face emojis
    let faceEmojis: [String] = ["😁", "😆", "🥹", "😂", "😅", "🤣", "☺️", "🥲", "😉", "😇", "🥰", "🥳", "🥸", "😛", "🤓", "🧐", "😎", "😋", "🥵", "😱", "🤥", "🤯", "😁", "😆", "🥹", "😂", "😅", "🤣", "☺️", "🥲", "😉", "😇", "🥰", "🥳", "🥸", "😛", "🤓", "🧐", "😎", "😋", "🥵", "😱", "🤥", "🤯"]
    
    @State var theme = "Animal"
    @State var emojis: [String] = ["🐐", "🐕", "🐈", "🐠", "🐡", "🍤", "🦀", "🐍", "🐢", "🦆", "🦅", "🦩", "🦉", "🐐", "🐕", "🐈", "🐠", "🐡", "🍤", "🦀", "🐍", "🐢", "🦆", "🦅", "🦩", "🦉"]
    @State var themeColor = Color.orange
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .foregroundStyle(.blue)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 72))]) {
                    ForEach(emojis.shuffled(), id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fill)
                    }
                    .foregroundStyle(themeColor)
                }
            }
            
            HStack {
                Theme(themeName: "Animal", themeImage: "hare.fill")
                    .onTapGesture {
                        theme = "Animal"
                        emojis = animalEmojis
                    }
                Spacer()
                Theme(themeName: "Transport", themeImage: "bus.fill")
                    .onTapGesture {
                        theme = "Transport"
                        emojis = transportEmojis
                        themeColor = .blue
                    }
                Spacer()
                Theme(themeName: "Faces", themeImage: "smiley.fill")
                    .onTapGesture {
                        theme = "Faces"
                        emojis = faceEmojis
                        themeColor = .red
                    }
            }
            .foregroundStyle(.blue)
        }
        .padding()
    }
}

struct CardView: View {
    
    let content: String
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 12)
            Group {
                shape.fill(.white)
                shape.stroke(lineWidth: 2)
                Text(content)
                    .font(.title)
            }
            .opacity(isFaceUp ? 1 : 0)
            shape.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

struct Theme: View {
    let themeName: String
    let themeImage: String
    
    var body: some View {
        VStack {
            Image(systemName: themeImage)
                .font(.title)
            Text(themeName)
        }
    }
}

#Preview {
    ContentView()
}
