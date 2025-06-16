//
//  uvShaders.metal
//  Shaders 101
//
//  Created by Atul Mane on 16/05/25.
//

#include <metal_stdlib>
using namespace metal;


// Color Effect Snippets
//[[ stitchable ]] half4 name(float2 position, half4 color, args...)

[[ stitchable ]] half4 uvExample1(float2 position, half4 color, float2 size) {
    
    float2 uv = position / size;
    half4 result = half4(uv.x, uv.y , 0, 1);
    return  result;
}

[[ stitchable ]] half4 uvExample2(float2 position, half4 color, float2 size) {
    
    float2 uv = position / size;
    half4 result = half4(uv.x, uv.y ,(uv.x+uv.y)/2, 1);
    return  result;
}

[[ stitchable ]] half4 uvExample3(float2 position, half4 color, float2 size) {
    
    float2 uv = position / size;
    half4 result = half4(uv.x, 0 ,1-uv.y, 1);
    return  result;
}

[[ stitchable ]] half4 uvExample4(float2 position, half4 color, float2 size) {
    
    float2 uv = position / size;
    half4 result = half4(1-uv.x, 0 ,1-uv.y, 1);
    return  result;
}

[[ stitchable ]] half4 uvExample5(float2 position, half4 color, float2 size) {
    
    float2 uv = position / size;
    half4 result = half4(1-uv.x, uv.x ,1-uv.y, 1);
    return  result;
}


[[ stitchable ]] half4 uvImage(float2 position, half4 color, float2 size) {
    
    float2 uv = position / size;
//    half4 result = half4(uv.x*color.g, uv.y*color.r, color.b, color.a);
    half4 result = half4(half2(uv), 1, 1)*color.grba;
    return  result;
}


[[ stitchable ]] half4 simpleUVMix(float2 position, half4 color, float2 size, float mixFactor) {
    
    float2 uv = position / size;
    half4 newColor = half4(uv.x, uv.y, 0, 1);
    
    return  mix(color, newColor, half4(mixFactor));
}


[[ stitchable ]] half4 uvMix(float2 position, half4 color, float2 size, float4 mixFactor) {
    
    float2 uv = position / size;
    half4 newColor = half4(uv.x, uv.y, 0, 1);
    
    return  mix(color, newColor, half4(mixFactor));
}

