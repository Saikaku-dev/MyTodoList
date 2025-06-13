//
//  CurrentTaskView.swift
//  MyTodoList
//
//  Created by cmStudent on 2025/06/13.
//

import SwiftUI

struct CurrentTaskView: View {
    @State var vm = CurrentTaskViewModel(localTaskUseCase: LocalTaskUseCase(repository: LocalTaskRepositoryImpl()))
    
    var body: some View {
        VStack {
            ForEach(vm.tasks) { task in
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(alignment: .bottomTrailing) {
            Button(action: {
                vm.showAddTaskSheet = true
            }) {
                Image(systemName: "plus.circle.dashed")
                    .font(.system(size: 50))
            }
        }
        .padding()
        .sheet(isPresented: $vm.showAddTaskSheet) {
            TaskInputSheet(vm: vm)
                .presentationDetents([.fraction(0.1)])
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct TaskRow: View {
    let title: String
    var isCompleted: Bool
    let onTap: () -> Void
    
    var body: some View {
        HStack {
            Text(title)
                .strikethrough(isCompleted)
            Spacer()
            ZStack {
                Image(systemName: isCompleted ? "checkmark.square" : "square")
            }
            .onTapGesture {
                onTap()
            }
        }
        .foregroundColor(isCompleted ? .gray : .primary)
        .padding(.horizontal)
    }
}


struct TaskInputSheet: View {
    @Bindable var vm: CurrentTaskViewModel
    @FocusState private var focused: HideKeyboard?
    
    var body: some View {
        VStack {
            // MARK: - TASK内容入力行
            TextField("目標を追加しよう",text: $vm.taskTitle)
                .font(.caption)
            // MARK: - Uploadボタン
            HStack {
                Spacer()
                Button(action: {
                    vm.addTask(title: vm.taskTitle)
                    vm.closeSheet()
                }) {
                    Text("追加")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(4)
                        .background(vm.taskTitle.isEmpty ? .blue.opacity(0.3) : .blue)
                        .cornerRadius(4)
                }
                .disabled(vm.taskTitle.isEmpty)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    CurrentTaskView()
}
