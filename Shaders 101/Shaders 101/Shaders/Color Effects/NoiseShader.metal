//
//  NoiseShader.metal
//  Shaders 101
//
//  Created by Atul Mane on 06/06/25.
//

#include <metal_stdlib>
using namespace metal;

// Random from the book of shaders
float random(float2 uv) {
    
    return fract(sin(dot(uv, float2(12.9898, 78.233)*43758.5453123)));
}

// Color Effect snippet with Size and Time parameter
[[ stitchable ]] half4 noiseShader(float2 position, half4 color, float2 size, float time) {
    
    float2 uv = position / size;
    float value = random(uv + time);
    
    half4 result = half4(half3(value), 1) * color;
    
    return result;
}

