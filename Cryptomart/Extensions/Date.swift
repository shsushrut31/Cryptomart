//
//  Date.swift
//  Cryptomart
//
//  Created by Sushrut Shastri on 2022-12-16.
//

import Foundation

extension Date {
    init(dateStringFromAPI: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: dateStringFromAPI) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
}
