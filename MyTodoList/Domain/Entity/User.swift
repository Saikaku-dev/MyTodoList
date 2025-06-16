//
//  User.swift
//  MyTodoList
//
//  Created by cmStudent on 2025/06/16.
//

import Foundation
import SwiftData

@Model
final class User: Identifiable {
    @Attribute(.unique) let id: String
    let mail: String
    let password: String
    @Relationship(deleteRule: .cascade) var tasks = [Task]()
    
    init(id: String = UUID().uuidString,
         mail: String,
         password: String) {
        self.id = id
        self.mail = mail
        self.password = password
    }
}
