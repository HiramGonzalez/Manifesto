//
//  MainScreen.swift
//  Manifesto
//
//  Created by BPS.Dev01 on 7/10/23.
//

import SwiftUI

struct MainScreen: View {

    @StateObject private var viewModel = MainScreen.ViewModel()
    @State private var isWarningSignShowing = false
    @State private var messageAlert = ""
    @State private var deleteElementIndex: Int?
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                ZStack {
                    Image("homescreenWithBlackModeBackgroundMask")
                        .resizable()
                        .ignoresSafeArea()
                        .scaledToFill()
                    
                    VStack(alignment: .center) {
                        ZStack {
                            Image("topBackground")
                                .resizable()
                                .frame(width: geo.frame(in: .local).width, height: geo.frame(in: .local).height * 0.33)
                                .scaledToFill()
                            Image("group2")
                                .resizable()
                                .frame(width: 87, height: 61)
                                .scaledToFit()
                        }
                        
                        if viewModel.usersArray.isEmpty {
                            Spacer()
                            Text("No one has currently signed in.\nBe the first to sign.")
                                .frame(width: 311, height: 45)
                                .font(.custom("Montserrat-Medium", size: 18))
                                .multilineTextAlignment(.center)
                                .scaledToFit()
                                .foregroundColor(.white)
                                .position(x: geo.frame(in: .global).midX, y: geo.frame(in: .global).midY * 0.35)
                            Spacer()
                        } else {
                            HStack {
                                Text("Sign in at the registry.")
                                    .font(.custom("Montserrat-Medium", size: 18))
                                    .multilineTextAlignment(.leading)
                                    .scaledToFit()
                                    .foregroundColor(.white)
                                    .padding([.leading, .bottom])
                                Spacer()
                            }
                            ScrollView {
                                ForEach(viewModel.usersArray) { element in
                                    VStack {
                                        HStack {
                                            Text(element.name)
                                                .font(.custom("Montserrat-Medium", size: 24))
                                                .multilineTextAlignment(.center)
                                                .scaledToFit()
                                                .foregroundColor(.white)
                                            
                                            Spacer()
                                            NavigationLink {
                                                SignUp(id: element.id,
                                                       name: element.name,
                                                       phoneNumber: element.phoneNumber,
                                                       email: element.email,
                                                       emergencyNumber: element.emergencyNumber,
                                                       emergencyContactName: element.emergencyContactName)
                                            } label: {
                                                Image("editEdit")
                                            }
                                            .padding(.trailing)
                                            
                                            Button {
                                                messageAlert = "Continue to delete \(element.name)?"
                                                deleteElementIndex = viewModel.usersArray.firstIndex(of: element)!
                                                isWarningSignShowing = true
                                            } label: {
                                                Image("menuCloseBig")
                                            }
                                        }
                                        .padding([.horizontal, .vertical], 9)
                                        
                                        Image("lineCopy8")
                                            .resizable()
                                            .frame(width: geo.frame(in: .local).width * 0.9)
                                    }
                                    .alert(messageAlert, isPresented: $isWarningSignShowing) {
                                        Button("Deny", role: .cancel) { }
                                        Button("Allow", role: .destructive) {
                                            viewModel.deleteUser(at: deleteElementIndex!)
                                        }
                                    }
                                }
                            }
                            .frame(width: geo.frame(in: .local).width * 0.9, height: geo.frame(in: .local).height * 0.4)
                            
                        }

                        
                        NavigationLink {
                            SignUp()
                        } label: {
                            Image("buttonMain")
                                .resizable()
                                .frame(width: 183, height: 50)
                                .scaledToFit()
                        }
                        .buttonPosition(viewModel.usersArray.isEmpty, geo: geo)
                        Spacer()
                    }
                    .frame(maxWidth: geo.frame(in: .local).width, maxHeight: geo.size.height)
                } // VStack
                .frame(width: geo.frame(in: .global).width, height: geo.frame(in: .local).height)
                
            } // GeometryReader
            .onAppear {
                viewModel.loadUsers()
            }
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
