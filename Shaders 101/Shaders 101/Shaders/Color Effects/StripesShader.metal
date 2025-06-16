//
//  StripesShader.metal
//  Shaders 101
//
//  Created by Atul Mane on 09/06/25.
//

#include <metal_stdlib>
using namespace metal;


// Color Effect Snippets
//[[ stitchable ]] half4 name(float2 position, half4 color, args...)

[[ stitchable ]] half4 stripesShader(float2 position, half4 color, float stripeWidth) {
    
    half4 red = half4(1.0, 0.0, 0.0, 1.0); ;
    half4 blue = half4(0.0, 0.0, 1.0, 1.0);
    half4 green = half4(0.0, 1.0, 0.0, 1.0);
    half4 black = half4(1.0, 0.0, 0.0, 1.0);
    
    int stripeIndex = int(fmod(position.x, 3*stripeWidth) / stripeWidth);
    
    half4 result;
    
    if (stripeIndex == 0) {
        result = red;
    } else if (stripeIndex == 1 ) {
        result = green;
    } else if (stripeIndex == 2) {
        result = blue;
    } else {
        result = black;
    }
    return result;
}


[[ stitchable ]] half4 stripesFillShader(float2 position, float stripeWidth) {
    
    half4 red = half4(1.0, 0.0, 0.0, 1.0); ;
    half4 blue = half4(0.0, 0.0, 1.0, 1.0);
    half4 green = half4(0.0, 1.0, 0.0, 1.0);
    half4 black = half4(1.0, 0.0, 0.0, 1.0);
    
    int stripeIndex = int(fmod(position.x, 3*stripeWidth) / stripeWidth);
        
    if (stripeIndex == 0) {
        return red;
    } else if (stripeIndex == 1 ) {
        return green;
    } else if (stripeIndex == 2) {
        return blue;
    } else {
        return black;
    }
}
