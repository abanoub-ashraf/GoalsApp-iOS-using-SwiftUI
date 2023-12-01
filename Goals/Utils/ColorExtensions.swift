//
//  ColorExtensions.swift
//  Goals
//
//  Created by Abanoub Ashraf on 29/11/2023.
//

import Foundation
import SwiftUI

extension Color {
    ///
    /// convert hex color into color object
    ///
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = Double((rgb >> 16) & 0x000000FF) / 255.0
        let green = Double((rgb >> 8) & 0x000000FF) / 255.0
        let blue = Double(rgb & 0x000000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
    
    ///
    /// convert color object into hex
    ///
    func toHex() -> String? {
        let uic = UIColor(self)
        
        guard let components = uic.cgColor.components, components.count >= 3 else {
            return nil
        }
        
        let red = Float(components[0])
        let green = Float(components[1])
        let blue = Float(components[2])
        var alpha = Float(1.0)
        
        if components.count >= 4 {
            alpha = Float(components[3])
        }
        
        if alpha != Float(1.0) {
            return String(format: "%02lx%02lx%02lx%02lx", lroundf(red * 255), lroundf(green * 255), lroundf(blue * 255), lroundf(alpha * 255))
        } else {
            return String(format: "%02lx%02lx%02lx", lroundf(red * 255), lroundf(green * 255), lroundf(blue * 255))
        }
    }
}
