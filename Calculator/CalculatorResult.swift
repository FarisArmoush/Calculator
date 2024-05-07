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
                .fixedSize()
                .lineLimit(1)
                .bold()
                .font(.system(size: 96))
                .foregroundStyle(.white)
        }.padding(.horizontal)
    }
}

#Preview {
    CalculatorResult(value: .constant("1"))
}
