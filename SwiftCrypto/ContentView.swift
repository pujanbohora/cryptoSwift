//
//  ContentView.swift
//  SwiftCrypto
//
//  Created by Pawan Bohora on 5/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                Text("Green Color")
                    .foregroundColor(.theme.green)
                Text("Secondary Color")
                    .foregroundColor(.theme.secondaryText)
                Text("Red Color")
                    .foregroundColor(.theme.red)
            }
        }
    }
}

#Preview {
    ContentView()
}
