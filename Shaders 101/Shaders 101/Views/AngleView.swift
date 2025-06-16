//
//  AngleView.swift
//  Shaders 101
//
//  Created by Atul Mane on 09/06/25.
//

import SwiftUI

struct AngleView: View {
    @State private var angleRadian = 0.0
    @State private var force = 0.0
    
    let minForce = -300.0
    let maxForce = 300.0
    
    let maxAngle = 2 * Double.pi
    
    var angleDegrees: Double {
        angleRadian * 180 / Double.pi
    }
    
    let n = 8
    
    var body: some View {
        VStack {
            PizzaView()
                .visualEffect { [force, angleRadian ] content, proxy in
                    content
                        .distortionEffect(
                            ShaderLibrary.angleShader(
                                .float2(proxy.size),
                                .float(force),
                                .float(angleRadian)
                            )
                            , maxSampleOffset: .zero)
                }
            
            Slider(value: $force, in: minForce...maxForce)
            Slider(value: $angleRadian, in: 0...maxAngle)
            
            Button("Reset Force") {
                force = 0.0
            }
            .buttonStyle(.bordered)
            
            Text("\(angleDegrees.formatted()) degrees")
            
            HStack {
                ForEach(0..<n+1, id: \.self) { i in
                    Button("\(i)") {
                        let baseAngleRadian = 2 * Double.pi / Double(n)
                        angleRadian = Double(i) * baseAngleRadian
                    }
                    .buttonStyle(.bordered)
                }
            }
            
            // 30 degrees
            Button("30 Degrees") {
                angleRadian = (30 / 180) * Double.pi
            }
            .buttonStyle(.bordered)
            
            Image(systemName: "arrowshape.right.fill")
                .imageScale(.large)
                .rotationEffect(.radians(-angleRadian))
        }
    }
}

#Preview {
    AngleView()
}
