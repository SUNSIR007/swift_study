//
//  ContentView.swift
//  Memorize
//
//  Created by Ryuichi on 2025/4/16.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["😀","🤡","👺","🐶","🐱","🐭"]
    
    @State var cardCount: Int = 2
    
    var body: some View {
        VStack {
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cardCountAdjusters: some View
    {
        HStack
        {
            cardAdder
            Spacer()
            cardRemover
        }
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View
    {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .imageScale(.large)
        .font(.largeTitle)
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardAdder: some View {
        return cardCountAdjuster(by: 1, symbol: "plus.app.fill")
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self){
                index in
                CardView(content: emojis[index])
                    .aspectRatio(1/1,contentMode: .fit)
            }
        }
        .foregroundColor(.blue)
    }
    
    var cardRemover: some View{
        return cardCountAdjuster(by: -1, symbol: "minus.square.fill")
    }
    
    struct CardView: View {
        @State var isFaceUp: Bool = true
        let content: String
        var body: some View {
            ZStack{
                let base: RoundedRectangle = RoundedRectangle(cornerRadius: 20)
                
                Group {
                    base
                        .fill(.white)
                    base
                        .strokeBorder(lineWidth: 10)
                    Text(content)
                        .font(.largeTitle)
                }.opacity(isFaceUp ? 1 : 0 )

                base.fill()
                        .strokeBorder(lineWidth: 10)
                        .opacity(isFaceUp ? 0 : 1 )
                }
            .onTapGesture {
                isFaceUp = !isFaceUp
            }
        }
    }
}
    
#Preview {
    ContentView()
}
