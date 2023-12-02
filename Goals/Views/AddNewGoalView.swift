//
//  AddNewGoalView.swift
//  Goals
//
//  Created by Abanoub Ashraf on 02/12/2023.
//

import SwiftUI

struct AddNewGoalView: View {
    @StateObject private var addGoalVM: AddGoalViewModel
    @Environment(\.dismiss) var dismiss
    
    init(repo: GoalRepositoryProtocol) {
        self._addGoalVM = StateObject<AddGoalViewModel>.init(
            wrappedValue: AddGoalViewModel(repo: repo)
        )
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Form {
                    Section {
                        TextField("Goal name", text: $addGoalVM.name)
                        
                        DatePicker(selection: $addGoalVM.dueOn, in: Date()..., displayedComponents: .date) {
                            Text("Goal due date")
                        }
                        .id(addGoalVM.dueOn)
                        
                        ColorPicker("Goal color", selection: $addGoalVM.color)
                        
                        EmojiTextField(text: $addGoalVM.icon, placeholder: "Enter emoji icon")
                    } header: {
                        Text("New Goal")
                    }
                }
                
                List {
                    HStack {
                        TextField("Enter goal item", text: $addGoalVM.goalItem)
                            .onSubmit {
                                addGoalVM.addGoalItems(item: addGoalVM.goalItem)
                            }
                            .submitLabel(.return)
                    }
                    
                    ForEach(addGoalVM.items, id: \.self) { item in
                        Text(item)
                    }
                }
                .listStyle(.insetGrouped)
                .navigationTitle("Add New Goal")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundStyle(.primary)
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            Task {
                                await addGoalVM.add()
                                dismiss()
                            }
                        } label: {
                            Text("Save")
                                .foregroundStyle(.primary)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AddNewGoalView(repo: MockGoalRepository())
}
