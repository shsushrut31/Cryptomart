//
//  CoinDetailsView.swift
//  Cryptomart
//
//  Created by Sushrut Shastri on 2022-12-15.
//

import SwiftUI
import Charts

struct CoinDetailsView: View {
    @State var coin: Coin
    @State var items: [ChartItem]
    
    init(coin: Coin) {
        self.coin = coin
        self.items = coin.sparklineIn7D?.chartItems ?? []
    }
    
    var body: some View {
        ZStack {
            Color.DefaultTheme.backgroundColor
                .ignoresSafeArea()
            
            VStack {
                ScrollView(.vertical) {
                    coinChart
                        .padding()
                        .onAppear{
                            for (index, _) in items.enumerated() {
                                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.002) {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        items[index].animate = true
                                    }
                                }
                            }
                        }
                }
                
                HStack {
                    Button("Buy") {
                        
                    }
                    .modifier(BuySellButton())
                    
                    Button("Sell") {
                        
                    }
                    .modifier(BuySellButton())
                }
            }
        }
        .navigationTitle(coin.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CoinDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailsView(coin: dev.coin)
    }
}

extension CoinDetailsView {
    private var coinChart: some View {
        VStack(alignment: .leading) {
            Text("$\(coin.currentPrice.roundedToTwoDecimals)")
                .font(.system(size: 32, weight: .bold))
            if let sparkLine = coin.sparklineIn7D {
                Chart(items) {
                    LineMark( x: .value("Time", $0.index),
                              y: .value("Price", $0.animate ? $0.price : 0))
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(Color.DefaultTheme.accentColor)
                    AreaMark( x: .value("Time", $0.index),
                              y: .value("Price", $0.animate ? $0.price : 0))
                    .interpolationMethod(.catmullRom)
                    .foregroundStyle(Color.DefaultTheme.accentColor.opacity(0.5).gradient)
                }
                .chartYScale(domain: ClosedRange(uncheckedBounds: (lower: sparkLine.minValue, upper: sparkLine.maxValue)))
                
                .chartXScale(domain: ClosedRange(uncheckedBounds: (lower: 0, upper: items.count)))
                .frame(height: 200)
                .clipped()
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
            .fill(.white.shadow(.drop(radius: 2))))
    }
}


struct BuySellButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 15, weight: .bold))
            .frame(width: 150, height: 40)
            .background(Color.DefaultTheme.accentColor)
            .foregroundColor(.DefaultTheme.backgroundColor)
            .cornerRadius(5)
    }
}
