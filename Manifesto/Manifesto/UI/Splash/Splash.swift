//
//  Splash.swift
//  Manifesto
//
//  Created by BPS.Dev01 on 7/10/23.
//

import SwiftUI

struct Splash: View {
    var body: some View {
        ZStack {
            Image("onboardingScreen4BackgroundMask")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()

            VStack {
                Image("group2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 215, height: 176)
                Spacer()
                    .frame(height: 150)
            }
            
        }
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}
