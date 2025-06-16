//
//  PcurveView.swift
//  Shaders 101
//
//  Created by Atul Mane on 06/06/25.
//

import SwiftUI

struct PcurveView: View {
    
    @State private var a = 3.0
    @State private var b = 1.0
    
    var body: some View {
        VStack {
            MyImage()
                .visualEffect { [a, b] content, proxy in
                    content
                        .colorEffect(
                            ShaderLibrary.pCurveShader(
                                .float2(proxy.size),
                                .float(a),
                                .float(b)
                            )
                        )
                }
            Slider(value: $a,in: 0...20)
            Slider(value: $b,in: 0...20)
        }
    }
}

#Preview {
    PcurveView()
}
