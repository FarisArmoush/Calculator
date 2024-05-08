//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Faris Armoush on 08/05/2024.
//

import Foundation

final class CalculatorViewModel: ObservableObject {
    @Published var value: String = "0"
    
    func onTap(_ button: CalculatorButtonType) {
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
