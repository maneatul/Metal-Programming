//
//  TimeVaryingView.swift
//  Shaders 101
//
//  Created by Atul Mane on 17/05/25.
//

import SwiftUI

struct TimeVaryingView: View {
    
    private let startDate = Date()
    
    @State private var minRadius = 0.0
    @State private var maxRadius = 100.0
    
    var body: some View {
        ZStack {
            TimelineView(.animation) { _ in
                Color.white
                    .ignoresSafeArea()
                    .visualEffect { [minRadius, maxRadius] content, proxy in
                        content
                            .colorEffect(
                                ShaderLibrary.coolCenterShader(
                                    .float2(proxy.size),
                                    .float(startDate.timeIntervalSinceNow),
                                    .float(minRadius),
                                    .float(maxRadius)
                                )
                            )
                    }
            }
            
            VStack {
                Spacer()
                Slider(value: $minRadius, in: 0...50)
                Slider(value: $maxRadius, in: 60...100)
            }
            .padding()
        }
    }
}

#Preview {
    TimeVaryingView()
}
