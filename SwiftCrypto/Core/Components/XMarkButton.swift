//
//  XMarkButton.swift
//  SwiftCrypto
//
//  Created by Pawan Bohora on 5/14/24.
//

import SwiftUI

struct XMarkButton: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()

        }, label: {
            Image(systemName: "xmark")
        })
    }
}

#Preview {
    XMarkButton()
}
