//
//  ContentView.swift
//  Calculator
//
//  Created by Faris Armoush on 07/05/2024.
//

import SwiftUI

struct CalculatorView: View {
    @State var value: String = "0"
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Spacer()
                CalculatorResult(value: $value)
                CalculatorButtonsGrid(value: $value)
            }
        }
    }
}

#Preview {
    CalculatorView()
}
