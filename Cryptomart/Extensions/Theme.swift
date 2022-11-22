//
//  Theme.swift
//  Cryptomart
//
//  Created by Sushrut Shastri on 2022-11-22.
//

import Foundation
import SwiftUI


struct Theme {
    let accentColor = Color("AccentColor")
    let backgroundColor = Color("AppBackground")
    let grayColor = Color("AppGray")
    let secondaryTextColor = Color("SecondaryText")
}

extension Color {
    static let DefaultTheme = Theme()
}
