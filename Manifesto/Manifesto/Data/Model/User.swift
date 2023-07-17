//
//  User.swift
//  Manifesto
//
//  Created by BPS.Dev01 on 7/12/23.
//

import Foundation

class User: Identifiable, Codable, Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
    
    var id = UUID()
    var name: String
    var phoneNumber: String
    var email: String
    var emergencyNumber: String
    var emergencyContactName: String
    
    init(name: String, phoneNumber: String, email: String, emergencyNumber: String, emergencyContactName: String){
        self.name = name
        self.phoneNumber = phoneNumber
        self.email = email
        self.emergencyNumber = emergencyNumber
        self.emergencyContactName = emergencyContactName
    }
    
}
