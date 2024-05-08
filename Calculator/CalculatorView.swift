//
//  ContentView.swift
//  Calculator
//
//  Created by Faris Armoush on 07/05/2024.
//

import SwiftUI

struct CalculatorView: View {
    
    @ObservedObject var viewModel = CalculatorViewModel()
    var body: some View {
        ZStack {
            Color.black.opacity(0.925).ignoresSafeArea()
            VStack {
                Spacer()
                CalculatorResult(viewModel: viewModel)
                CalculatorButtonsGrid(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    CalculatorView()
}
