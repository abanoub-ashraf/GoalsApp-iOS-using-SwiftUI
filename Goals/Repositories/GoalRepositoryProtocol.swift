//
//  GoalRepositoryProtocol.swift
//  Goals
//
//  Created by Abanoub Ashraf on 20/11/2023.
//

import Foundation

protocol GoalRepositoryProtocol {
    func getAll() async -> [Goal]
    func add(goal: Goal) async -> Goal?
    func delete(goal: Goal) async -> Bool
    func addGoalItem(goal: Goal, item: String) async -> Goal?
    func deleteGoalItem(goal: Goal, item: String) async -> Goal?
}
