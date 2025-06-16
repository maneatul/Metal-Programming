//
//  OpacityZeroCircle.swift
//  Shaders 101
//
//  Created by Atul Mane on 17/05/25.
//

import SwiftUI

struct OpacityZeroCircle: View {
    
    @State private var touch: CGPoint = .zero
    @State private var amount = 1.0

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    OpacityCircleView(touch: $touch, amount: amount)
                    OpacityCircleView(touch: $touch, amount: 1-amount)
                }
                Slider(value: $amount, in: 0...1)
            }
        }
    }
}

struct OpacityCircleView: View {
    
    @Binding var touch: CGPoint
    let amount: Double
    
    var body: some View {
        Image(.tree)
            .resizable()
            .frame(height: 300)
            .scaledToFill()
            .visualEffect { [touch] content, proxy in
                content
                    .colorEffect(ShaderLibrary.opacityZeroCircle(
                        .float2(touch),
                        .float(60),
                        .float3(0.5, 0.3, 1),
                        .float(amount)
                    ))
            }
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged {
                        touch = $0.location
                    }
            )
    }
}

#Preview {
    OpacityZeroCircle()
}
