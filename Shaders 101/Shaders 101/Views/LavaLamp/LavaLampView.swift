//
//  LavaLampView.swift
//  Shaders 101
//
//  Created by Atul Mane on 10/06/25.
//

import SwiftUI

struct LavaLampView: View {
    
    private let startDate = Date()
    
    @State private var threshold = 0.3
    @State private var distanceFactor = 10.0
    
    @State private var hide = false
    
    var body: some View {
        ZStack {
            TimelineView(.animation) { _ in
                Color.black.ignoresSafeArea()
                    .visualEffect { [threshold, distanceFactor] content, proxy in
                        content
                            .colorEffect(
                                ShaderLibrary.lavalampShader(
                                    .float2(proxy.size),
                                    .float(startDate.timeIntervalSinceNow),
                                    .float(threshold),
                                    .float(distanceFactor)
                                )
                            )
                    }
            }
            if !hide {
                VStack {
                    Spacer()
                    VStack {
                        VStack(alignment: .leading) {
                            Text("Threshold: \(threshold)")
                            Slider(value: $threshold, in: 0...3)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Distance Factor:s \(distanceFactor)")
                            Slider(value: $distanceFactor, in: 1...20)
                        }
                    }
                    .padding(.horizontal)
                    .background(.white.opacity(0.85))
                }
            }
            
        }
        .onTapGesture {
            hide.toggle()
        }
    }
}

#Preview {
    LavaLampView()
}
