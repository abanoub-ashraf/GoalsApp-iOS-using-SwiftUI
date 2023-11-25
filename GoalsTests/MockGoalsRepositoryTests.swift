//
//  MockGoalsRepositoryTests.swift
//  MockGoalsRepositoryTests
//
//  Created by Abanoub Ashraf on 24/11/2023.
//

import XCTest
import Firebase

@testable import Goals

final class MockGoalsRepositoryTests: XCTestCase {
    var mockRepo: MockGoalRepository!
    
    override func setUp() {
        super.setUp()
        self.mockRepo = MockGoalRepository()
    }
    
    override func tearDown() {
        self.mockRepo = nil
        super.tearDown()
    }
    
    func testGetAll() async {
        let goals = await self.mockRepo.getAll()
        XCTAssertEqual(goals.count, 6)
    }
    
    func testAddGoal() async {
        let newGoal = Goal(name: "New Goal", dueOn: Date(), color: "#434343", icon: "⚡", items: ["Item 1", "item 2"])
        let addedGoal = await self.mockRepo.add(goal: newGoal)
        XCTAssertNotNil(addedGoal)
        XCTAssertEqual(self.mockRepo.goals.count, 7)
    }
    
    func testDeleteGoal() async {
        let goalToDelete = self.mockRepo.goals[0]
        let result = await self.mockRepo.delete(goal: goalToDelete)
        XCTAssertTrue(result)
        XCTAssertEqual(self.mockRepo.goals.count, 5)
    }
    
    func testAddGoalItem() async {
        let goal = self.mockRepo.goals[0]
        let newItem = "A New Item"
        let updatedGoal = await self.mockRepo.addGoalItem(goal: goal, item: newItem)
        XCTAssertNotNil(updatedGoal)
        XCTAssertTrue(updatedGoal!.items.contains(newItem))
    }
    
    func testDeleteGoalItem() async {
        let goal = self.mockRepo.goals[0]
        let goalItemToDelete = goal.items[0]
        let updatedGoal = await self.mockRepo.deleteGoalItem(goal: goal, item: goalItemToDelete)
        XCTAssertNotNil(updatedGoal)
        XCTAssertFalse(updatedGoal!.items.contains(goalItemToDelete))
    }
}
