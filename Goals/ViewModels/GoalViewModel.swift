//
//  GoalViewModel.swift
//  Goals
//
//  Created by Abanoub Ashraf on 02/12/2023.
//

import UIKit
import SwiftUI

struct GoalViewModel {
    var goal: Goal
    
    var id: String {
        self.goal.id ?? ""
    }
    
    var name: String {
        self.goal.name
    }
    
    var dueOnDate: Date {
        self.goal.dueOn
    }
    
    var dueOn: String {
        self.goal.dueOn.toRelativeDate()
    }
    
    var color: Color {
        Color(hex: self.goal.color)
    }
    
    var icon: String {
        self.goal.icon
    }
    
    var items: [String] {
        get {
            self.goal.items
        }
        set(newItem) {
            self.goal.items = newItem
        }
    }
}
