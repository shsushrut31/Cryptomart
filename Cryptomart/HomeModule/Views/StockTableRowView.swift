//
//  StockTableRowView.swift
//  Cryptomart
//
//  Created by Sushrut Shastri on 2022-11-22.
//

import SwiftUI

struct StockTableRowView: View {
    var body: some View {
        HStack {
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable()
                .background(.green)
                .frame(width:30, height: 30)
                .clipShape(Circle())
                .padding(5)
            
            VStack(alignment: .leading) {
                Text("Bitcoin")
                    .font(.custom("Helvetica", size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(Color.DefaultTheme.accentColor)
                Text("BTC")
                    .font(.custom("Helvetica", size: 14))
                    .fontWeight(.medium)
                    .foregroundColor(Color.DefaultTheme.secondaryTextColor)
            }
            
            Spacer()
            
            Text("4.65%")
                .font(.custom("Helvetica", size: 14))
                .fontWeight(.medium)
                .foregroundColor(Color.DefaultTheme.profitTextColor)
                .padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
                .background(Color.DefaultTheme.profitBackgroundColor)
                .clipShape(Capsule())
                .padding(5)
        }
    }
}

struct StockTableRowView_Previews: PreviewProvider {
    static var previews: some View {
        StockTableRowView()
    }
}
