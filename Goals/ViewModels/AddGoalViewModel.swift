//
//  AddGoalViewModel.swift
//  Goals
//
//  Created by Abanoub Ashraf on 02/12/2023.
//

import SwiftUI

final class AddGoalViewModel: ObservableObject {
    private let repo: GoalRepositoryProtocol
    
    var name: String = ""
    var dueOn = Date()
    var color: Color = .pink
    var icon: String = "🌟"
    
    @Published var goalItem: String = ""
    @Published var saved: Bool = false
    @Published var items: [String] = []
    
    init(repo: GoalRepositoryProtocol) {
        self.repo = repo
    }
    
    func add() async {
        let goal = Goal(name: self.name, dueOn: self.dueOn, color: self.color.toHex() ?? "#434343", icon: self.icon, items: self.items)
        let savedGoal = await self.repo.add(goal: goal)
        
        DispatchQueue.main.async { [unowned self] in
            self.saved = savedGoal == nil ? false : true
        }
    }
    
    func addGoalItems(item: String) {
        guard !item.isEmpty, item.count >= 3 else { return }
        
        DispatchQueue.main.async { [unowned self] in
            self.goalItem = ""
            self.items.append(item)
        }
    }
}
