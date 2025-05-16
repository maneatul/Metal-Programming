//
//  SimpleComponent.swift
//  MetalObject
//
//  Created by Atul Mane on 25/04/25.
//


import Foundation

class SimpleComponent {
    
    var position: simd_float3
    var eulers: simd_float3
    
    init(position: simd_float3, eulers: simd_float3) {
        
        self.position = position
        self.eulers = eulers
    }
}
