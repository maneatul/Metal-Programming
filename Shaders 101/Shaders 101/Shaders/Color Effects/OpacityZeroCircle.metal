//
//  OpacityZeroCircle.metal
//  Shaders 101
//
//  Created by Atul Mane on 17/05/25.
//

#include <metal_stdlib>
using namespace metal;


// Color Effect Snippets
//[[ stitchable ]] half4 name(float2 position, half4 color, args...)

[[ stitchable ]] half4 opacityZeroCircle(float2 position, half4 color, float2 touchPosition , float radius, float3 weight, float mixLevel) {
    
    half4 otherColor = half4(half3(weight) * color.rgb, 1);
    
    float distanceToCenter = distance(touchPosition, position);
    
    if (distanceToCenter <= radius) {
        if (distanceToCenter > radius-2) {
            return  half4(0,0,0,1);
        } else {
            return  mix(color, otherColor, mixLevel);
        }
    }
    
    return  mix(color, otherColor, 1-mixLevel);
}

/*
 Text("Hello, Metal Shaders!")
 .font(.largeTitle)
 .colorEffect(ShaderLibrary.opacityZeroCircle())
 
 */
