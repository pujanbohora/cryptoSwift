//
//  HomeViewModel.swift
//  SwiftCrypto
//
//  Created by Pawan Bohora on 5/11/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
        
    @Published var allCoins: [CoinDatum] = []
    @Published var portfolioCoins: [CoinDatum] = []
    
    @Published var searchText: String = ""
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        addSubscribers();
    }
    
    func addSubscribers() {
//        dataService.$allCoins
//            .sink { [weak self] (returnedCoins) in
//                self?.allCoins = returnedCoins
//            }
//            .store(in: &cancellables)
        
        ///combineLatest -> now the $allCoins and $searchText has the same subscriber
        ///Updates allCoins
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink {[weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, coins: [CoinDatum]) -> [CoinDatum] {
        
        guard !text.isEmpty else {
               return coins
           }
           
           let lowercasedText = text.lowercased()
           
           let filteredCoins = coins.filter { (coin) -> Bool in
               return coin.name.lowercased().contains(lowercasedText) ||
               coin.symbol.lowercased().contains(lowercasedText) ||
               coin.id.lowercased().contains(lowercasedText)
           }
           return filteredCoins
    }
}
    
