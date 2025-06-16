//
//  UserRepository.swift
//  MyTodoList
//
//  Created by cmStudent on 2025/06/16.
//

import Foundation

protocol UserRepository {
    var currentUser: User? { get }
    
    func signIn(email: String, password: String)
    func signOut()
}
