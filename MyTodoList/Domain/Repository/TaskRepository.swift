//
//  TaskRepository.swift
//  MyTodoList
//
//  Created by cmStudent on 2025/06/13.
//

import Foundation

protocol TaskRepository {
    func fetchAllTasks() -> [Task]
    func fetchPendingTasks() -> [Task]
    func fetchCompletedTasks() -> [Task]
    func saveTask(_ task: Task)
    func deleteTask(_ task: Task)
    func updateTask(_ task: Task)
}
