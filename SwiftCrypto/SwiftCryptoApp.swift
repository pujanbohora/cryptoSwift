//
//  SwiftCryptoApp.swift
//  SwiftCrypto
//
//  Created by Pawan Bohora on 5/9/24.
//

import SwiftUI

@main
struct SwiftCryptoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}
