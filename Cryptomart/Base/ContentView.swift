//
//  ContentView.swift
//  Cryptomart
//
//  Created by Sushrut Shastri on 2022-11-22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = HomeViewModel()
    
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
        .environmentObject(vm)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
