//
//  CoolCenterShader.metal
//  Shaders 101
//
//  Created by Atul Mane on 17/05/25.
//

#include <metal_stdlib>
using namespace metal;


// Color Effect Snippets with size parameter
//[[ stitchable ]] half4 name(float2 position, half4 color, args...)

[[ stitchable ]] half4 coolCenterShader(float2 position, half4 color, float2 size, float time, float minRadius, float maxRadius) {
    
    float2 center = size / 2.0;
    
    float distanceToCenter = distance(center, position);
    
    bool condition = distanceToCenter >= minRadius && distanceToCenter <= maxRadius;
    
    float red = condition ? (maxRadius - distanceToCenter) / maxRadius : 0;
    float green = condition ? distanceToCenter / maxRadius : 0;
    float blue = 1;
    float opacity = condition ? (0.3 + 0.7 * pow(sin(time), 2)) : 0.3;
        
    return half4(red, green, blue, opacity);
}

/*
 Text("Hello, Metal Shaders!")
 .font(.largeTitle)
 .visualEffect { content, proxy in
 content
 .colorEffect(
 ShaderLibrary.coolCenterShader(.float2(proxy.size), .float(startDate.timeIntervalSinceNow), .float(minRadius), .float(maxRadius))
 )
 }
 
 */



