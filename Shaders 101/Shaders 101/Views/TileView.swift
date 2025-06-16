//
//  TileView.swift
//  Shaders 101
//
//  Created by Atul Mane on 09/06/25.
//

import SwiftUI

struct TileView: View {
    
    @State private var cols = 2.0
    @State private var rows = 3.0
    var body: some View {
        VStack {
            PizzaView()
                .visualEffect { [rows, cols] content, proxy in
                    content
                        .distortionEffect(ShaderLibrary.tileShader(
                            .float2(proxy.size),
                            .float2(cols, rows)
                        ), maxSampleOffset: .zero)
                }
            
            Image(systemName: "figure.dance")
                .resizable()
                .frame(width: 200, height: 200)
                .scaledToFit()
                .visualEffect { [rows, cols] content, proxy in
                    content
                        .distortionEffect(ShaderLibrary.tileShader(
                            .float2(proxy.size),
                            .float2(cols, rows)
                        ), maxSampleOffset: .zero)
                }
            
            
            Slider(value: $cols, in: 1...15, step: 1)
            Slider(value: $rows, in: 1...15, step: 1)
        }
        .padding()
    }
}

#Preview {
    TileView()
}
