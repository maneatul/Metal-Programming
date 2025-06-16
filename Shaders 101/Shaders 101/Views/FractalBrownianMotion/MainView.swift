//
//  MainView.swift
//  Shaders 101
//
//  Created by Atul Mane on 10/06/25.
//

import SwiftUI

struct MainView: View {
    
    @State private var showExplanation: Bool = false
    
    var text: String {
        showExplanation ? "Hide explanation" : "Press Me"
    }
    
    var textOpacity: Double {
        showExplanation ? 1.0 : 0.0
    }
    
    var imageOpacity: Double {
        showExplanation ? 0.5 : 0.85
    }
    
    let fbmExplanation: String = """
        In probability theory, fractional Brownian motion, also called a fractal Brownian motion, is a generalization of Brownian motion. Unlike classical Brownian motion, the increments of fBm need not be independent.
        """
    
    var body: some View {
        ZStack {
            Color.gray
                .opacity(0.2)
                .ignoresSafeArea()
            
            VStack {
                Text("[Fractal Brownian Motion](https://thebookofshaders.com/13/)")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                
                Image("cloud")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .opacity(imageOpacity)
                    .overlay {
                        Text(fbmExplanation)
                            .font(.title)
                            .opacity(textOpacity)
                            .padding()
                            .minimumScaleFactor(0.5)
                    }
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        showExplanation.toggle()
                    }
                }, label:   {
                   FBMButtonView(text: text)
                })
            }
            .padding()
        }
    }
}


struct FBMButtonView: View {
    
    let text: String
    let enabled: Bool
    
    let timeOffset: Double
    
    @State private var isPressed: Bool = false
    @State private var startDate = Date()
    
    init(text: String, enabled: Bool = true, timeOffset: Double = 100.0) {
        self.text = text
        self.enabled = enabled
        self.timeOffset = timeOffset
        self.isPressed = isPressed
        self.startDate = startDate
    }
    
    var mainText: some View {
        Text(text)
            .foregroundStyle(.white)
            .font(.title)
            .frame(maxWidth: .infinity)
            .bold()
            .padding()
            .background(.black)
            .clipShape(Capsule())
    }
    
    var body: some View {
        ZStack {
            TimelineView(.animation) { context in
                mainText
                    .fbmShader(time: context.date.timeIntervalSince1970 - startDate.timeIntervalSince1970 + timeOffset, enable: enabled)
            }
        }
        .clipShape(Capsule())
       
    }
}

extension View {
    func fbmShader(time: Double, enable: Bool) -> some View {
        self
            .colorEffect(
                ShaderLibrary
                    .fbmShader(
                        .boundingRect,
                        .float(time),
                        
                    ),
                isEnabled: enable
            )
    }
}
#Preview {
    FBMButtonView(text: "Press Me")
        .padding()
}
#Preview {
    MainView()
}
