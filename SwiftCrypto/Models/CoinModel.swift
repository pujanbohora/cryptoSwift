//
//  CoinModel.swift
//  SwiftCrypto
//
//  Created by Pawan Bohora on 5/10/24.
//

import Foundation

// CoinGecko API info
/*

URL :
https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24

 
 */


/// Because it has an id field so it is already conforms to identifiable
/// identifiable provides each coin an id
/// Codable that simplifies the process of encoding and decoding data between your app and a JSON

struct CoinModel: Codable {
  let data: [CoinDatum]
  let info: Info?
    
  
  enum CodingKeys : String, CodingKey {
    case data
    case info
  }
}


struct CoinDatum: Identifiable, Codable {
    let id, symbol, name, nameid: String
    let image: String = "https://i.pinimg.com/564x/c8/05/83/c80583d4410bcd1bd6cce620087b40e0.jpg"
    let rank: Int
    let priceUsd: String
    let percentChange24H, percentChange1H, percentChange7D: String?
    let priceBtc, marketCapUsd: String?
    let volume24, volume24A: Double?
    let csupply, tsupply, msupply: String?
    let currentHoldings: Double?
    
    enum CodingKeys : String, CodingKey {
        case id, symbol, name, nameid
        case image
        case rank
        case priceUsd = "price_usd"
        case percentChange24H = "percent_change_24h"
        case percentChange1H = "percent_change_1h"
        case percentChange7D = "percent_change_7d"
        case priceBtc = "price_btc"
        case marketCapUsd = "market_cap_usd"
        case volume24
        case volume24A
        case csupply
        case tsupply
        case msupply
        case currentHoldings
    }
    
    
    ///login
    /// return us a updated coin model which is actually a new coin model
    func updateHoldings(amount: Double) -> CoinDatum {
        return CoinDatum(id: id, symbol: symbol, name: name, nameid: nameid, rank: rank, priceUsd: priceUsd, percentChange24H: percentChange24H, percentChange1H: percentChange1H, percentChange7D: percentChange7D, priceBtc: priceBtc, marketCapUsd: marketCapUsd, volume24: volume24, volume24A: volume24A, csupply: csupply, tsupply: tsupply, msupply: msupply, currentHoldings: currentHoldings)
    }
    
    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * (Double(priceUsd) ?? 0)
    }
    
    var rankC: Int {
        return rank
    }
    
}

struct Info: Codable {
    let coinsNum, time: Int?
}
