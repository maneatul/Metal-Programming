//
//  swizzle.metal
//  Shaders 101
//
//  Created by Atul Mane on 22/05/25.
//

#include <metal_stdlib>
using namespace metal;


// Color Effect Snippets
//[[ stitchable ]] half4 name(float2 position, half4 color, args...)

[[ stitchable ]] half4 swizzle1(float2 position, half4 color) {
    half4 result = color.rrrr;
    
    return result;
}

[[ stitchable ]] half4 swizzle2(float2 position, half4 color) {
    half4 result = color.rrra;
    
    return result;
}

[[ stitchable ]] half4 swizzle3(float2 position, half4 color) {
    half4 result = color.gbra;
    
    return result;
}

[[ stitchable ]] half4 swizzle4(float2 position, half4 color) {
    half4 result = color.ggra;
    
    return result;
}

[[ stitchable ]] half4 swizzle5(float2 position, half4 color) {
    //rgba -> xyzw
    half4 result = color.yyzw;
    
    return result;
}

[[ stitchable ]] half4 swizzle6(float2 position, half4 color) {
    half4 result = half4(color.rg,0,1);
    
    return result;
}

[[ stitchable ]] half4 swizzle7(float2 position, half4 color) {
    
    half4 result;
    
    //set rgba of result
    result.rgba = half4(1,0,0,0);
    
    //Reverse the order
    result.abgr = result; // (0,0,0,1)
    
    // Set red and green equal to one
    result.rg = half2(1);

    return result;
}

/*
 Text("Hello, Metal Shaders!")
 .font(.largeTitle)
 .colorEffect(ShaderLibrary.swizzle1())
 
 */
