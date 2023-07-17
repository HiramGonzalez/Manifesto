//
//  SingUp.swift
//  Manifesto
//
//  Created by BPS.Dev01 on 7/10/23.
//

import SwiftUI

struct SignUp: View {
    @ObservedObject var keyboardHeightHelper = KeyboardHeightHelper()
    @StateObject private var viewModel = SignUp.ViewModel()
    @Environment(\.dismiss) var dismiss
    
    var id: UUID?
    @State var name: String = ""
    @State var phoneNumber: String = ""
    @State var email: String = ""
    @State var emergencyNumber: String = ""
    @State var emergencyContactName: String = ""
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                GeometryReader { ingeo in
                    Image("background")
                        .resizable()
                        .frame(width: geo.frame(in: .global).width, height: UIScreen.main.bounds.height)
                        .scaledToFit()
                        .ignoresSafeArea()
                    
                    
                    VStack() {
                        
                        Image("group2")
                            .resizable()
                            .frame(width: geo.frame(in: .global).height * 0.101, height: geo.frame(in: .global).height * 0.07)
                            .aspectRatio(contentMode: .fit)
                        
                        ScrollView {
                                GeometryReader { zGeo in
                                    ZStack {
                                        Image("whiteBackground")
                                            .resizable()
                                            .frame(width: ingeo.frame(in: .global).width * 0.85, height: zGeo.frame(in: .local).height)
                                        
                                        
                                        VStack(spacing: ingeo.frame(in: .local).height / 20) {
                                            Spacer(minLength: 20)
                                            VStack(spacing: 5) {
                                                TextField("Full Name", text: $name)
                                                    .textFieldStyle(geo: geo, strokeColor:  viewModel.isNameInvalid ? Color(red: 0.753, green: 0.0, blue: 0.0) : .black)
                                                
                                                if viewModel.isNameInvalid {
                                                    Text("Must be 2-12 characters long and have no special characters.")
                                                        .errorMessageStyle(geo: zGeo)
                                                    
                                                        
                                                }
                                            }
                                            
                                            VStack(spacing: 5) {
                                                TextField("Phone Number", text: $phoneNumber)
                                                    .textFieldStyle(geo: geo, strokeColor:  viewModel.isPhoneNumberInvalid ? Color(red: 0.753, green: 0.0, blue: 0.0) : .black)
                                                    .keyboardType(.numberPad)
                                                
                                                if viewModel.isPhoneNumberInvalid {
                                                    Text("Must enter 10 digit number.")
                                                        .errorMessageStyle(geo: zGeo)
                                                }
                                            }
                                            
                                            
                                            VStack(spacing: 5) {
                                                TextField("Email", text: $email)
                                                    .textFieldStyle(geo: geo, strokeColor:  viewModel.isEmailInvalid ? Color(red: 0.753, green: 0.0, blue: 0.0) : .black)
                                                    .keyboardType(.emailAddress)
                                                
                                                if viewModel.isEmailInvalid {
                                                    Text("We do not recognize that as an email. Try again.")
                                                        .errorMessageStyle(geo: zGeo)
                                                }
                                            }
                                            
                                            
                                            VStack(spacing: 5) {
                                                TextField("Emergency Contact Number", text: $emergencyNumber)
                                                    .textFieldStyle(geo: geo, strokeColor:  viewModel.isEmergencyNumberInvalid ? Color(red: 0.753, green: 0.0, blue: 0.0) : .black)
                                                    .keyboardType(.numberPad)
                                                
                                                if viewModel.isEmergencyNumberInvalid {
                                                    Text("Must enter 10 digit number.")
                                                        .errorMessageStyle(geo: zGeo)
                                                }
                                            }
                                            
                                            
                                            VStack(spacing: 5) {
                                                TextField("Emergency Contact Name", text: $emergencyContactName)
                                                    .textFieldStyle(geo: geo, strokeColor:  viewModel.isEmergencyContactNameInvalid ? Color(red: 0.753, green: 0.0, blue: 0.0) : .black)
                                                
                                                if viewModel.isEmergencyContactNameInvalid {
                                                    Text("Must be 2-12 characters long and have no special characters.")
                                                        .errorMessageStyle(geo: zGeo)
                                                }
                                            }
                                            
                                            Button {
                                                viewModel.signUser(id: id ?? UUID() , name: name, phoneNumber: phoneNumber, email: email, emergencyNumber: emergencyNumber, emergencyContactName: emergencyContactName)
                                                if viewModel.isFormValid { dismiss() }
                                            } label: {
                                                Image("saveAndSignButton")
                                                    .resizable()
                                                    .frame(width: 183, height: 50)
                                                    .scaledToFit()
                                            }
                                            Spacer(minLength: 20)
                                        } // VStack
                                        .frame(height: zGeo.frame(in: .local).height * 0.8)
                                        .position(x: zGeo.frame(in: .local).midX, y: zGeo.frame(in: .local).midY)
                                        
                                    } // ZStack
                                    .frame(height: zGeo.frame(in: .local).height)
                                    .position(x: zGeo.frame(in: .local).midX, y: zGeo.frame(in: .local).midY)
                                    
                                } // Geometry
                                .frame(height: viewModel.isFormValid ? ingeo.frame(in: .local).height * 0.8 : geo.size.height > 700.0 ? ingeo.frame(in: .local).height : ingeo.frame(in: .local).height + 100)
                                //.frame(height: viewModel.isFormValid ? ingeo.frame(in: .local).height * 0.8 : ingeo.frame(in: .local).height + 100)
                                
                            
                            Spacer()
                            
                            Image("hotels")
                                .resizable()
                                .scaledToFill()
                                .frame(width: geo.frame(in: .local).width, height: geo.frame(in: .global).height * 0.12)
                            
                        } // Scroll
                        .padding(.bottom, self.keyboardHeightHelper.keyboardHeight > 0 ? self.keyboardHeightHelper.keyboardHeight - 33 : 0)
                        //.frame(maxHeight: .infinity)
                        
                    } // VStack
                    .frame(maxHeight: ingeo.frame(in: .local).height)
                    .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    
                }
                .frame(maxHeight: geo.frame(in: .local).height)
            }
            
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct SingUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
