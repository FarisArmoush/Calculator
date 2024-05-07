//
//  ContentView.swift
//  Calculator
//
//  Created by Faris Armoush on 07/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State var value: String = "0"
    
    private let buttons: [[CalculatorButtonType]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .mutliply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .increment],
        [.zero, .decimal, .equal]
    ]

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text(value)
                        .fixedSize()
                        .lineLimit(1)
                        .bold()
                        .font(.system(size: 96))
                        .foregroundStyle(.white)
                }.padding(.horizontal)
                Spacer()
                ForEach(buttons, id: \.self) { row in
                    HStack {
                        ForEach(row, id: \.self) { item in
                            Button(action: {self.onTapGesture(item)}, label: {
                                Text(item.rawValue)
                                    .font(.title)
                                    .frame(width: self.buttonWidth(item), height: 90)
                                    .background(item.buttonColor, in: RoundedRectangle(cornerRadius: 32))
                                    .foregroundStyle(.white)
                                    
                            })
                        }
                    }
                }
            }
        }
    }
    private func onTapGesture(_ button: CalculatorButtonType) {
        switch button {
        case .increment, .subtract, .divide, .mutliply, .equal:
            break
        case .clear:
            self.value = "0"
            break
        case .decimal, .negative, .percent:
            break
        default:
            let number = button.rawValue
            if self.value == "0" {
                value = button.rawValue
            } else {
                self.value = "\(self.value)\(number)"
            }
            break
        }
    }
         func buttonWidth(_ type: CalculatorButtonType ) -> CGFloat {
            if type == .zero {
                return ((UIScreen.main.bounds.width - (4 * 12)) / 4) * 2
            }
            return (UIScreen.main.bounds.width - (5 * 12)) / 4
        }

}

#Preview {
    ContentView()
}

enum CalculatorButtonType: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case increment = "+"
    case subtract = "-"
    case mutliply = "x"
    case divide = "/"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "-/+"
    
    var buttonColor: Color {
        switch self {
        case .divide, .mutliply, .subtract, .increment, .equal:
            return Color.orange
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .decimal:
            return .gray.opacity(0.3)
        case .clear, .negative, .percent:
            return .white.opacity(0.6)
        }
    }
}
