//
//  Double.swift
//  Cryptomart
//
//  Created by Sushrut Shastri on 2022-11-22.
//

import Foundation

extension Double {
    var roundedToTwoDecimals: String {
        return String(format: "%.2f", self)
    }
    var toBillions: String {
        return "\(String(format: "%.2f", self/1000000000))B"
    }
    var toMillions: String {
        return "\(String(format: "%.2f", self/1000000))M"
    }
}
