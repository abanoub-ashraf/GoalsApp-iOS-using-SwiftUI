//
//  GoalDetailView.swift
//  Goals
//
//  Created by Abanoub Ashraf on 02/12/2023.
//

import SwiftUI

struct GoalDetailView: View {
    @ObservedObject var viewModel: GoalDetailsViewModel
    
    init(viewModel: GoalDetailsViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                HStack {
                    Text(viewModel.goalVM.name)
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    Text(viewModel.goalVM.icon)
                }
                
                Text("Due: \(viewModel.goalVM.dueOn)")
                    .padding(.vertical)
            }
            .padding(.horizontal)
            .foregroundStyle(.white)
            .background(
                LinearGradient(
                    colors: [
                        viewModel.goalVM.color,
                        viewModel.goalVM.color.opacity(0.5)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            
            List {
                HStack {
                    TextField("Add new goal item", text: $viewModel.newGoalItem)
                        .onSubmit {
                            Task {
                                await viewModel.addItem(item: viewModel.newGoalItem)
                            }
                        }
                        .submitLabel(.return)
                }
                
                ForEach(viewModel.goalVM.items, id: \.self) { goalItem in
                    Text(goalItem)
                }
                .onDelete(perform: { indexSet in
                    for i in indexSet {
                        let item = viewModel.goalVM.items[i]
                        
                        Task {
                            await viewModel.delete(item: item)
                        }
                    }
                })
            }
        }
    }
}

#Preview {
    GoalDetailView(
        viewModel: GoalDetailsViewModel(
            goalVM: GoalViewModel(goal: Goal.sampleGoals[3]),
            repo: MockGoalRepository()
        )
    )
}
