//
//  GoalView.swift
//  Goals
//
//  Created by Abanoub Ashraf on 02/12/2023.
//

import SwiftUI

struct GoalView: View {
    let goalVM: GoalViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(goalVM.name)
                .font(.largeTitle)
            
            Text(goalVM.dueOn.lowercased())
            
            HStack(alignment: .firstTextBaseline) {
                Text("\(goalVM.items.count)")
                
                Spacer()
                
                Text(goalVM.icon)
            }
        }
        .padding()
        .background(
            UnevenRoundedRectangle(bottomLeadingRadius: 20, topTrailingRadius: 20)
                .foregroundStyle(goalVM.color.gradient)
        )
        .foregroundStyle(.white)
    }
}

#Preview {
    GoalView(goalVM: GoalViewModel(goal: Goal.sampleGoals[3]))
}
