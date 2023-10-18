//
//  Date+.swift
//  Instagram
//
//  Created by Khai on 2023/10/16.
//

import Foundation

extension Date {
    var now: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:00"
        return dateFormatter.string(from: self)
    }
}
