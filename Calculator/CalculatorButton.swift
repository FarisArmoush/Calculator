//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Faris Armoush on 07/05/2024.
//

import SwiftUI

struct CalculatorButton: View {
    let item: CalculatorButtonType
    let viewModel: CalculatorViewModel
    
    var body: some View {
        Button(action: {self.viewModel.onTap(item)}, label: {
            Text(item.rawValue)
                .font(.title)
                .frame(width: self.buttonWidth(), height: 90)
                .background(item.color, in: RoundedRectangle(cornerRadius: 16))
                .foregroundStyle(.white)
        })
    }
    private func buttonWidth() -> CGFloat {
        if self.item == .zero {
            return ((UIScreen.main.bounds.width - (4 * 12)) / 4) * 2
        }
        return (UIScreen.main.bounds.width - (5 * 12)) / 4
    }
}


#Preview {
    CalculatorButton(item: .zero, viewModel: CalculatorViewModel())
}
