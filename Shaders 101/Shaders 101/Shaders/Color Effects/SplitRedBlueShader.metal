//
//  SplitRedBlueShader.metal
//  Shaders 101
//
//  Created by Atul Mane on 06/06/25.
//

#include <metal_stdlib>
using namespace metal;

/*
 [[ stitchable ]] half4 splitRBShader(float2 position, half4 color, float2 size, float percent) {
     float2 split = size * percent;
     
     if (position.x > split.x) {
         return  half4(0.0 ,0.0 ,color.b, color.a);
     } else {
         return half4(color.r, 0.0, 0.0, color.a);
     }
     
 }
 */

// Using Timeline with size and time parameters
//
// Color Effect snippet with Size and Time parameter
[[ stitchable ]] half4 splitRBShader(float2 position, half4 color, float2 size, float percent) {
    float2 split = size * percent;
    
    half4 redColor = half4(1.0, 0.0, 0.0, 1.0);
    half4 blueColor = half4(0.0, 0.0, 1.0, 1.0);
    
    half mask = step(split.x, position.x);
    return mix(redColor, blueColor, mask) * color;
}
