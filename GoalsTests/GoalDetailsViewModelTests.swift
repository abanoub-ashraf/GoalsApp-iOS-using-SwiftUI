//
//  GoalDetailsViewModelTests.swift
//  GoalsTests
//
//  Created by Abanoub Ashraf on 02/12/2023.
//

import XCTest
import Firebase

@testable import Goals

final class GoalDetailsViewModelTests: XCTestCase {
    var mockRepo: MockGoalRepository!
    var goalVM: GoalViewModel!
    var viewModel: GoalDetailsViewModel!
    
    override func setUpWithError() throws {
        self.mockRepo = MockGoalRepository()
        self.goalVM = GoalViewModel(goal: self.mockRepo.goals[0])
        self.viewModel = GoalDetailsViewModel(goalVM: self.goalVM, repo: self.mockRepo)
    }
    
    override func tearDown() {
        self.mockRepo = nil
        self.goalVM = nil
        self.viewModel = nil
    }
    
    func testAddGoalItem() async {
        XCTAssertEqual(self.mockRepo.goals[0].items.count, 3)
        await self.viewModel.addItem(item: "Test item")
        XCTAssertEqual(self.mockRepo.goals[0].items.count, 4)
    }
    
    func testDeleteGoalItem() async {
        XCTAssertEqual(self.mockRepo.goals[0].items.count, 3)
        await self.viewModel.delete(item: self.mockRepo.goals[0].items[0])
        XCTAssertEqual(self.mockRepo.goals[0].items.count, 2)
    }
}
