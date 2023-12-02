//
//  GoalsListViewModelTests.swift
//  GoalsTests
//
//  Created by Abanoub Ashraf on 02/12/2023.
//

import XCTest
import Firebase

@testable import Goals

final class GoalsListViewModelTests: XCTestCase {
    var mockRepo: MockGoalRepository!
    
    override func setUp() {
        super.setUp()
        self.mockRepo = MockGoalRepository()
    }
    
    override func tearDown() {
        self.mockRepo = nil
        super.tearDown()
    }
    
    func testGetAllGoals() async {
        let goalListVM = GoalsListViewModel(repo: self.mockRepo)
        await goalListVM.getAllGoals()
        XCTAssertEqual(goalListVM.goals.count, 6)
    }
    
    func testDeleteGoal() async {
        let goalListVM = GoalsListViewModel(repo: self.mockRepo)
        await goalListVM.getAllGoals()
        let goal = goalListVM.goals[0]
        await goalListVM.deleteGoal(goalVM: goal)
        XCTAssertEqual(goalListVM.goals.count, 5)
    }
}
