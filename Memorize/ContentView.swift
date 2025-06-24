//
//  ContentView.swift
//  Memorize
//
//  Created by Ryuichi on 2025/4/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let emojis: Array<String> = ["😀","🤡","👺"]
        
        HStack {
            ForEach(emojis.indices, id: \.self){
                index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.blue)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    let content: String
    var body: some View {
        ZStack{
            let base: RoundedRectangle = RoundedRectangle(cornerRadius: 20)
             
            if isFaceUp {
                base
                    .fill(.white)
                base
                    .strokeBorder(lineWidth: 10)
                Text(content)
                    .font(.largeTitle)
            }
            else{
                base.fill()
                    .strokeBorder(lineWidth: 10)
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}



#Preview {
    ContentView()
}
