//
//  FirebaseGoalRepository.swift
//  Goals
//
//  Created by Abanoub Ashraf on 25/11/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

final class FirebaseGoalRepository: GoalRepositoryProtocol {
    private let db = Firestore.firestore()
    private let goals = "goals"
    
    func getAll() async -> [Goal] {
        do {
            let snapshot = try await self.db.collection(self.goals).getDocuments()
            
            let goals = try snapshot.documents.compactMap { doc in
                var goal = try doc.data(as: Goal.self)
                goal.id = doc.documentID
                return goal
            }
            
            return goals
        } catch {
            print("Error fetching goals \(error.localizedDescription)")
            return []
        }
    }
    
    func add(goal: Goal) async -> Goal? {
        do {
            let ref = try self.db.collection(self.goals).addDocument(from: goal)
            
            let snapshot = try await ref.getDocument()
            let savedGoal = try snapshot.data(as: Goal.self)
            return savedGoal
        } catch {
            print("Error adding goal: \(error.localizedDescription)")
            return nil
        }
    }
    
    func delete(goal: Goal) async -> Bool {
        guard let goalId = goal.id else {
            return false
        }
        
        do {
            try await self.db.collection(self.goals).document(goalId).delete()
            return true
        } catch {
            print("Error deleting the goal \(error.localizedDescription)")
            return false
        }
    }
    
    func addGoalItem(goal: Goal, item: String) async -> Goal? {
        guard let goalId = goal.id else {
            return nil
        }
        
        let ref = self.db.collection(self.goals).document(goalId)
        
        do {
            try await ref.updateData(["items": FieldValue.arrayUnion([item])])
            let doc = try await ref.getDocument()
            var goal = try doc.data(as: Goal.self)
            goal.id = doc.documentID
            return goal
        } catch {
            print("Error updating item \(error.localizedDescription)")
            return nil
        }
    }
    
    func deleteGoalItem(goal: Goal, item: String) async -> Goal? {
        guard let goalId = goal.id else {
            return nil
        }
        
        let ref = self.db.collection(self.goals).document(goalId)
        
        do {
            try await ref.updateData(["items": FieldValue.arrayRemove([item])])
            let doc = try await ref.getDocument()
            var goal = try doc.data(as: Goal.self)
            goal.id = doc.documentID
            return goal
        } catch {
            print("Error deleting item \(error.localizedDescription)")
            return nil
        }
    }
}
