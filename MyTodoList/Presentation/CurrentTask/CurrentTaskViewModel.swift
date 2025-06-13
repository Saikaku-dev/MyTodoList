//
//  CurrentTaskViewModel.swift
//  MyTodoList
//
//  Created by cmStudent on 2025/06/13.
//

import Foundation
import Observation

@Observable
class CurrentTaskViewModel {
    var tasks:[Task] = []
    var taskTitle: String = ""
    var showAddTaskSheet: Bool = false
    private let localTaskUseCase: LocalTaskUseCase
    
    init(localTaskUseCase: LocalTaskUseCase) {
        self.localTaskUseCase = localTaskUseCase
        loadLocalTasks()
    }
    
    func closeSheet() {
        showAddTaskSheet = false
    }
    
    func loadLocalTasks() {
        tasks = localTaskUseCase.fetchAllTasks()
    }
    
    func addTask(title: String) {
        guard !taskTitle.isEmpty else { return }
        let newTask = Task(title: title)
        localTaskUseCase.addTask(newTask)
        loadLocalTasks()
        taskTitle = ""
    }
    
    func toggleCompeted(for task: Task) {
        var updateTask = task
        updateTask.toggleCompleted()
        localTaskUseCase.updateTask(updateTask)
        loadLocalTasks()
    }
}
