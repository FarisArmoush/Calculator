//
//  CalculatorButtonsGrid.swift
//  Calculator
//
//  Created by Faris Armoush on 07/05/2024.
//

import SwiftUI

struct CalculatorButtonsGrid: View {
    @ObservedObject var viewModel: CalculatorViewModel
    private let buttons: [[CalculatorButtonType]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .increment],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        ForEach(buttons, id: \.self) { row in
            HStack {
                ForEach(row, id: \.self) { item in
                    CalculatorButton(item: item, viewModel: viewModel)
                }
            }
        }
    }
}

#Preview {
    CalculatorButtonsGrid(viewModel: CalculatorViewModel())
}
