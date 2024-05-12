//
//  CoinDataService.swift
//  SwiftCrypto
//
//  Created by Pawan Bohora on 5/11/24.
//

import Foundation
import Combine

class CoinDataService {
    
    @Published var allCoins: [CoinDatum] = []
    
//    var cancellables = Set<AnyCancellable>()
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }

    private func getCoins() {
        
        print("API SUBCRIBE:: 123")
        
        guard let url = URL(string: "https://api.coinlore.net/api/tickers/")
        else { return }
        
        print("PRINT \(url)")

        coinSubscription = NetworkManager.download(url: url)
            .decode(type: CoinModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion,
                  receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins.data
                ///Cancels the request
                 self?.coinSubscription?.cancel()
                }
            )
    }
    
    
}	
