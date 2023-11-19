//
//  Goal.swift
//  Goals
//
//  Created by Abanoub Ashraf on 19/11/2023.
//

import Foundation

struct Goal: Codable {
    var id: String?
    var name: String
    var dueOn: Date
    var color: String
    var icon: String
    var items: [String]
}
