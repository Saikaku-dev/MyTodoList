//
//  LoginView.swift
//  MyTodoList
//
//  Created by cmStudent on 2025/06/13.
//

import SwiftUI

struct LoginView: View {
    @State private var vm = LoginViewModel()
    
    var body: some View {
        VStack {
            // MARK: - Input Card
            VStack (alignment: .leading) {
                Text("Email:")
                    .fontWeight(.bold)
                    .font(.body)
                TextField("example@jec.ac.jp".lowercased(), text: $vm.email)
                    .padding()
                    .background(Color(.systemGray6))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(.systemGray3), lineWidth: 1)
                    )
                
                Text("PassWord:")
                    .fontWeight(.bold)
                    .font(.body)
                TextField("".lowercased(), text: $vm.password)
                    .padding()
                    .background(Color(.systemGray6))
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(.systemGray3), lineWidth: 1)
                    )
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
        .overlay(alignment: .bottom) {
            
            Text("version: beta")
                .foregroundColor(Color(.systemGray4))
                .font(.caption2)
        }
    }
}

#Preview {
    LoginView()
}
