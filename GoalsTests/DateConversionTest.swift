//
//  DateConversionTest.swift
//  GoalsTests
//
//  Created by Abanoub Ashraf on 01/12/2023.
//

import XCTest
import SwiftUI

@testable import Goals

final class DateConversionTest: XCTestCase {
    func testRelativeDateYesterday() {
        let now = Date()
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: now)
        XCTAssertEqual(yesterday?.toRelativeDate(), "Yesterday")
    }
    
    func testRelativeDateToday() {
        let now = Date()
        XCTAssertEqual(now.toRelativeDate(), "Today")
    }
    
    func testRelativeDateTomorrow() {
        let now = Date()
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: now)
        XCTAssertEqual(tomorrow?.toRelativeDate(), "Tomorrow")
    }
}
