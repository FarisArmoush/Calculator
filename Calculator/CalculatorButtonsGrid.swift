//
//  CalculatorButtonsGrid.swift
//  Calculator
//
//  Created by Faris Armoush on 07/05/2024.
//

import SwiftUI

struct CalculatorButtonsGrid: View {
    @Binding var value: String
    private let buttons: [[CalculatorButtonType]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .mutliply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .increment],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        ForEach(buttons, id: \.self) { row in
            HStack {
                ForEach(row, id: \.self) { item in
                    CalculatorButton(item: item, value: $value)
                }
            }
        }
    }
}

#Preview {
    CalculatorButtonsGrid(value: .constant("1"))
}
