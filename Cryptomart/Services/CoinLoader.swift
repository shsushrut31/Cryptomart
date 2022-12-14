//
//  CoinLoader.swift
//  Cryptomart
//
//  Created by Sushrut Shastri on 2022-12-08.
//

import Foundation
import Combine

class CoinLoader {
    
    @Published var allCoins: [Coin] = []
    var cancellable = Set<AnyCancellable>()
    
    init() {
        self.loadCoins()
    }
    
    private func loadCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }
        
        NetworkManager.download(from: url)
            .decode(type: [Coin].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handle, receiveValue: { [weak self] coins in
                self?.allCoins = coins
            })
            .store(in: &cancellable)
    }
}
