//
//  InspirationalShader.metal
//  Shaders 101
//
//  Created by Atul Mane on 09/06/25.
//

#include <metal_stdlib>
using namespace metal;

// Using Timeline with size and time parameters
//
// Color Effect snippet with Size and Time parameter
[[ stitchable ]] half4 inspirationalShader(float2 position, half4 color, float2 size, float time, float2 speed, float complexityFactor) {
   
        half3 colorResult = half3(1.0);
        
        float len;
        float timeFactor = 0.5 * abs(time);
        
        for(int i = 0; i < 3; i++) {
                float2 adjustedUV;
                float2 p = position / size;
                
                adjustedUV = p;
                
                //shift p to centee and adjust aspect ratio
                p -= 0.5;       //try other values, implement touch
                p.x *= size.x / size.y;
                
                // perturb time. note results of timeFactor is unchange.
                timeFactor  += 0.7;
                
                len = length(p);
                
                // Important!
                
                float2 term1 = p / len;
                float2 term2 = sin(timeFactor) + 3.0;
                float2 term3 = abs(sin(len * speed.y - speed.x * timeFactor)) ;
                
//                adjustedUV += (p / len) * (sin(timeFactor) + 3.0) * 1.0;
                adjustedUV += term1 * term2 * term3;
                
                colorResult[i] = 0.01 / length(fmod(adjustedUV, complexityFactor));
            }
        
        half4 result = half4(colorResult / len, 1.0);
        
        result  = mix(result, color, 0.5);
        
    return result;
}

/*
 private let startDate = Date()
 
 TimelineView(.animation) { _ in
 Text("Color Effect with Time and Size")
 .font(.largeTitle)
 .visualEffect { content, proxy in
 content
 .colorEffect(
 ShaderLibrary.inspirationalShader(
 .float2(proxy.size),
 .float(startDate.timeIntervalSinceNow)
 )
 )
 }
 }
 
 */

