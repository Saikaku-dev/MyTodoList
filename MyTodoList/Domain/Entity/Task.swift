//
//  Task.swift
//  MyTodoList
//
//  Created by cmStudent on 2025/06/13.
//

import Foundation

struct Task:Identifiable {
    let id: String
    let title: String
    var isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    mutating func toggleCompleted() {
        isCompleted.toggle()
    }
}
