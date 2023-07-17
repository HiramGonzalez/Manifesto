//
//  SignUpViewModel.swift
//  Manifesto
//
//  Created by BPS.Dev01 on 7/12/23.
//

import Foundation

extension SignUp {
    
    @MainActor class ViewModel: ObservableObject {
        var users: Users = Users()
        @Published var isNameInvalid = false
        @Published var isPhoneNumberInvalid = false
        @Published var isEmailInvalid = false
        @Published var isEmergencyNumberInvalid = false
        @Published var isEmergencyContactNameInvalid = false
        @Published var isFormValid = true
        
        let regex = [
            "name" : "^[a-zA-Z0-9]{2,12}$",
            "phoneNumber" : "^\\d{10}$",
            "email" : "^([a-z0-9\\.-]+)@([a-z0-9\\.-]+)\\.([a-z]{2,8})(\\.[a-z]{2,8})?$",
            "emergencyNumber" : "^\\d{10}$",
            "emergencyContactName" : "^[a-zA-Z0-9]{2,12}$"
        ]
        
        init() { }
        
        func signUser(id: UUID, name: String, phoneNumber: String, email: String, emergencyNumber: String, emergencyContactName: String) {
            
            
            isNameInvalid = validateName(name: name) ? false : true
            isPhoneNumberInvalid = validatePhoneNumber(phoneNumber: phoneNumber) ? false : true
            isEmailInvalid = validateEmail(email: email) ? false : true
            isEmergencyNumberInvalid = validateEmergencyNumber(emergencyNumber: emergencyNumber) ? false : true
            isEmergencyContactNameInvalid = validateEmergencyContactName(emergencyContactName: emergencyContactName) ? false : true

            isFormValid = isNameInvalid || isPhoneNumberInvalid || isEmailInvalid || isEmergencyNumberInvalid || isEmergencyContactNameInvalid ? false : true
            
            if isFormValid {
                if users.checkIfUserExists(withID: id) {
                    if let index = users.getIndexOfUser(withID: id) {
                        users.updateUser(withIndex: index, name: name, phoneNumber: phoneNumber, email: email, emergencyNumber: emergencyNumber, emergencyContactName: emergencyContactName)
                        print("User updated")
                    }
                } else {
                    let newUser = User(name: name, phoneNumber: phoneNumber, email: email, emergencyNumber: emergencyNumber, emergencyContactName: emergencyContactName)
                    
                    users.addUser(newUser)
                }
                
            }
            
        }
        
        func validateName(name: String) -> Bool {
            let namePredicate = NSPredicate(format: "SELF MATCHES %@", regex["name"]!)
            return namePredicate.evaluate(with: name)
        }
        
        func validatePhoneNumber(phoneNumber: String) -> Bool {
            let phoneNumberPredicate = NSPredicate(format: "SELF MATCHES %@", regex["phoneNumber"]!)
            return phoneNumberPredicate.evaluate(with: phoneNumber)
        }
        
        func validateEmail(email: String) -> Bool {
            let emailPredicate = NSPredicate(format: "SELF MATCHES %@", regex["email"]!)
            return emailPredicate.evaluate(with: email)
        }
        
        func validateEmergencyNumber(emergencyNumber: String) -> Bool {
            let emergencyNumberPredicate = NSPredicate(format: "SELF MATCHES %@", regex["emergencyNumber"]!)
            return emergencyNumberPredicate.evaluate(with: emergencyNumber)
        }
        
        func validateEmergencyContactName(emergencyContactName: String) -> Bool {
            let emergencyContactNamePredicate = NSPredicate(format: "SELF MATCHES %@", regex["emergencyContactName"]!)
            return emergencyContactNamePredicate.evaluate(with: emergencyContactName)
        }
    }
}
