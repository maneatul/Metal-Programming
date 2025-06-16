//
//  SwizzleView.swift
//  Shaders 101
//
//  Created by Atul Mane on 22/05/25.
//

import SwiftUI

struct ShaderItem: Identifiable {
    let id = UUID()
    let description: String
    let shader: Shader
}

struct SwizzleView: View {
    
    let shaders: [ShaderItem] = [
        .init(description: "", shader: ShaderLibrary.swizzle1()),
        .init(description: "", shader: ShaderLibrary.swizzle2()),
        .init(description: "", shader: ShaderLibrary.swizzle3()),
        .init(description: "", shader: ShaderLibrary.swizzle4()),
        .init(description: "", shader: ShaderLibrary.swizzle5()),
        .init(description: "", shader: ShaderLibrary.swizzle6()),
        .init(description: "", shader: ShaderLibrary.swizzle7())
    ]
    
    var body: some View {
        NavigationStack {
            Form {
                ForEach(shaders) { item in
                    Section(item.description) {
                        BeforeAfterView(shader: item.shader)
                    }
                }
            }
            .navigationTitle("Swizzling")
        }
    }
}

struct BeforeAfterView: View {
    
    let shader: Shader
    let dim: CGFloat
    
    init(shader: Shader, dim: CGFloat = 100.0) {
        self.shader = shader
        self.dim = dim
    }
    
    var body: some View {
      HStack {
          ColorsView(dim: dim)
          Spacer()
          Image(systemName: "arrowshape.right.fill")
              .imageScale(.large)
          Spacer()
          ColorsView(dim: dim)
              .colorEffect(shader)
        }
      .border(.black, width: 3)
      .background(Color.black.opacity(0.05))
    }
    
}

struct ColorsView: View {
    
    
    let colors: [Color] = [
        Color(red: 1, green: 0, blue: 0),
        Color(red: 0, green: 1, blue: 0),
        Color(red: 0, green: 0, blue: 1),
        Color(red: 1, green: 1, blue: 0),
        Color(red: 1, green: 0, blue: 1),
        Color(red: 0, green: 1, blue: 1)
    ]
    
    let dim: CGFloat
    var body: some View {
        VStack(spacing: 0) {
            ForEach(colors, id: \.self) { color in
                    Rectangle()
                    .fill(color)
                    .frame(width: dim, height: dim / CGFloat(colors.count))
            }
        }
    }
}

#Preview {
    SwizzleView()
}
