//
//  TileShader.metal
//  Shaders 101
//
//  Created by Atul Mane on 09/06/25.
//

#include <metal_stdlib>
using namespace metal;


//Distortion Effect Snippet With Size
//[[ stitchable ]] float2 name(float2 position, args...)
[[ stitchable ]] float2 tileShader(float2 position, float2 size, float2 tile) {
    
    
//    return (position * tile) % size;
    return  fmod(position * tile, size);
}

/*
 Text("Distortion Effect with size")
 .font(.largeTitle)
 .visualEffect { content, proxy in
 content
 .distortionEffect(ShaderLibrary.tileShader(
 .float2(proxy.size)
 ), maxSampleOffset: .zero)
 }
 */

