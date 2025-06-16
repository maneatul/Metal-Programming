//
//  InspirationalShaderView.swift
//  Shaders 101
//
//  Created by Atul Mane on 09/06/25.
//

import SwiftUI

struct InspirationalShaderView: View {
    
    private let startDate = Date()
    
    @State private var speed = CGPoint(x: 2.0, y: 9.0)
    @State private var complexityFactor = 1.0
    
    @State private var fullScreen = true
    @State private var hideSliders = false
    
    var body: some View {
        
        NavigationStack {
            VStack {
                TimelineView(.animation) { _ in
                        ZStack {
                                if fullScreen {
                                        Color.black
                                                .ignoresSafeArea()
                                    } else {
                                            PizzaView()
                                                .padding()
                                        }
                            }
                        .visualEffect { [speed, complexityFactor] content, proxy in
                            content
                                .colorEffect(
                                    ShaderLibrary.inspirationalShader(
                                        .float2(proxy.size),
                                        .float(startDate.timeIntervalSinceNow),
                                        .float2(speed),
                                        .float(complexityFactor)
                                    )
                                )
                        }
                }
                
                if !hideSliders {
                    VStack(alignment: .leading) {
                        Text("First Speed Factor : \(speed.x.formatted())")
                        Slider(value: $speed.x, in: -20...20)
                    }
                    .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Second Speed Factor : \(speed.y.formatted())")
                        Slider(value: $speed.y, in: -20...20)
                    }
                    .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Complexity Factor : \(complexityFactor.formatted())")
                        Slider(value: $complexityFactor, in: 0.05...1.0)
                    }
                    .padding()
                    
                   
                }
            }
            .toolbar {
                Button("Toggle Sliders", systemImage: hideSliders ? "eye" : "eye.slash") {
                    hideSliders.toggle()
                }
            }
                .onTapGesture {
                        fullScreen.toggle()
                    }
        }
    }
}

#Preview {
    InspirationalShaderView()
}
