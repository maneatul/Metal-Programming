//
//  GlowingCircleView.swift
//  Shaders 101
//
//  Created by Atul Mane on 06/06/25.
//

import SwiftUI

struct GlowingCircleView: View {
    
    @State private var delta = 0.2
    @State private var intensity = 5.0
    
    var body: some View {
        VStack {
            Color.blue.ignoresSafeArea()
                .visualEffect { [ intensity, delta] content, proxy in
                        content
                        .colorEffect(
                            ShaderLibrary.glowingCircleShader(
                                .float2(proxy.size),
                                .float(delta),
                                .float(intensity)
                            )
                        )
                }
            
            VStack(alignment: .leading) {
                Text("Delta: \(delta.formatted())")
                Slider(value: $delta, in: 0...0.3)
            }
            VStack(alignment: .leading) {
                Text("Intensity: \(intensity.formatted())")
                Slider(value: $intensity, in: 0...20)
            }
        }
    }
}

#Preview {
    GlowingCircleView()
}
