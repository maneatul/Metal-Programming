//
//  ContentView.swift
//  Shaders 101
//
//  Created by Atul Mane on 16/05/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var amplitude = 2.0
    var body: some View {
        VStack {
            Text("Hello, Metal Shaders!")
                .font(.largeTitle)
                .colorEffect(ShaderLibrary.name1())
            
            Text("Hello, Metal Shaders!")
                .font(.largeTitle)
                .distortionEffect(ShaderLibrary.name2(), maxSampleOffset: .zero)
            
            Text("Hello, Metal Shaders!")
                .font(.largeTitle)
                .layerEffect(ShaderLibrary.name3(), maxSampleOffset: .zero)
            
            Text("Hello, Distortion Effect")
                .font(.largeTitle)
                .distortionEffect(ShaderLibrary.signShader(.float(amplitude)), maxSampleOffset: .zero)
            
            Slider(value: $amplitude, in: -5...5)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


