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
    let profitTextColor = Color("ProfitText")
    let profitBackgroundColor = Color("ProfitBackground")
    let lossTextColor = Color("LossText")
    let lossBackgroundColor = Color("LossBackground")
}

extension Color {
    static let DefaultTheme = Theme()
}
