//
//  TextField-Modifier.swift
//  Manifesto
//
//  Created by BPS.Dev01 on 7/13/23.
//

import Foundation
import SwiftUI

extension View {
    func textFieldStyle(geo: GeometryProxy, strokeColor: Color) -> some View {
        self
            .frame(width: geo.frame(in: .local).width * 0.7, height: geo.frame(in: .local).width * 0.1)
            .padding(.all, 3)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(strokeColor, lineWidth: 1)
            )
    }
    
    func errorMessageStyle(geo: GeometryProxy) -> some View {
        self
            .frame(width: geo.frame(in: .local).width * 0.66)
            .multilineTextAlignment(.leading)
            .font(.custom("Montserrat-Medium", size: 14))
            .foregroundColor(Color(red: 0.753, green: 0.0, blue: 0.0))
            .fixedSize(horizontal: false, vertical: true)
    }
    
    @ViewBuilder func buttonPosition(_ condition: Bool, geo: GeometryProxy) -> some View {
        if condition {
            self.position(x: geo.frame(in: .global).midX, y: geo.frame(in: .local).height * 0.2)
        } else {
            self
        }
    }
}
