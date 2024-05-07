//
//  CalculatorButtonType.swift
//  Calculator
//
//  Created by Faris Armoush on 07/05/2024.
//

import SwiftUI

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
}

extension CalculatorButtonType {
    var color: Color {
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
