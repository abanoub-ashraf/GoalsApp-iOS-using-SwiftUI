//
//  GoalsListViewModel.swift
//  Goals
//
//  Created by Abanoub Ashraf on 02/12/2023.
//

import SwiftUI

final class GoalsListViewModel: ObservableObject {
    private var repo: GoalRepositoryProtocol
    
    @Published var goals = [GoalViewModel]()
    
    init(repo: GoalRepositoryProtocol) {
        self.repo = repo
    }
    
    func getAllGoals() async {
        let fetchedGoals = await self.repo.getAll().map(GoalViewModel.init)
        
        DispatchQueue.main.async { [weak self] in
            self?.goals = fetchedGoals
        }
    }
    
    func deleteGoal(goalVM: GoalViewModel) async {
        let deleted = await self.repo.delete(goal: goalVM.goal)
        print("Goal \(goalVM.name) is deleted? \(deleted)")
        
        await self.getAllGoals()
    }
}
