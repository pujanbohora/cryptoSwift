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

        coinSubscription = 
            URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                
                print("API SUBCRIBE:: \(output)")
                
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: CoinModel.self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("[🔥]: \(error.localizedDescription)")
                }
            } receiveValue: {[weak self] (returnedCoins) in
                self?.allCoins = returnedCoins.data
                
                ///Cancels the request
                self?.coinSubscription?.cancel()
            }

        
    }
    
}	
