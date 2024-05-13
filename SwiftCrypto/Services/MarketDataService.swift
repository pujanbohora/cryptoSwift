//
//  MarketDataService.swift
//  SwiftCrypto
//
//  Created by Pawan Bohora on 5/13/24.
//


import Foundation
import Combine

class MarketDataService {
    
    @Published var marketData: MarketDataModel? = nil
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }

    private func getData() {
        
        guard let url = URL(string: "https://mocki.io/v1/a10a5231-bbe6-47ec-918d-e4ba573f8b37")
        else { return }
        
        print("PRINT \(url)")

        marketDataSubscription = NetworkManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion,
                  receiveValue: { [weak self] (returnedGlobalData) in
                self?.marketData = returnedGlobalData.data
                ///Cancels the request
                 self?.marketDataSubscription?.cancel()
                }
            )
    }
    
    
}

