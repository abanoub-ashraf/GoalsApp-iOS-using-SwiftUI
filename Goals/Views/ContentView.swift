//
//  ContentView.swift
//  Goals
//
//  Created by Abanoub Ashraf on 19/11/2023.
//

import SwiftUI

struct ContentView: View {
    private var repo: GoalRepositoryProtocol
    @ObservedObject private var goalListVM: GoalsListViewModel
    @State private var isEditing = false
    @State private var showAddNewGoal = false
    
    private var gridItems: [GridItem] {
        Array(repeating: .init(.adaptive(minimum: 120)), count: 2)
    }
    
    init(repo: GoalRepositoryProtocol) {
        self.repo = repo
        self.goalListVM = GoalsListViewModel(repo: repo)
    }
    
    private func deleteButton(goal: GoalViewModel) -> some View {
        Button {
            Task {
                await goalListVM.deleteGoal(goalVM: goal)
            }
        } label: {
            Image(systemName: "minus.circle.fill")
                .foregroundStyle(.pink)
        }
        .font(.title)
    }
    
    private func addButton() -> some View {
        Button {
            showAddNewGoal = true
        } label: {
            Image(systemName: "plus.circle")
                .font(.system(size: 64))
                .shadow(radius: 5)
                .clipped()
                .foregroundStyle(.orange.gradient)
        }
        .padding(.trailing, 20)
        .opacity(isEditing ? 0.0 : 1.0)
        .fullScreenCover(isPresented: $showAddNewGoal, onDismiss: {
            fetchGoals()
        }, content: {
            AddNewGoalView(repo: repo)
        })
    }
    
    private func goalCells() -> some View {
        LazyVGrid(columns: gridItems) {
            ForEach(goalListVM.goals, id: \.id) { goal in
                NavigationLink {
                    GoalDetailView(viewModel: GoalDetailsViewModel(goalVM: goal, repo: repo))
                } label: {
                    GoalView(goalVM: goal)
                        .rotationEffect(.degrees(isEditing ? 2.5 : 0))
                        .animation(
                            Animation
                                .easeInOut(duration: .random(in: 0.10...0.18))
                                .repeat(while: isEditing, autoreverse: isEditing),
                            value: isEditing
                        )
                        .overlay(alignment: .topTrailing) {
                            if isEditing {
                                deleteButton(goal: goal)
                                    .offset(x: 10, y: -10)
                            }
                        }
                }
            }
        }
        .padding(.horizontal)
    }
    
    private func editButton() -> some View {
        Button {
            isEditing.toggle()
        } label: {
            Text(isEditing ? "Done" : "Edit")
                .foregroundStyle(.primary)
        }
    }
    
    private func fetchGoals() {
        Task {
            await goalListVM.getAllGoals()
            print("new goals fetched")
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                ScrollView(.vertical, showsIndicators: false) {
                    goalCells()
                }
                
                addButton()
            }
            .navigationTitle("Your Goals")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    editButton()
                }
            }
            .onAppear {
                fetchGoals()
            }
        }
        .tint(.primary)
    }
}

#Preview {
    ContentView(repo: MockGoalRepository())
        .preferredColorScheme(.dark)
}

#Preview {
    ContentView(repo: MockGoalRepository())
        .preferredColorScheme(.light)
}
