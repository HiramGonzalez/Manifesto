//
//  MainScreenViewModel.swift
//  Manifesto
//
//  Created by BPS.Dev01 on 7/12/23.
//

import Foundation
import SwiftUI

extension MainScreen {
    
    @MainActor class ViewModel: ObservableObject {
        var users: Users = Users()
        @Published var usersArray: [User]
        
        init() {
            usersArray = users.getUsers()

        }
        
        
        func deleteUser(at index: Int) {
            users.removeUser(index)
            loadUsers()
        }
        
        func loadUsers() {
            users = Users()
            usersArray = users.getUsers()
            print("It's loaded")
        }
        
        
    }
    
}
