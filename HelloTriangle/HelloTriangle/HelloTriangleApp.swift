//
//  HelloTriangleApp.swift
//  HelloTriangle
//
//  Created by Atul Mane on 15/04/25.
//

import SwiftUI
import Metal
@main
struct HelloTriangleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(width: 800, height: 800)
//                .onAppear(){
//                    helloMetal()
//                }
        }
    }
    
    func helloMetal(){
        let device = MTLCreateSystemDefaultDevice()!

        let buffer = device.makeBuffer(length: 16, options: [])
        
        print("Buffer is \(buffer?.length) bytes in length")

       let points = buffer?.contents().bindMemory(to: SIMD2<Float>.self, capacity: 2)
        
        points?[0] = SIMD2<Float>(10, 10)
        points?[1] = SIMD2<Float>(100, 100)
        
        print("MTL device: \(device.name)")
        let p1 = points?[1]
        print("p1 is \(p1)")
    }
}
