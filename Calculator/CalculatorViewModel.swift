//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Faris Armoush on 08/05/2024.
//

import Foundation

final class CalculatorViewModel: ObservableObject {
    @Published var value: String = "0"
    @Published var runningNumber: Int = 0
    @Published var currentOperation: CalculatorOperation = .none
    
    private func onOperation(_ type: CalculatorButtonType) {
        if type == .increment {
            self.currentOperation = .increment
            self.runningNumber = Int(self.value) ?? 0
        }
        else if type == .subtract {
            self.currentOperation = .subtract
            self.runningNumber = Int(self.value) ?? 0
        }
        else if type == .divide {
            self.currentOperation = .divide
            self.runningNumber = Int(self.value) ?? 0
        }
        else if type == .multiply {
            self.currentOperation = .multiply
            self.runningNumber = Int(self.value) ?? 0
        }
        else if type == .equal {
            let runningValue = self.runningNumber
            let currentValue = Int(self.value) ?? 0
            switch self.currentOperation {
            case .increment:
                self.value = "\(runningValue + currentValue)"
            case .subtract:
                self.value = "\(runningValue - currentValue)"
            case .multiply:
                self.value = "\(runningValue * currentValue)"
            case .divide:
                if(currentValue == 0 || runningValue == 0) { return }
                self.value = "\(runningValue / currentValue)"
            case .none:
                break
            
                
            }
        }
        if type != .equal {
            self.value = "0"
        }
    }
    
    private func onNumber(_ type: CalculatorButtonType) {
        let canAddNumber: Bool = self.value.count < 9
        if canAddNumber {
            let number = type.rawValue
            if self.value == "0" {
                value = type.rawValue
            } else {
                self.value = "\(self.value)\(number)"
            }
        }
    }
    
    func onTap(_ type: CalculatorButtonType) {
        switch type {
        case .increment, .subtract, .divide, .multiply, .equal:
            onOperation(type)
            break
            
        case .clear:
            self.value = "0"
            break
            
        case .decimal, .negative, .percent:
            break
            
        default:
            onNumber(type)
            break
        }
    }
}
