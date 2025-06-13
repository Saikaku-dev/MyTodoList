//
//  MainTabView.swift
//  MyTodoList
//
//  Created by cmStudent on 2025/06/13.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            CurrentTaskView()
                .tabItem {
                    Image(systemName: "list.dash")
                }
        }
    }
}

#Preview {
    MainTabView()
}
