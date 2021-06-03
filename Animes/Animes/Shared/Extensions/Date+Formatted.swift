//
//  Date+Formatted.swift
//  Animes
//
//  Created by Tony Wang on 6/3/21.
//

import Foundation
extension Date {
    var formatted: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}
