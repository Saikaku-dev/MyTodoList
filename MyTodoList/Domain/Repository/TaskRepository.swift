//
//  TaskRepository.swift
//  MyTodoList
//
//  Created by cmStudent on 2025/06/13.
//

import Foundation

//Taskに対して、何をする(抽象的)
protocol TaskRepository {
    func fetchAllTasks() -> [Task]
    func saveTask(_ task: Task)
    func deleteTask(_ task: Task)
    func updateTask(_ task: Task)
}
