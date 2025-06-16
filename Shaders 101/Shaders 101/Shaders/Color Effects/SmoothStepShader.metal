//
//  SmoothStepShader.metal
//  Shaders 101
//
//  Created by Atul Mane on 23/05/25.
//

#include <metal_stdlib>
using namespace metal;

float plot(float2 uv, float y, float width) {
    float delta = width / 2;
    
    return smoothstep(y-delta, y, uv.y) - smoothstep(y, y + delta, uv.y);
   
    // Sharper version using step
//    return step(y - delta, uv.y) - step(y + delta, uv.y);
}

// Color Effect Snippets with size parameter
//[[ stitchable ]] half4 name(float2 position, half4 color, args...)

[[ stitchable ]] half4 smoothStepShader(float2 position, half4 color, float2 size, float stepStart, float lineWidth, float graphOpacity, float backgroundOpacity) {
        
    float2 uv = position / size;
    
    // 0.2 -> 0.8
    float y = smoothstep(stepStart, 1-stepStart, uv.x);
//    float y = sin(M_PI_H * uv.x);
    // Flip the y
    y = 1 - y;
    
    half4 bgColor;
    bgColor.rgb = half3(uv.x);
    bgColor.a = backgroundOpacity;
    
    half4 graphColor;
    half4 yellow = half4(1,1,0,1);
    half4 green = half4(0,1,0,1);
    graphColor = mix(yellow, green, uv.x);
    graphColor.a = graphOpacity;
    
    float percent = plot(uv, y, lineWidth);
    
    half4 result = (1-percent) * bgColor + percent * graphColor;
        
    return  result;
}

/*
 Text("Hello, Metal Shaders!")
 .font(.largeTitle)
 .visualEffect { content, proxy in
 content
 .colorEffect(
 ShaderLibrary.smoothStepShader(.float2(proxy.size))
 )
 }
 
 */

