//
//  HapticsTestApp.swift
//  HapticsTest
//
//  Created by Wojciech David Wargocki on 11/09/2022.
//

import SwiftUI

@main
struct HapticsTestApp: App {
    var body: some Scene {
        WindowGroup {
            CoreView()
        }
    }
}

struct CoreView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var isOn = true
    @State var startRotation: Angle = Angle(degrees: 0)
    @State var endRotation: Angle = Angle(degrees: 180)
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .padding(.top, 5)
                .ignoresSafeArea(edges: .bottom)
                .foregroundColor(.init(white: colorScheme == .dark ? 0.1 : 1))
            VStack {
                HStack {
                    Text("Cancel") .fontWeight(.semibold)
                    Spacer()
                    Text("Add") .fontWeight(.semibold)
                }
                .frame(width: 315)
                .foregroundColor(.blue)
                .padding(.top, 25)
                .padding(.bottom, 5)
                HStack {
                    Text("Sleep Schedule")
                        .font(.system(.title, design: .default, weight: .bold))
                        //.font(.title)
                        //.fontWeight(.bold)
                    Spacer()
                }
                .frame(width: 315)
                .padding(.top, 20)
                WeekButtonArrayView()
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("BEDTIME") .foregroundColor(.cyan)
                            .font(.system(.subheadline, design: .rounded, weight: .semibold))
                        Text("22:00") .font(.headline)
                    }
                    Spacer()
                    VStack {
                        Text("WAKE UP") .foregroundColor(.orange)
                            .font(.system(.subheadline, design: .rounded, weight: .semibold))
                        Text("07:30") .font(.headline)
                    }
                    Spacer()
                } .padding(.bottom, 20)
                Spacer()
                ZStack {
                    DialFace()
                    LargeToggle(isOn: $isOn, label: "Alarm", onSymbol: Image(systemName: "bell"), offSymbol: Image(systemName: "bell.slash"))
                    RadialDial(startRotation: $startRotation, endRotation: $endRotation)
                }
                VStack {
                    Text("9 hours and 30 minutes")
                        .multilineTextAlignment(.center)
                        .font(.headline)
                    Text("This schedule meets your sleep goal.")
                        .multilineTextAlignment(.center)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(40)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CoreView()
    }
}
