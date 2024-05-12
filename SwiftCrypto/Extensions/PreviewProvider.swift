//
//  PreviewProvider.swift
//  SwiftCrypto
//
//  Created by Pawan Bohora on 5/11/24.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

//Singleton
class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let homeVM = HomeViewModel()
    
    let coin = CoinDatum(
        id: "90",
        symbol: "BTC",
        name: "Bitcoin",
        nameid: "bitcoin",
        rank: 1,
        priceUsd: "60808.75",
        percentChange24H: "-0.28",
        percentChange1H: "-0.34",
        percentChange7D: "-4.44",
        priceBtc: "1.00",
        marketCapUsd: "1197327904693.00",
        volume24: 15033484288.97838,
        volume24A: 26622002076.233414,
        csupply: "19690059.00",
        tsupply: "19690059",
        msupply: "21000000",
        currentHoldings: 1.5)
}
