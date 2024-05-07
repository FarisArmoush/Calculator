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
                .background(item.color, in: RoundedRectangle(cornerRadius: 32))
                .foregroundStyle(.white)
        })
    }
    func buttonWidth( ) -> CGFloat {
        if self.item == .zero {
            return ((UIScreen.main.bounds.width - (4 * 12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
    func onTap(_ button: CalculatorButtonType) {
        if self.value.count < 8
        {
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
    }
}


#Preview {
    CalculatorButton(item: .zero, value: .constant("1"))
}
