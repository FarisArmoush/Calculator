//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Faris Armoush on 07/05/2024.
//

import SwiftUI

struct CalculatorButton: View {
    let item: CalculatorButtonType
    @Binding var value: String
    
    var body: some View {
        Button(action: {self.onTap(item)}, label: {
            Text(item.rawValue)
                .font(.title)
                .frame(width: self.buttonWidth(), height: 90)
                .background(item.color, in: RoundedRectangle(cornerRadius: 16))
                .foregroundStyle(.white)
        })
    }
    private func buttonWidth( ) -> CGFloat {
        if self.item == .zero {
            return ((UIScreen.main.bounds.width - (4 * 12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    private func onTap(_ button: CalculatorButtonType) {
        switch button {
        case .increment, .subtract, .divide, .mutliply, .equal:
            break

        case .clear:
            self.value = "0"
            break

        case .decimal, .negative, .percent:
            break

        default:
            let canAddNumber: Bool = self.value.count < 9
            if canAddNumber {
                let number = button.rawValue
                if self.value == "0" {
                    value = button.rawValue
                } else {
                    self.value = "\(self.value)\(number)"
                }
            }
            break
        }
    }
}


#Preview {
    CalculatorButton(item: .zero, value: .constant("1"))
}
