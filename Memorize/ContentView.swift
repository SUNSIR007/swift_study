//
//  ContentView.swift
//  Memorize
//
//  Created by Ryuichi on 2025/4/16.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["😀","🤡","👺","🐶","🐱","🐭"]
    
    var body: some View {
            ScrollView{
                cards
            }
        .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(emojis.indices, id: \.self){
                index in
                CardView(content: emojis[index])
                    .aspectRatio(1/1,contentMode: .fit)
            }
        }
        .foregroundColor(.blue)
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
