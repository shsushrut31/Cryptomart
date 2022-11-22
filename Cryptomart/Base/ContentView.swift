//
//  ContentView.swift
//  Cryptomart
//
//  Created by Sushrut Shastri on 2022-11-22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label {
                        Text("Home")
                    } icon: {
                        Image(systemName: "house")
                    }
                }
            
            PortfolioView()
                .tabItem {
                    Label {
                        Text("My Portfolio")
                    } icon: {
                        Image(systemName: "dollarsign.arrow.circlepath")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
