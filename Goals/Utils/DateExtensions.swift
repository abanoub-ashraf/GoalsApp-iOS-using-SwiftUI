//
//  DateExtensions.swift
//  Goals
//
//  Created by Abanoub Ashraf on 01/12/2023.
//

import Foundation

extension Date {
    func toRelativeDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.doesRelativeDateFormatting = true
        return dateFormatter.string(from: self)
    }
}
