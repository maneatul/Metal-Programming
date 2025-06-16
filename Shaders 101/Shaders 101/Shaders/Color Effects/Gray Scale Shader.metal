//
//  Gray Scale Shader.metal
//  Shaders 101
//
//  Created by Atul Mane on 16/05/25.
//

#include <metal_stdlib>
using namespace metal;


// Color Effect Snippets
//[[ stitchable ]] half4 name(float2 position, half4 color, args...)

[[ stitchable ]] half4 grayScale(float2 position, half4 color, float4 weights) {
    
//    half w1 = 0.33333;
//    half w2 = 0.33333;
//    half w3 = 0.33333;
    
//    
//    half w1 = 0.2126;
//    half w2 = 0.7152;
//    half w3 = 0.0722;
//    half brightness = w1*color.r + w2*color.g + w3*color.b;

//    half4 weights = half4(0.2126, 0.7152, 0.0722, 0);
    
    half brightness = dot(half4(weights), color);
  
    return half4(brightness, brightness, brightness, 1);
}

/*
 Text("Hello, Metal Shaders!")
 .font(.largeTitle)
 .colorEffect(ShaderLibrary.grayScale())
 
 */
