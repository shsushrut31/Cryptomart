//
//  HomeView.swift
//  Cryptomart
//
//  Created by Sushrut Shastri on 2022-11-22.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var vm: HomeViewModel
    var body: some View {
        NavigationView {
            ZStack {
                Color.DefaultTheme.backgroundColor
                    .ignoresSafeArea()
                List {
                    ForEach(vm.allCoins) { coin in
                        StockTableRowView(coin: coin)
                            .padding(.leading, -15)
                            .padding(.trailing, -10)
                    }
                }.scrollIndicators(.hidden)
            }.navigationTitle("Live Prices")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(dev.vm)
    }
}
