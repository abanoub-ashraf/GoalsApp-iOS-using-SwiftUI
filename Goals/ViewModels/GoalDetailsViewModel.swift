//
//  GoalDetailsViewModel.swift
//  Goals
//
//  Created by Abanoub Ashraf on 02/12/2023.
//

import SwiftUI
import UIKit

final class GoalDetailsViewModel: ObservableObject {
    @Published var goalVM: GoalViewModel
    @Published var newGoalItem = ""
    
    private var repo: GoalRepositoryProtocol
    
    init(goalVM: GoalViewModel, repo: GoalRepositoryProtocol) {
        self.goalVM = goalVM
        self.repo = repo
    }
    
    func addItem(item: String) async {
        let savedGoal = await self.repo.addGoalItem(goal: self.goalVM.goal, item: item)
        
        DispatchQueue.main.async { [weak self] in
            if let savedGoal {
                self?.goalVM.goal = savedGoal
            }
            
            self?.newGoalItem = ""
        }
        
        print(savedGoal ?? "Nil found for the saved goal")
    }
    
    func delete(item: String) async {
        let savedGoal = await self.repo.deleteGoalItem(goal: self.goalVM.goal, item: item)
        print(savedGoal ?? "Nil found while deleting the goal")
    }
}
