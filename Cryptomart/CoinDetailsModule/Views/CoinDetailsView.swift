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
    var chartColor: Color = Color.DefaultTheme.accentColor
    
    init(coin: Coin) {
        self.coin = coin
        self.items = coin.sparklineIn7D?.chartItems ?? []
        self.chartColor = (items.last?.price ?? 0.0) - (items.first?.price ?? 0.0) > 0.0 ? Color.DefaultTheme.profitTextColor : Color.DefaultTheme.lossTextColor
        
    }
    
    var body: some View {
//        ZStack {
//            Color.DefaultTheme.backgroundColor
//                .ignoresSafeArea()
            
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
                    
                    statistics
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
            .navigationTitle(coin.name)
            .navigationBarTitleDisplayMode(.inline)
//        }
//        .navigationTitle(coin.name)
//        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CoinDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailsView(coin: dev.coin)
    }
}

extension CoinDetailsView {
    private var coinChart: some View {
        ZStack {
            CoinImageView(coin: coin)
                .frame(width:200, height: 200)
                .clipShape(Circle())
                .offset(x: 50, y: -100)
            Color.DefaultTheme.accentColor.opacity(0.2).blur(radius: 400).clipShape(RoundedRectangle(cornerRadius: 20))
            VStack(alignment: .leading) {
                Text("$\(coin.currentPrice.roundedToTwoDecimals)")
                    .font(.system(size: 32, weight: .bold))
                if let sparkLine = coin.sparklineIn7D {
                    Chart(items) {
                        LineMark( x: .value("Time", $0.index),
                                  y: .value("Price", $0.animate ? $0.price : 0))
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(chartColor)
                        AreaMark( x: .value("Time", $0.index),
                                  y: .value("Price", $0.animate ? $0.price : 0))
                        .interpolationMethod(.catmullRom)
                        .foregroundStyle(chartColor.opacity(0.3).gradient)
                    }
                    .chartYScale(domain: ClosedRange(uncheckedBounds: (lower: sparkLine.minValue, upper: sparkLine.maxValue)))
                    
                    .chartXScale(domain: ClosedRange(uncheckedBounds: (lower: 0, upper: items.count)))
                    .frame(height: 200)
                    .clipped()
                }
            }
            .padding()
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20))
        }.clipped()
    }
    
    private var statistics: some View {
        VStack(alignment: .leading) {
            Text("Statistics")
                .font(.system(size: 22, weight: .bold))
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("OPEN")
                            .foregroundColor(.DefaultTheme.grayColor)
                        Spacer()
                        Text(coin.currentPrice.roundedToTwoDecimals)
                            .padding(.trailing, 5)
                    }
                    .frame(height: 50)
                    Divider()
                    HStack {
                        Text("HIGH")
                            .foregroundColor(.DefaultTheme.grayColor)
                        Spacer()
                        Text(coin.high24H?.roundedToTwoDecimals ?? "-")
                            .padding(.trailing, 5)
                    }.frame(height: 50)
                    Divider()
                    HStack {
                        Text("LOW")
                            .foregroundColor(.DefaultTheme.grayColor)
                        Spacer()
                        Text(coin.low24H?.roundedToTwoDecimals ?? "-")
                            .padding(.trailing, 5)
                    }.frame(height: 50)
                    Divider()
                    HStack {
                        Text("52 WK HIGH")
                            .foregroundColor(.DefaultTheme.grayColor)
                        Spacer()
                        Text(coin.high24H?.roundedToTwoDecimals ?? "-")
                            .padding(.trailing, 5)
                    }.frame(height: 50)
                    Divider()
                    HStack {
                        Text("52 WK LOW")
                            .foregroundColor(.DefaultTheme.grayColor)
                        Spacer()
                        Text(coin.high24H?.roundedToTwoDecimals ?? "-")
                            .padding(.trailing, 5)
                    }.frame(height: 50)
                }
                .frame(maxWidth: .infinity)
                Spacer()
                VStack {
                    HStack {
                        Text("VOLUME")
                            .foregroundColor(.DefaultTheme.grayColor)
                        Spacer()
                        Text(coin.totalVolume?.toMillions ?? "-")
                            .padding(.trailing, 5)
                    }.frame(height: 50)
                    Divider()
                    HStack {
                        Text("AVG VOL")
                            .foregroundColor(.DefaultTheme.grayColor)
                        Spacer()
                        Text(coin.totalVolume?.toMillions ?? "-")
                            .padding(.trailing, 5)
                    }.frame(height: 50)
                    Divider()
                    HStack {
                        Text("P/E RATIO")
                            .foregroundColor(.DefaultTheme.grayColor)
                        Spacer()
                        Text(coin.currentPrice.roundedToTwoDecimals)
                            .padding(.trailing, 5)
                    }.frame(height: 50)
                    Divider()
                    HStack {
                        Text("MKT CAP")
                            .foregroundColor(.DefaultTheme.grayColor)
                        Spacer()
                        Text(coin.marketCap?.toBillions ?? "-")
                            .padding(.trailing, 5)
                    }.frame(height: 50)
                    Divider()
                    HStack {
                        Text("DIV/YIELD")
                            .foregroundColor(.DefaultTheme.grayColor)
                        Spacer()
                        Text(coin.currentPrice.roundedToTwoDecimals)
                            .padding(.trailing, 5)
                    }.frame(height: 50)
                }
            }
        }
        .padding(.horizontal)
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
