//
//  WeekButtonArray.swift
//  HapticsTest
//
//  Created by Wojciech David Wargocki on 12/09/2022.
//

import SwiftUI

struct WeekButtonArrayView: View {
    @Environment(\.colorScheme) var colorScheme
    let lightFeedback = UIImpactFeedbackGenerator(style: .light)
    @State var isMondayActive = true
    @State var isTuesdayActive = true
    @State var isWednesdayActive = true
    @State var isThursdayActive = true
    @State var isFridayActive = true
    @State var isSaturdayActive = false
    @State var isSundayActive = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(colorScheme == .dark ? .black : .init(white: 0.9))
            HStack {
                if isMondayActive {
                    Circle() .foregroundStyle(.blue.gradient)
                        .rotationEffect(Angle(degrees: 180))
                        .overlay { Text("M") .foregroundColor(.white) .font(.system(.body, design: .rounded, weight: .semibold)) }
                        .onTapGesture { isMondayActive.toggle(); lightFeedback.impactOccurred() }
                } else {
                    Circle() .foregroundStyle(Color.init(white: colorScheme == .dark ? 0.15 : 1 ))
                        .shadow(color: Color(white: 0, opacity: 0.2),radius: 5)
                        .overlay { Text("M") .foregroundColor(colorScheme == .dark ? .white : .black) .font(.system(.body, design: .rounded, weight: .semibold)) }
                        .onTapGesture { isMondayActive.toggle(); lightFeedback.impactOccurred() }
                }
                
                if isTuesdayActive {
                    Circle() .foregroundStyle(.blue.gradient)
                        .rotationEffect(Angle(degrees: 180))
                        .overlay { Text("T") .foregroundColor(.white) .font(.system(.body, design: .rounded, weight: .semibold)) }
                        .onTapGesture { isTuesdayActive.toggle(); lightFeedback.impactOccurred() }
                } else {
                    Circle() .foregroundStyle(Color.init(white: colorScheme == .dark ? 0.15 : 1 ))
                        .shadow(color: Color(white: 0, opacity: 0.2),radius: 5)
                        .overlay { Text("T") .foregroundColor(colorScheme == .dark ? .white : .black) .font(.system(.body, design: .rounded, weight: .semibold)) }
                        .onTapGesture { isTuesdayActive.toggle(); lightFeedback.impactOccurred() }
                }
                
                if isWednesdayActive {
                    Circle() .foregroundStyle(.blue.gradient)
                        .rotationEffect(Angle(degrees: 180))
                        .overlay { Text("W") .foregroundColor(.white) .font(.system(.body, design: .rounded, weight: .semibold)) }
                        .onTapGesture { isWednesdayActive.toggle(); lightFeedback.impactOccurred() }
                } else {
                    Circle() .foregroundStyle(Color.init(white: colorScheme == .dark ? 0.15 : 1 ))
                        .shadow(color: Color(white: 0, opacity: 0.2),radius: 5)
                        .overlay { Text("W") .foregroundColor(colorScheme == .dark ? .white : .black) .font(.system(.body, design: .rounded, weight: .semibold)) }
                        .onTapGesture { isWednesdayActive.toggle(); lightFeedback.impactOccurred() }
                }
                
                if isThursdayActive {
                    Circle() .foregroundStyle(.blue.gradient)
                        .rotationEffect(Angle(degrees: 180))
                        .overlay { Text("T") .foregroundColor(.white) .font(.system(.body, design: .rounded, weight: .semibold)) }
                        .onTapGesture { isThursdayActive.toggle(); lightFeedback.impactOccurred() }
                } else {
                    Circle() .foregroundStyle(Color.init(white: colorScheme == .dark ? 0.15 : 1 ))
                        .shadow(color: Color(white: 0, opacity: 0.2),radius: 5)
                        .overlay { Text("T") .foregroundColor(colorScheme == .dark ? .white : .black) .font(.system(.body, design: .rounded, weight: .semibold)) }
                        .onTapGesture { isThursdayActive.toggle(); lightFeedback.impactOccurred() }
                }
                
                if isFridayActive {
                    Circle() .foregroundStyle(.blue.gradient)
                        .rotationEffect(Angle(degrees: 180))
                        .overlay { Text("F") .foregroundColor(.white) .font(.system(.body, design: .rounded, weight: .semibold)) }
                        .onTapGesture { isFridayActive.toggle(); lightFeedback.impactOccurred() }
                } else {
                    Circle() .foregroundStyle(Color.init(white: colorScheme == .dark ? 0.15 : 1 ))
                        .shadow(color: Color(white: 0, opacity: 0.2),radius: 5)
                        .overlay { Text("F") .foregroundColor(colorScheme == .dark ? .white : .black) .font(.system(.body, design: .rounded, weight: .semibold)) }
                        .onTapGesture { isFridayActive.toggle(); lightFeedback.impactOccurred() }
                }
                
                if isSaturdayActive {
                    Circle() .foregroundStyle(.blue.gradient)
                        .rotationEffect(Angle(degrees: 180))
                        .overlay { Text("S") .foregroundColor(.white) .font(.system(.body, design: .rounded, weight: .semibold)) }
                        .onTapGesture { isSaturdayActive.toggle(); lightFeedback.impactOccurred() }
                } else {
                    Circle() .foregroundStyle(Color.init(white: colorScheme == .dark ? 0.15 : 1 ))
                        .shadow(color: Color(white: 0, opacity: 0.2),radius: 5)
                        .overlay { Text("S") .foregroundColor(colorScheme == .dark ? .white : .black) .font(.system(.body, design: .rounded, weight: .semibold)) }
                        .onTapGesture { isSaturdayActive.toggle(); lightFeedback.impactOccurred() }
                }
                
                if isSundayActive {
                    Circle() .foregroundStyle(.blue.gradient)
                        .rotationEffect(Angle(degrees: 180))
                        .overlay { Text("S") .foregroundColor(.white) .font(.system(.body, design: .rounded, weight: .semibold)) }
                        .onTapGesture { isSundayActive.toggle(); lightFeedback.impactOccurred() }
                } else {
                    Circle() .foregroundStyle(Color.init(white: colorScheme == .dark ? 0.15 : 1 ))
                        .shadow(color: Color(white: 0, opacity: 0.2),radius: 5)
                        .overlay { Text("S") .foregroundColor(colorScheme == .dark ? .white : .black) .font(.system(.body, design: .rounded, weight: .semibold)) }
                        .onTapGesture { isSundayActive.toggle(); lightFeedback.impactOccurred() }
                }
            } .padding(.horizontal, 10)
        }
        .frame(width: 315, height: 70)
        .animation(.interactiveSpring(), value: isMondayActive)
        .animation(.interactiveSpring(), value: isTuesdayActive)
        .animation(.interactiveSpring(), value: isWednesdayActive)
        .animation(.interactiveSpring(), value: isThursdayActive)
        .animation(.interactiveSpring(), value: isFridayActive)
        .animation(.interactiveSpring(), value: isSaturdayActive)
        .animation(.interactiveSpring(), value: isSundayActive)
    }
}
