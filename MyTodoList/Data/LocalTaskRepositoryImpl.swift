//
//  LocalTaskRepositoryImpl.swift
//  MyTodoList
//
//  Created by cmStudent on 2025/06/13.
//

import Foundation
import SwiftData
import SwiftUI

// SwiftDataでLocalに保存
class LocalTaskRepositoryImpl: TaskRepository {
    private var modelContainer: ModelContainer
    private var modelContext: ModelContext

    init() {
        do {
            let schema = Schema([Task.self])
            let modelConfiguration = ModelConfiguration(schema: schema,
            isStoredInMemoryOnly: false)
            modelContainer = try ModelContainer(for: schema,
            configurations: [modelConfiguration])
            modelContext = ModelContext(modelContainer)
        } catch {
            fatalError("初期化error: \(error)")
        }
    }
    
    func fetchAllTasks() -> [Task] {
        do {
            let descriptor = FetchDescriptor<Task>()
            return try modelContext.fetch(descriptor)
        } catch {
            print("fetchError: \(error)")
            return []
        }
    }
    
    func fetchPendingTasks() -> [Task] {
        do {
            let descriptor = FetchDescriptor<Task>(
                predicate: #Predicate { $0.isCompleted == false },
                sortBy: [SortDescriptor(\.createdDate)]
            )
            return try modelContext.fetch(descriptor)
        } catch {
            print("fetchError: \(error)")
            return []
        }
    }
    
    func fetchCompletedTasks() -> [Task] {
        do {
            let descriptor = FetchDescriptor<Task>(
                predicate: #Predicate { $0.isCompleted == true },
                sortBy: [SortDescriptor(\.createdDate)]
            )
            return try modelContext.fetch(descriptor)
        } catch {
            print("fetchError: \(error)")
            return []
        }
    }
    
    func saveTask(_ task: Task) {
        modelContext.insert(task)
        saveContext()
    }
    
    func deleteTask(_ task: Task) {
        modelContext.delete(task)
        saveContext()
    }
    
    func updateTask(_ task: Task) {
        saveContext()
    }

    private func saveContext() {
        do {
            try modelContext.save()
        } catch {
            print("Local保存error: \(error)")
        }
    }
}
