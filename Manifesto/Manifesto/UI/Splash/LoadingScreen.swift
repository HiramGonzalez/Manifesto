//
//  LoadingScreen.swift
//  Manifesto
//
//  Created by BPS.Dev01 on 7/14/23.
//

import SwiftUI

struct LoadingScreen: View {
    @State var isActive = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                MainScreen()
            } else {
                Splash()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct LoadingScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreen()
    }
}
