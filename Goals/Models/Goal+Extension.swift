//
//  Goal+Extension.swift
//  Goals
//
//  Created by Abanoub Ashraf on 19/11/2023.
//

import Foundation

extension Goal {
    static var sampleGoals: [Goal] {
        [
            .init(
                id: "WorkID",
                name: "Work",
                dueOn: Date(),
                color: "#0984e3",
                icon: "👝",
                items: [
                    "Record new video course",
                    "Research on new topic",
                    "Build new app"
                ]
            ),
            .init(
                id: "PersonalID",
                name: "Personal",
                dueOn: Date(),
                color: "#e17055",
                icon: "🔐",
                items: [
                    "Clean car",
                    "Buy groceries",
                    "Book vacation"
                ]
            ),
            .init(
                id: "FitnessID",
                name: "Fitness",
                dueOn: Date(),
                color: "#6c5ce7",
                icon: "🏋️‍♀️",
                items: [
                    "Workout 45 min everyday",
                    "Go for a walk"
                ]
            ),
            .init(
                id: "TravelID",
                name: "Travel",
                dueOn: Date(),
                color: "#00b894",
                icon: "🐝",
                items: [
                    "Book beach vacation",
                    "Explore all places to see",
                    "Explore all local cuisines"
                ]
            ),
            .init(
                id: "GigsID",
                name: "Gigs",
                dueOn: Date(),
                color: "#fd79a8",
                icon: "🌟",
                items: [
                    "Help other engineers in problem solving",
                    "Help prepare for interviews"
                ]
            ),
            .init(
                id: "CareerID",
                name: "Career",
                dueOn: Date(),
                color: "#2d3436",
                icon: "👔",
                items: [
                    "Learn about new trends"
                ]
            )
        ]
    }
}
