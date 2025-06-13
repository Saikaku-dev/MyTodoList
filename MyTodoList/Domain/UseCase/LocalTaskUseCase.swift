//
//  LocalTaskUseCase.swift
//  MyTodoList
//
//  Created by cmStudent on 2025/06/13.
//

import Foundation

class LocalTaskUseCase {
    private let repository: TaskRepository
    
    init(repository: TaskRepository) {
        self.repository = repository
    }
    
    func fetchAllTasks() -> [Task] {
        repository.fetchAllTasks()
    }
    
    func addTask(_ task: Task) {
        repository.saveTask(task)
    }
    
    func updateTask(_ task: Task) {
        repository.updateTask(task)
    }
}
