//
//  StockTableRowView.swift
//  Cryptomart
//
//  Created by Sushrut Shastri on 2022-11-22.
//

import SwiftUI

struct StockTableRowView: View {
    let coin: Coin
    
    var body: some View {
        HStack {
            coinImage
            coinName
            
            Spacer()
            
            VStack(alignment: .trailing) {
                coinCurrentPrice
                coinPriceChange
            }
        }
    }
}

struct StockTableRowView_Previews: PreviewProvider {
    static var previews: some View {
        StockTableRowView(coin: dev.coin)
    }
}

extension StockTableRowView {
    private var coinImage: some View {
        Image(systemName: "bitcoinsign.circle.fill")
            .resizable()
            .background(.green)
            .frame(width:30, height: 30)
            .clipShape(Circle())
            .padding(.leading, 5)
            .padding(.vertical, 5)
    }
    
    private var coinName: some View {
        VStack(alignment: .leading) {
            Text(coin.name)
                .font(.custom("Helvetica", size: 16))
                .fontWeight(.bold)
                .foregroundColor(Color.DefaultTheme.accentColor)
            Text(coin.symbol)
                .font(.custom("Helvetica", size: 14))
                .fontWeight(.medium)
                .foregroundColor(Color.DefaultTheme.secondaryTextColor)
        }
    }
    
    private var coinCurrentPrice: some View {
        Text("$\(coin.currentPrice.roundedToTwoDecimals)")
            .padding(.bottom, -5)
            .fontWeight(.bold)
            .font(.custom("Helvetica", size: 16))
            .foregroundColor(Color.DefaultTheme.accentColor)
    }
    
    private var coinPriceChange: some View {
        Text("\((coin.priceChangePercentage24H ?? 0.00).roundedToTwoDecimals)%")
            .font(.custom("Helvetica", size: 12))
            .fontWeight(.regular)
            .foregroundColor(coin.priceChangePercentage24H ?? 0.00 > 0.0 ? Color.DefaultTheme.profitTextColor : Color.DefaultTheme.lossTextColor)
            .padding(EdgeInsets(top: 3, leading: 8, bottom: 3, trailing: 8))
            .background(coin.priceChangePercentage24H ?? 0.00 > 0.0 ? Color.DefaultTheme.profitBackgroundColor : Color.DefaultTheme.lossBackgroundColor)
            .clipShape(Capsule())
    }
}
