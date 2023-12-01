//
//  ContentView.swift
//  Goals
//
//  Created by Abanoub Ashraf on 19/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            EmojiTextField(text: $text, placeholder: "Enter an emoji here")
                .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
