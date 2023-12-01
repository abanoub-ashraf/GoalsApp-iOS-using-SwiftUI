//
//  ColorConversionTests.swift
//  GoalsTests
//
//  Created by Abanoub Ashraf on 01/12/2023.
//

import XCTest
import SwiftUI

@testable import Goals

final class ColorConversionTests: XCTestCase {
    func testColorToHexConversion() {
        let color = Color(red: 0.5, green: 0.75, blue: 1.0, opacity: 1.0)
        let hex = color.toHex()
        XCTAssertEqual(hex, "80bfff")
    }
    
    func testColorToHexNegativeConversion() {
        let color = Color(red: 0.5, green: 0.75, blue: 1.0, opacity: 1.0)
        let hex = color.toHex()
        XCTAssertNotEqual(hex, "FFFFFF", "Not equal")
    }
    
    func testHexToColorConversion() {
        let hex = "#80bfff"
        let color = Color(hex: hex)
        XCTAssertEqual(color.toHex(), Color(red: 0.5, green: 0.75, blue: 1.0, opacity: 1.0).toHex())
    }
}
