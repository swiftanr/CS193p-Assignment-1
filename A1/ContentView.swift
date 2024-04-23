//
//  ContentView.swift
//  A1
//
//  Created by swiftanr on 18/04/24.
//

import SwiftUI

struct ContentView: View {
    
    let animalEmojis: [String] = ["🐐", "🐕", "🐈", "🐠", "🐡", "🍤", "🦀", "🐐","🐕", "🐈","🐠", "🐡", "🍤", "🦀"]
    let transportEmojis: [String] = ["🚀", "🚍","🚂","🚀", "🚍","🚂"]
    let faceEmojis: [String] = ["😁","😆","🥹","😂","😅","🤣","☺️","🥲","😁","😆","🥹","😂","😅","🤣","☺️","🥲"]
    
    @State var emojis: [String] = ["🐐", "🐕", "🐈", "🐠", "🐡", "🍤", "🦀", "🐐","🐕", "🐈","🐠", "🐡", "🍤", "🦀"]
    @State var themeColor = Color.orange
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .foregroundStyle(.blue)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 72))]) {
                    ForEach(randomNumArray(emojis.count), id: \.self) { index in
                        CardView(content: emojis[index - 1])
                            .aspectRatio(2/3, contentMode: .fit)
                            .padding(1)
                    }
                    .foregroundStyle(themeColor)
                }
            }
            
            HStack {
                Theme(themeName: "Animal", themeImage: "hare.fill")
                    .onTapGesture {
                        emojis = animalEmojis
                        themeColor = .orange
                    }
                Spacer()
                Theme(themeName: "Transport", themeImage: "bus.fill")
                    .onTapGesture {
                        emojis = transportEmojis
                        themeColor = .blue
                    }
                Spacer()
                Theme(themeName: "Faces", themeImage: "smiley.fill")
                    .onTapGesture {
                        emojis = faceEmojis
                        themeColor = .red
                    }
            }
            .foregroundStyle(.blue)
        }
        .padding(.all)
    }
    
    private func randomNumArray(_ n: Int) -> [Int] {
        var numbers = Array(1...n)
        numbers.shuffle()
        return numbers
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
