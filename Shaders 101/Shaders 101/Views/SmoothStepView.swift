//
//  SmoothStepView.swift
//  Shaders 101
//
//  Created by Atul Mane on 23/05/25.
//

import SwiftUI

struct SmoothStepView: View {
    
    @State private var stepStart = 0.1
    @State private var lineWidth = 0.04
    @State private var graphOpacity = 0.1
    @State private var backgroundOpacity = 0.1
    
    var body: some View {
        NavigationStack {
            VStack {
                TreeView()
                    .font(.largeTitle)
                    .visualEffect { [ stepStart, lineWidth, graphOpacity, backgroundOpacity] content, proxy in
                        content
                            .colorEffect(
                                ShaderLibrary.smoothStepShader(
                                    .float2(proxy.size),
                                    .float(stepStart),
                                    .float(lineWidth),
                                    .float(graphOpacity),
                                    .float(backgroundOpacity)
                                )
                            )
                    }
                Slider(value: $stepStart, in: 0...0.5)
                Slider(value: $lineWidth, in: 0.01...0.15)
                Slider(value: $graphOpacity, in: 0...1)
                Slider(value: $backgroundOpacity, in: 0...1)
            }
            .padding()
            .navigationTitle("Smooth Step")
        }
    }
}

#Preview {
    SmoothStepView()
}
