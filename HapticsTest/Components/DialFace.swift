//
//  DialFace.swift
//  HapticsTest
//
//  Created by Wojciech David Wargocki on 12/09/2022.
//

import SwiftUI

struct DialFace: View {
    let numSmallNotches = 96
    let numLargeNotches = 24
    let numDigits = [24, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22]
    
    var body: some View {
        ZStack {
            ForEach((0..<numSmallNotches).indices, id: \.self) { index in
                RoundedRectangle(cornerRadius: .infinity)
                    .frame(width: 2, height: 3)
                    .offset(y: -106)
                    .rotationEffect(Angle(degrees: Double(0.0 + 3.75 * Double(index))))
                    //.foregroundColor(.red)
            }
            ForEach((0..<numLargeNotches).indices, id: \.self) { index in
                RoundedRectangle(cornerRadius: .infinity)
                    .frame(width: 2, height: 8)
                    .offset(y: -104)
                    .rotationEffect(Angle(degrees: Double(0 + 15 * index)))
            }
            ForEach(numDigits.indices, id: \.self) { index in
                Text(String(numDigits[index]))
                    .rotationEffect(Angle(degrees: Double(0 - 30 * index)))
                    .offset(y: -85)
                    .rotationEffect(Angle(degrees: Double(0 + 30 * index)))
                    .opacity(numDigits[index] % 6 != 0 ? 0.6 : 1)
            }
        }
    }
}
