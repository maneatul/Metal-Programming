//
//  AngleShader.metal
//  Shaders 101
//
//  Created by Atul Mane on 09/06/25.
//

#include <metal_stdlib>
using namespace metal;


//Distortion Effect Snippet
//[[ stitchable ]] float2 name(float2 position, args...)
[[ stitchable ]] float2 angleShader(float2 position, float2 size, float force, float angle) {
    
    float2 displacement = force * float2(cos(angle), sin(angle));
    float2 result = position - displacement;
    
    return result;
}
