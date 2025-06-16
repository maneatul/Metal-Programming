//
//  GlowingCircleShader.metal
//  Shaders 101
//
//  Created by Atul Mane on 08/06/25.
//

#include <metal_stdlib>
using namespace metal;



// Color Effect Snippets with size parameter
//[[ stitchable ]] half4 name(float2 position, half4 color, args...)

[[ stitchable ]] half4 glowingCircleShader(float2 position, half4 color, float2 size, float delta, float intensity) {
    
    float2 uv = position / size;
    uv -= 0.5;
    
    // adjust aspect ratio
    uv.x *= size.x / size.y;
    
    float len = length(uv);
    
    half3 resultColor;
    
    resultColor = half3(step(len, delta));
    
    // add some glow
    
    float d = len - delta;
    
    // create glow which is inversely proportional to the distance
    float glow = 0.01 / d;
    
    // Remain in range 0.0 to 1.0 using clamp
    glow = clamp(glow, 0.0, 1.0);
    
    // Add some glow...
    resultColor += glow * intensity;
    
    return half4(resultColor, 1.0);
}
