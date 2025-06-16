//
//  HarmonicWaves.swift
//  Shaders 101
//
//  Created by Atul Mane on 25/05/25.
//

import SwiftUI

struct HarmonicWaves: View {

    @State private var scale: CGFloat = 1.0
    @State private var speedMultiplier: Double = 1.0
    @State private var amplitude: Float = 2.0
    @State private var wavesCount: Float = 5.0

    @State private var elapsedTime: Double = 0.0
    private let updateInterval: Double = 0.016

    var body: some View {
        VStack {
            TimelineView(.periodic(from: .now, by: updateInterval/speedMultiplier)) { context in
                ZStack {
                    Rectangle()
                        .colorEffect(
                            ShaderLibrary.default.harmonicColorEffect(
                                .boundingRect,
                                .float(wavesCount),
                                .float(elapsedTime),
                                .float(amplitude),
                                .float(1.0) // monochrome coefficient
                            )
                        )
                }
                .frame(height: 200)
                .frame(maxWidth: .infinity)
                .scaleEffect(scale)
                .onChange(of: context.date) { _, _ in
                    elapsedTime += updateInterval * speedMultiplier
                }
            }

            VStack(spacing: 16) {
                HStack {
                    Text("Speed:")
                    Slider(value: $speedMultiplier, in: 1.0...10.0)
                    Text("\(String(format: "%.1f", speedMultiplier))x")
                        .frame(width: 60, alignment: .leading)
                }
                HStack {
                    Text("Amplitude:")
                    Slider(value: $amplitude, in: 1.0...10.0)
                    Text("\(String(format: "%.1f", amplitude))")
                        .frame(width: 60, alignment: .leading)
                }
                HStack {
                    Text("Waves:")
                    Slider(value: $wavesCount, in: 1...6, step: 1.0)
                    Text("\(Int(wavesCount))")
                        .frame(width: 60, alignment: .leading)
                }
            }
            .padding()
            .foregroundColor(.white)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .onAppear {
            withAnimation(.spring(duration: 0.3)) {
                amplitude = 2.0
                speedMultiplier = 2.0
                scale = 0.95
            }
        }
    }
}

#Preview {
    HarmonicWaves()
}
