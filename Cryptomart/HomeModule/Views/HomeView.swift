//
//  HomeView.swift
//  Cryptomart
//
//  Created by Sushrut Shastri on 2022-11-22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.DefaultTheme.backgroundColor
                .ignoresSafeArea()
            List {
                StockTableRowView()
                StockTableRowView()
                StockTableRowView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
