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
    @Attribute(.unique) let id: String
    var title: String
    var isCompleted: Bool
    var createdDate: Date
    var completedDate: Date?
    
    init(id: String = UUID().uuidString,
         title: String,
         isCompleted: Bool = false,
         createdDate: Date = Date(),
         completedDate: Date? = nil) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.createdDate = createdDate
        self.completedDate = completedDate
    }
    
    func toggleCompleted() {
        isCompleted.toggle()
        completedDate = isCompleted ? Date() : nil
    }
}
