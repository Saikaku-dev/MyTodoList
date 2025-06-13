//
//  LocalTaskRepositoryImpl.swift
//  MyTodoList
//
//  Created by cmStudent on 2025/06/13.
//

import Foundation

// SwiftDataでLocalに保存
class LocalTaskRepositoryImpl: TaskRepository {
    private var localTasks:[Task] = []
    
    func fetchAllTasks() -> [Task] {
        localTasks
    }
    
    func saveTask(_ task: Task) {
        localTasks.append(task)
    }
    
    func deleteTask(_ task: Task) {
        localTasks.removeAll(where: { $0.id == task.id })
    }
    
    func updateTask(_ task: Task) {
        if let index = localTasks.firstIndex(where: { $0.id == task.id }) {
            localTasks[index] = task
        }
    }
}
