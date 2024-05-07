//
//  CalculatorResult.swift
//  Calculator
//
//  Created by Faris Armoush on 07/05/2024.
//

import SwiftUI

struct CalculatorResult: View {
    @Binding var value: String

    var body: some View {
        HStack {
            Spacer()
            Text(value)
                .lineLimit(1)
                .bold()
                .font(adaptiveFont)
                .foregroundStyle(.white)
                
        }.padding(.horizontal)
    }
    private var adaptiveFont: Font {
        let baseFontSize: CGFloat = 90
        let maxLength: Int = 10 // Adjust based on typical use
        let scaleFactor: CGFloat = max(1, CGFloat(value.count) / (CGFloat(maxLength) / 1.75))
        return .system(size: baseFontSize / scaleFactor)
    }
}

#Preview {
    CalculatorResult(value: .constant("1"))
}
