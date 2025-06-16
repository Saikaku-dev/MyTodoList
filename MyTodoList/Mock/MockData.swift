//
//  MockData.swift
//  MyTodoList
//
//  Created by cmStudent on 2025/06/16.
//

import Foundation
import SwiftData

struct MockUsers {
    static let all: [(mail: String, password: String)] = [
        ("user1@example.com","password"),
        ("user2@example.com","password"),
        ("user3@example.com","password")
    ]
    
    static func tasks(for mail: String) -> [String] {
        switch mail {
        case "user1@example.com":
            return [
                "牛乳を買う",
                "宿題をする",
                "友達にメールする",
                "部屋を掃除する",
                "本を読む"
            ]
        case "user2@example.com":
            return [
                "ジムに行く",
                "朝ごはんを作る",
                "犬の散歩をする",
                "買い物リストを作る"
            ]
        case "user3@example.com":
            return [
                "資料をまとめる",
                "会議に参加する",
                "プレゼンの練習をする"
            ]
        default:
            return []
        }
    }
}

struct MockTasks {
    static func create(for user: User, context: ModelContext) {
        let titles = MockUsers.tasks(for: user.mail)
        titles.forEach { title in
            let task = Task(title: title)
            task.user = user
            context.insert(task)
        }
    }
}
