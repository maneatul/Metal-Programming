//
//  ObjMesh.swift
//  MetalObject
//
//  Created by Atul Mane on 25/04/25.
//

import MetalKit

class ObjMesh {
    
    let modelIOMesh: MDLMesh
    let metalMesh: MTKMesh
    
    init(metalDevice: MTLDevice, allocator: MTKMeshBufferAllocator, filename: String) {
        
        guard let meshURL = Bundle.main.url(forResource: filename, withExtension: "obj") else {
            fatalError()
        }
        let vertextDescriptor = MTLVertexDescriptor()
        
        var offset: Int = 0
        
        vertextDescriptor.attributes[0].format = .float3
        vertextDescriptor.attributes[0].offset = offset
        vertextDescriptor.attributes[0].bufferIndex = 0
       
        offset += MemoryLayout<SIMD3<Float>>.stride
        
        vertextDescriptor.layouts[0].stride = offset
        
        let meshDescriptor = MTKModelIOVertexDescriptorFromMetal(vertextDescriptor)
        
        (meshDescriptor.attributes[0] as! MDLVertexAttribute).name = MDLVertexAttributePosition
        
        let asset = MDLAsset(url: meshURL, vertexDescriptor: meshDescriptor, bufferAllocator: allocator)
        
        modelIOMesh = asset.childObjects(of: MDLMesh.self).first as! MDLMesh
        
        do {
            metalMesh = try MTKMesh(mesh: modelIOMesh, device: metalDevice)
            
        }
        catch {
            fatalError()
        }
    }
}
