//
//  GrainyView.swift
//  Shaders 101
//
//  Created by Atul Mane on 06/06/25.
//

import SwiftUI

struct GrainyView<Content: View>: View {
    
    private let startDate = Date()
    
    let opacity: CGFloat
    let content: Content
    
    init(opacity: CGFloat, @ViewBuilder content: () -> Content) {
        self.opacity = opacity
        self.content = content()
    }
    
    var body: some View {
        TimelineView(.animation ) { _ in
        content
            .visualEffect { content, proxy in
                content
                    .colorEffect(
                        ShaderLibrary.noiseShader(
                            .float2(proxy.size),
                            .float(0)
//                            .float(startDate.timeIntervalSinceNow)
                        )
                    )
            }
            .overlay {
                content
                    .opacity(opacity)
            }
        }
    }
}

struct SciFiView: View {
    
    let color1: Color = Color(red: 42/255, green: 43/255, blue: 79/255)
    let color2: Color = Color(red: 35/255, green: 96/255, blue: 91/255)
    let color3: Color = Color(red: 131/255, green: 177/255, blue: 168/255)
    
    var colors: [Color] {
        [color1, color2, color3]
    }
    var body: some View {
       RoundedRectangle(cornerRadius: 20)
            .fill(LinearGradient(colors: colors, startPoint: .leading, endPoint: .trailing))
            .frame(width: 300, height: 200)
            .overlay(alignment: .bottomLeading) {
                VStack(alignment: .leading) {
                    Text("Sci-Fi")
                    Text("Films and Series")
                }
                .font(.largeTitle)
                .bold()
                .foregroundStyle(.white)
                .padding()
            }
    }
}
#Preview {
    GrainyView(opacity: 0.5) {
        SciFiView()
    }
}
