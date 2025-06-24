//
//  ContentView.swift
//  Memorize
//
//  Created by Ryuichi on 2025/4/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
        }
        .foregroundColor(.blue)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack{
            var base: RoundedRectangle = RoundedRectangle(cornerRadius: 20)
    
            if isFaceUp {
                base
                    .fill(.white)
                base
                    .strokeBorder(lineWidth: 10)
                Text("🤡")
                    .font(.largeTitle)
            }
            else{
                base.fill()
                    .strokeBorder(lineWidth: 10)
                Text("🤡")
                    .font(.largeTitle)
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
