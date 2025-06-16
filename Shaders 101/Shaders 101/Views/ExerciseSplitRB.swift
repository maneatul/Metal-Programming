//
//  ExerciseSplitRB.swift
//  Shaders 101
//
//  Created by Atul Mane on 06/06/25.
//

import SwiftUI

struct ExerciseSplitRB: View {
    
    @State private var percent: Float = 0.5
    var body: some View {
        VStack {
            TreeView()
                .visualEffect { [percent] content, proxy in
                        content
                        .colorEffect(
                            ShaderLibrary.splitRBShader(
                                .float2(proxy.size),
                                .float(percent)
                            )
                        )
                }
            Slider(value: $percent)
        }
        .padding()
    }
}

#Preview {
    ExerciseSplitRB()
}
