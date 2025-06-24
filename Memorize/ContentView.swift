//
//  ContentView.swift
//  Memorize
//
//  Created by Ryuichi on 2025/4/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        return HStack(content: {
            CardView(isFaceUp: true)
            CardView()
            
        })
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
        return ZStack(content: {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(lineWidth: 10)
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.white)
                Text("🤡")
                    .font(.largeTitle)
            }
            else{
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(lineWidth: 10)
                Text("🤡")
                    .font(.largeTitle)
            }
            
        })
        .foregroundColor(.orange)
        .padding()
    }
}



#Preview {
    ContentView()
}
