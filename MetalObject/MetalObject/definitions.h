//
//  definitions.h
//  MetalObject
//
//  Created by Atul Mane on 25/04/25.
//

#ifndef definition_h
#define definition_h

#include <simd/simd.h>

struct Vertex {
    vector_float3 position;
    vector_float4 color;
};

struct CameraParameters {
    matrix_float4x4 view;
    matrix_float4x4 projection;
};

#endif /* definition_h */


