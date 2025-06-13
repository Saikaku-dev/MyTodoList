//
//  LoginView.swift
//  MyTodoList
//
//  Created by cmStudent on 2025/06/13.
//

import SwiftUI

struct LoginView: View {
    @State private var vm = LoginViewModel()
    @FocusState private var focused: HideKeyboard?
    
    var body: some View {
        VStack {
            // MARK: - Input Card
            VStack (alignment: .leading) {
                Text("Email:")
                    .fontWeight(.bold)
                    .font(.body)
                TextField("example@jec.ac.jp".lowercased(), text: $vm.email)
                    .inputRow()
                    .focused($focused, equals: .email)
                
                Text("PassWord:")
                    .fontWeight(.bold)
                    .font(.body)
                TextField("".lowercased(), text: $vm.password)
                    .inputRow()
                    .focused($focused, equals: .password)
            }
            .padding()
            Divider()
            Text("ログインせず、そのまま使用")
                .foregroundColor(.blue)
                .underline()
                .padding(.top)
                .font(.callout)
                .onTapGesture {
                    
                }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white.opacity(0.001))
        .ignoresSafeArea(.keyboard)
        .onTapGesture {
            focused = nil
        }
        .overlay(alignment: .bottom) {
            Text("version: beta")
                .foregroundColor(Color(.systemGray4))
                .font(.caption2)
        }
    }
}

extension View {
    func inputRow() -> some View {
        self
            .padding()
            .background(Color(.systemGray6))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(.systemGray3), lineWidth: 1)
            )
    }
}

#Preview {
    LoginView()
}
