//
//  Task.swift
//  MyTodoList
//
//  Created by cmStudent on 2025/06/13.
//

import Foundation
import SwiftData

@Model
class Task:Identifiable {
    @Attribute(.unique) var id: String
    var title: String
    var isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func toggleCompleted() {
        isCompleted.toggle()
    }
}
