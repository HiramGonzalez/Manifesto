//
//  Users.swift
//  Manifesto
//
//  Created by BPS.Dev01 on 7/12/23.
//

import Foundation

class Users: ObservableObject {
    @Published var usersArray: [User]
    let saveKey = "Users"
    
    init() {
        // load usersArray from UserDefaults
        usersArray = []
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([User].self, from: data) {
                usersArray = decoded
            }
        }
    }
    
    func addUser(_ newUser: User) {
        // add new user to usersArray
        usersArray.append(newUser)
        save()
    }
    
    func getUsers() -> [User] {
        return usersArray
    }
    
    func removeUser(_ userIndex: Int) {
        // remove user
        usersArray.remove(at: userIndex)
        save()
    }
    
    func save() {
        // save changes in usersArray
        if let encoded = try? JSONEncoder().encode(usersArray) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
        print(usersArray)
    }
    
    func checkIfUserExists(withID id: UUID) -> Bool {
        for element in usersArray {
            if element.id == id {
                return true
            }
        }
        return false
    }
    
    func getIndexOfUser(withID id: UUID) -> Int? {
        var index = 0
        for element in usersArray {
            if element.id == id {
                return index
            }
            index += 1
        }
        return nil
    }
    
    func updateUser(withIndex index: Int, name: String, phoneNumber: String, email: String, emergencyNumber: String, emergencyContactName: String) {
        usersArray[index].name = name
        usersArray[index].phoneNumber = phoneNumber
        usersArray[index].email = email
        usersArray[index].emergencyNumber = emergencyNumber
        usersArray[index].emergencyContactName = emergencyContactName
        save()
    }
}
