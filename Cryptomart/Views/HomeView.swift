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
            VStack {
                Text("Hello World")
                    .foregroundColor(Color.DefaultTheme.accentColor)
                    .font(.largeTitle)
                Text("Secondary Text")
                    .foregroundColor(Color.DefaultTheme.grayColor)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
