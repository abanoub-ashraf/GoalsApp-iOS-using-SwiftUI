//
//  MockGoalRepository.swift
//  Goals
//
//  Created by Abanoub Ashraf on 24/11/2023.
//

import Foundation

final class MockGoalRepository: GoalRepositoryProtocol {
    var goals = Goal.sampleGoals
    
    func getAll() async -> [Goal] {
        return self.goals
    }
    
    func add(goal: Goal) async -> Goal? {
        var internalGoal = goal
        internalGoal.id = UUID().uuidString
        self.goals.append(internalGoal)
        return internalGoal
    }
    
    func delete(goal: Goal) async -> Bool {
        self.goals.removeAll { g in
            g.id == goal.id
        }
        return true
    }
    
    func addGoalItem(goal: Goal, item: String) async -> Goal? {
        for i in 0..<self.goals.count {
            if self.goals[i].id == goal.id {
                self.goals[i].items.append(item)
                return self.goals[i]
            }
        }
        return nil
    }
    
    func deleteGoalItem(goal: Goal, item: String) async -> Goal? {
        for i in 0..<self.goals.count {
            if self.goals[i].id == goal.id {
                self.goals[i].items.removeAll { subItem in
                    item == subItem
                }
                return self.goals[i]
            }
        }
        return nil
    }
}
