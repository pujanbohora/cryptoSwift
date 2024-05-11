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
https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 
 
 {
          "id": "bitcoin",
          "symbol": "btc",
          "name": "Bitcoin",
          "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
          "current_price": 60651,
          "market_cap": 1199887220939,
          "market_cap_rank": 1,
          "fully_diluted_valuation": 1279296505579,
          "total_volume": 28170415465,
          "high_24h": 63458,
          "low_24h": 60705,
          "price_change_24h": -1804.5394963763174,
          "price_change_percentage_24h": -2.8893,
          "market_cap_change_24h": -23546607663.01587,
          "market_cap_change_percentage_24h": -1.92463,
          "circulating_supply": 19696475.0,
          "total_supply": 21000000.0,
          "max_supply": 21000000.0,
          "ath": 73738,
          "ath_change_percentage": -17.38461,
          "ath_date": "2024-03-14T07:10:36.635Z",
          "atl": 67.81,
          "atl_change_percentage": 89738.93173,
          "atl_date": "2013-07-06T00:00:00.000Z",
          "roi": null,
          "last_updated": "2024-05-10T16:10:51.823Z",
          "sparkline_in_7d": {
              "price": [
                  59270.4797248366,
                  60679.808749638694,
                  61545.375162503144
              ]
          },
          "price_change_percentage_24h_in_currency": -2.88929606077695
      }

 
 */


/// Because it has an id field so it is already conforms to identifiable
/// identifiable provides each coin an id
/// Codable that simplifies the process of encoding and decoding data between your app and a JSON
struct CoinModel: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap, marketCapRank, fullyDilutedValuation: Double?
    let totalVolume, high24H, low24H: Double?
    let priceChange24H, priceChangePercentage24H, marketCapChange24H, marketCapChangePercentage24H: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7D: SparklineIn7D?
    let priceChangePercentage24HInCurrency: Double?
    let currentHoldings: Double?
    
    enum CodingKeys : String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
    }
    
    
    ///login
    /// return us a updated coin model which is actually a new coin model
    func updateHoldings(amount: Double) -> CoinModel {
        return CoinModel(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24H: high24H, low24H: low24H, priceChange24H: priceChange24H, priceChangePercentage24H: priceChangePercentage24H, marketCapChange24H: marketCapChange24H, marketCapChangePercentage24H: marketCapChangePercentage24H, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7D: sparklineIn7D, priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency, currentHoldings: amount)
    }
    
    var currentHoldingsValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    var rank: Int {
        return Int(marketCapRank ?? 0)
    }
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}
