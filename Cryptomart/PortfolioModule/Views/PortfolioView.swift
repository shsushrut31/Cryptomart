//
//  Portfolio.swift
//  Cryptomart
//
//  Created by Sushrut Shastri on 2022-11-22.
//

import SwiftUI

struct PortfolioView: View {
    var body: some View {
        ZStack {
            Color.DefaultTheme.backgroundColor
                .ignoresSafeArea()
            VStack {
                Text("My Portfolio")
                    .foregroundColor(Color.DefaultTheme.accentColor)
                    .font(.largeTitle)
                Text("Secondary Text")
                    .foregroundColor(Color.DefaultTheme.grayColor)
            }
        }
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
    }
}
