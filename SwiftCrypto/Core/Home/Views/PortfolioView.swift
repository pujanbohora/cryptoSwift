//
//  PortfolioView.swift
//  SwiftCrypto
//
//  Created by Pawan Bohora on 5/14/24.
//

import SwiftUI

struct PortfolioView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var selectedCoin: CoinDatum? = nil
    @State private var quantityText: String = ""
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    SearchBarView(searchText: $vm.searchText)
                    
                    coinLogoList
                    
                    if selectedCoin != nil {
                        VStack(spacing: 20) {
                            HStack {
                                Text("Current price of \(selectedCoin?.symbol.uppercased() ?? "") :")
                                Spacer()
                                Text("\(selectedCoin?.priceUsd ?? "")")
                            }
                            Divider()
                            HStack {
                                Text("Amount in your portfolio:")
                                Spacer()
                                TextField("Ex:1.4", text: $quantityText)
                                    .multilineTextAlignment(.trailing)
                                    .keyboardType(.decimalPad)
                            }
                            Divider()
                            HStack {
                                Text("Current value:")
                                Spacer()
                                Text(getCurrentValue().asCurrencyWith2Decimals())
                            }
                        } .padding(.leading)
                    }
                    
                   }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
            }
        }
        Text("PORTFOLIO VIEW!!")
    }
}

//#Preview {
//    PortfolioView()
//        .environmentObject(dev.homeVM)
//}

struct PortfolioView_Preview: PreviewProvider {
    static var previews: some View {
        PortfolioView()
            .environmentObject(dev.homeVM)
    }
}


extension PortfolioView {
    
    private var coinLogoList: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHStack(spacing:10) {
                ForEach(vm.allCoins) { coin in
                    CoinLogoView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                selectedCoin = coin
                            }
                        }
                        .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke( selectedCoin?.id == coin.id ?
                                     Color.theme.green : Color.clear, lineWidth: 1)
                        )
                }
            }
            .padding(.vertical, 4)
            .padding(.leading)
        })
    }
    
    private func getCurrentValue() -> Double {
        
        if let quantity = Double(quantityText) {
            return quantity * (Double(selectedCoin?.priceUsd ?? "") ?? 0)
        }
        
        return 0
        
    }
}
