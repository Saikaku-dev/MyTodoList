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
            CompletedTaskView(vm: CurrentTaskViewModel(localTaskUseCase: LocalTaskUseCase(repository: LocalTaskRepositoryImpl())))
                .tabItem {
                    Image(systemName: "trash")
                }
        }
    }
}

#Preview {
    MainTabView()
}
