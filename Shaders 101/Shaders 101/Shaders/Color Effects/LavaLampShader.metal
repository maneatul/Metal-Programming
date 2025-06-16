//
//  LavaLampShader.metal
//  Shaders 101
//
//  Created by Atul Mane on 10/06/25.
//

#include <metal_stdlib>
using namespace metal;


float osc(float x, float speed, float offset) {
    return pow(sin(x * speed + offset), 2);
}


// Using Timeline with size and time parameters
//
// Color Effect snippet with Size and Time parameter
[[ stitchable ]] half4 lavalampShader(float2 position, half4 color, float2 size, float time, float threshold, float distanceFactor) {
    float2 uv = position / size;
    
    half4 backgroundCenter = half4(0.078, 0.0, 0.74, 0.7);
    half4 backgroundEdge = half4(0.047, 0.32, 0.98, 0.7);
    
    half4 result = mix(backgroundCenter, backgroundEdge, 2 * abs(uv.x - 0.5));
    
    // blob colors
    half4 blobBottom = half4(1.0, 1.0, 0.0, 1.0); // yellow
    half4 blobTop = half4(1.0, 0.0, 0.0, 1.0);   // Red
    
    // create some blobs
    // xy represents position
    // z representes the "strength"
    float3 blobCenters[6];
    blobCenters[0] = float3(0.6, osc(time, 0.5, 0.4), 0.5);
    blobCenters[1] = float3(0.5, osc(time, 0.2, 0.5), 0.6);
    blobCenters[2] = float3(0.55, osc(time, 0.2, 0.1), 0.5);
    blobCenters[3] = float3(0.45, osc(time, 0.1, 0.2), 0.8);
    blobCenters[4] = float3(0.62, osc(time, 0.7, 0.0), 0.8);
    blobCenters[5] = float3(0.7, osc(time, 0.2, 1.0), 0.6);
    
    // Get number of Blobs
    unsigned long int n = sizeof( blobCenters) / sizeof(blobCenters[0]);
    
    // Influence of blobs
    float influence = 0;
    
    for (unsigned long int i = 0; i < n; i++) {
        
        float distanceToCenter = distance(size * blobCenters[i].xy, position) * (1 / distanceFactor);
        
        influence += blobCenters[i].z / distanceToCenter;
        
        if (influence > threshold) {
            result = mix(blobBottom, blobTop, uv.y);
        }
    }
    return result;
}

