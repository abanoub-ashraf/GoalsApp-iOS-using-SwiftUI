//
//  AddGoalViewModelTests.swift
//  GoalsTests
//
//  Created by Abanoub Ashraf on 02/12/2023.
//

import XCTest
import Firebase

@testable import Goals

final class AddGoalViewModelTests: XCTestCase {
    var mockRepo: MockGoalRepository!
    var viewModel: AddGoalViewModel!
    
    override func setUpWithError() throws {
        self.mockRepo = MockGoalRepository()
        self.viewModel = AddGoalViewModel(repo: self.mockRepo)
    }
    
    func testAddGoalItem() {
        XCTAssertEqual(self.viewModel.items.count, 0)
        self.viewModel.addGoalItems(item: "Test item")
        XCTAssertEqual(self.viewModel.items.count, 1)
        XCTAssertEqual(self.viewModel.items[0], "Test item")
    }
    
    func testAddGoal() async {
        self.viewModel.name = "New Goal"
        self.viewModel.dueOn = Date()
        self.viewModel.color = .red
        self.viewModel.icon = "✅"
        self.viewModel.items = ["Goal objective 1"]
        await self.viewModel.add()
        XCTAssertEqual(self.viewModel.saved, true)
        XCTAssertEqual(self.mockRepo.goals.count, 7)
        XCTAssertEqual(self.mockRepo.goals[6].name, "New Goal")
    }
}
