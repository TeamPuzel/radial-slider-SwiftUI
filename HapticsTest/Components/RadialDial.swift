//
//  Dial.swift
//  HapticsTest
//
//  Created by Wojciech David Wargocki on 12/09/2022.
//

import SwiftUI

struct RadialDial: View {
    @Environment(\.colorScheme) var colorScheme
    let rigidFeedback = UIImpactFeedbackGenerator(style: .rigid)
    let lightFeedback = UIImpactFeedbackGenerator(style: .light)
    @Binding var startRotation: Angle
    @Binding var endRotation: Angle
    
    var body: some View {
        ZStack {
            // Outer Circle
            Circle().stroke(style: .init(lineWidth: 45))
                .frame(width: 270)
                .foregroundStyle(Color(white: colorScheme == .dark ? 0 : 0.9).shadow(.inner(color: .init(white: 0, opacity: 0.05), radius: 5)))
            
            
            // Inner Circle
            Circle()
                .trim(from: startRotation.degrees / 360, to: endRotation.degrees / 360)
                .stroke(colorScheme == .dark ? Color.init(white: 0.25) : Color.white, style: .init(lineWidth: 35))
                .frame(width: 270)
            
            
            // Starting Handle
            Circle()
                .fill(colorScheme == .dark ? Color.init(white: 0.25) : Color.white)
                .frame(width: 35, height: 35)
                .overlay {
                    Image(systemName: "bed.double.fill")
                        .foregroundColor(.cyan)
                        .rotationEffect(Angle(degrees: 0) - startRotation - Angle(degrees: -90))
                }
                .offset(x: 135)
                .rotationEffect(startRotation)
                .gesture(DragGesture().onChanged({ drag in
                    let current = drag.location
                    let angle = atan2(current.y, current.x)
                    let fixedAngle = angle < 0.0 ? angle + 2.0 * .pi : angle
                    startRotation = Angle(radians: fixedAngle)
                }))
            
            
            // Ending Handle
            Circle()
                .fill(colorScheme == .dark ? Color.init(white: 0.25) : Color.white)
                .frame(width: 35, height: 35)
                .overlay {
                    Image(systemName: "alarm.fill")
                        .foregroundColor(.orange)
                        .rotationEffect(Angle(degrees: 0) - endRotation - Angle(degrees: -90))
                }
                .offset(x: 135)
                .rotationEffect(endRotation)
                .gesture(DragGesture().onChanged({ drag in
                    let current = drag.location
                    let angle = atan2(current.y, current.x)
                    let fixedAngle = angle < 0.0 ? angle + 2.0 * .pi : angle
                    endRotation = Angle(radians: fixedAngle)
                }))
            
            
        }
        .rotationEffect(Angle(degrees: -90))
        .animation(.interactiveSpring(response: 0.1, dampingFraction: 1, blendDuration: 0.05), value: endRotation)
        .animation(.interactiveSpring(response: 0.1, dampingFraction: 1, blendDuration: 0.05), value: startRotation)
    }
}
