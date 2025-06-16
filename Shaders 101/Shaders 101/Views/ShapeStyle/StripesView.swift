//
//  StripesView.swift
//  Shaders 101
//
//  Created by Atul Mane on 09/06/25.
//

import SwiftUI

struct StripesView: View {
    
    @State private var stripeWidth: CGFloat = 15.0
    
    var shader: Shader {
        ShaderLibrary.stripesShader(
            .float(stripeWidth),
        )
    }
    
    var shaderFill: Shader {
        ShaderLibrary.stripesFillShader(
            .float(stripeWidth),
        )
    }
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(shaderFill)
            
            Text("Hello, World!")
                .font(.largeTitle)
                .padding()
                .border(shaderFill, width: 5)
            
            Circle()
                .frame(width: 50, height: 50)
                .foregroundStyle(shaderFill)
                .padding()
                .background(Color.black)
                .clipShape(Circle())
            
            TreeView()
                .colorEffect(shader)
            
            Slider(value: $stripeWidth, in: 0...200)
            Slider(value: $stripeWidth, in: 0...2000)
        }
        .padding()
    }
}

#Preview {
    StripesView()
}
