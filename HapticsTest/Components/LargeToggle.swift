import SwiftUI

struct LargeToggle: View {
    let rigidFeedback = UIImpactFeedbackGenerator(style: .heavy)
    @Environment(\.colorScheme) var colorScheme
    @Binding var isOn: Bool
    @State var isHeld = false
    var label: String
    let onSymbol: Image
    let offSymbol: Image
    
    var body: some View {
        HStack{
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(colorScheme == .dark ? .black : .init(white: 0.9))
                VStack {
                    if isOn == false {
                        offSymbol
                            .padding(10)
                            .foregroundColor(.init(white: colorScheme == .dark ? 0.6 : 0.3))
                    }
                    Spacer()
                    if isOn == true {
                        onSymbol
                            .padding(10)
                            .foregroundColor(.init(white: colorScheme == .dark ? 0.6 : 0.3))
                    }
                }
                VStack {
                    if isOn == false {
                        Spacer()
                    }
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(colorScheme == .dark ? .init(white: 0.25) : .white)
                        .shadow(color: .init(hue: 0, saturation: 0, brightness: 0, opacity: 0.1), radius: 3)
                        .frame(height: isHeld ? 45 : 36)
                        //.frame(height: dragAnimation)
                        .animation(.default, value: isHeld)
                        .overlay {
                            Text(label)
                        }
                    if isOn == true {
                        Spacer()
                    }
                }
                .padding(6)
            }
            .animation(.spring(response: 0.2, dampingFraction: 1, blendDuration: 0.1), value: isOn)
            .onTapGesture {
                isOn.toggle()
                rigidFeedback.impactOccurred()
            }
            .gesture(DragGesture().onChanged({ drag in
                if drag.translation.height < -1 && isOn == false {
                    isOn.toggle()
                    rigidFeedback.impactOccurred()
                } else if drag.translation.height > 1 && isOn == true {
                    isOn.toggle()
                    rigidFeedback.impactOccurred()
                }
            }))
        }
        .frame(width: 80, height: 80)
    }
}
