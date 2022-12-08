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
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global())
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                // Convert to a string and print
                if let JSONString = String(data: output.data, encoding: String.Encoding.utf8) {
                   print(JSONString)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: [Coin].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] coins in
                self?.allCoins = coins
            }
            .store(in: &cancellable)
        
    }
}
