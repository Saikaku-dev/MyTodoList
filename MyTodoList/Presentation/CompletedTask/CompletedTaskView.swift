//
//  CompletedTaskView.swift
//  MyTodoList
//
//  Created by cmStudent on 2025/06/16.
//

import SwiftUI

struct CompletedTaskView: View {
    @Bindable var vm: CurrentTaskViewModel
    var body: some View {
        VStack {
            Text("Completed:")
                .fontWeight(.bold)
                .font(.caption)
            VStack {
                ForEach(vm.completedTasks) { task in
                    TaskRow(
                        title: task.title,
                        isCompleted: task.isCompleted,
                        onTap: {
                            vm.toggleCompeted(for: task)
                        }
                    )
                    Divider()
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color(.systemGray6))
    }
}

#Preview {
    CompletedTaskView(vm: CurrentTaskViewModel(localTaskUseCase: LocalTaskUseCase(repository: LocalTaskRepositoryImpl())))
}
