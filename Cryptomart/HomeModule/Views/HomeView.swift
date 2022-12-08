//
//  HomeView.swift
//  Cryptomart
//
//  Created by Sushrut Shastri on 2022-11-22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @State private var searchText = ""
    var searchResults: [Coin] {
            if searchText.isEmpty {
                return vm.allCoins
            } else {
                return vm.allCoins.filter { $0.name.lowercased().contains(searchText.lowercased()) || $0.symbol.lowercased().contains(searchText.lowercased()) }
            }
        }
    var body: some View {
        NavigationView {
            ZStack {
                Color.DefaultTheme.backgroundColor
                    .ignoresSafeArea()
                List {
                    ForEach(searchResults) { coin in
                        StockTableRowView(coin: coin)
                            .padding(.leading, -15)
                            .padding(.trailing, -10)
                    }
                }.scrollIndicators(.hidden)
            }.navigationTitle("Live Prices")
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search by name or symbol")
        .autocorrectionDisabled()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(dev.vm)
    }
}
