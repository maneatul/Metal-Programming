//
//  Basic Snippets.metal
//  Shaders 101
//
//  Created by Atul Mane on 16/05/25.
//

#include <metal_stdlib>
#include <SwiftUI/SwiftUI_Metal.h>
using namespace metal;


// Color Effect Snippets
//[[ stitchable ]] half4 name(float2 position, half4 color, args...)

[[ stitchable ]] half4 name1(float2 position, half4 color) {
    half4 result = color.a == 0 ? half4(1,0,0,1) : color;
    return  result;
}

/*
 Text("Hello, Metal Shaders!")
 .font(.largeTitle)
 .colorEffect(ShaderLibrary.name1())
 
 */


//Distortion Effect Snippet
//[[ stitchable ]] float2 name(float2 position, args...)
[[ stitchable ]] float2 name7(float2 position) {
    float2 result = float2(position.x, position.y+2*sin(position.x));
    
    return result;
}

/*
 Text("Hello, Metal Shaders!")
     .font(.largeTitle)
 .distortionEffect(ShaderLibrary.name2(), maxSampleOffset: .zero)
 */



//Layer Effect Snippet
//[[ stitchable ]] half4 name(float2 position, SwiftUI::Layer layer, args...)
[[ stitchable ]] half4 name5(float2 position, SwiftUI::Layer layer) {
    return  half4(0,0,1,1);
}

/*
 Text("Hello, Metal Shaders!")
     .font(.largeTitle)
 .layerEffect(ShaderLibrary.name3(), maxSampleOffset: .zero)
 */

//Distortion Effect Snippet
//[[ stitchable ]] float2 name(float2 position, args...)
[[ stitchable ]] float2 signShader(float2 position, float amplitude) {
    float2 result = float2(position.x, position.y+amplitude*sin(position.x));
    return result;
}

/*
 Text("Hello, Metal Shaders!")
 .font(.largeTitle)
 .distortionEffect(ShaderLibrary.signShader(), maxSampleOffset: .zero)
 */



// Color Effect Snippets with size parameter
//[[ stitchable ]] half4 name(float2 position, half4 color, args...)

[[ stitchable ]] half4 name(float2 position, half4 color, float2 size) {
    
    float2 uv = position / size;
    half4 result = half4(uv.x, uv.y , 0, 1);
    return  result;
}

/*
 Text("Hello, Metal Shaders!")
 .font(.largeTitle)
 .visualEffect { content, proxy in
 content
     .colorEffect(
         ShaderLibrary.name(.float2(proxy.size))
     )
}
 
 */


//Layer Effect Snippet with Size parameter
//[[ stitchable ]] half4 name(float2 position, SwiftUI::Layer layer, args...)
[[ stitchable ]] half4 name4(float2 position, SwiftUI::Layer layer, float2 size) {
    return  half4(0,0,1,1);
}

/*
 Text("Hello, Metal Shaders!")
 .font(.largeTitle)
 .visualEffect { content, proxy in
     content
     .layerEffect(ShaderLibrary.name3(
                                            .float2(proxy.size)
                                            ),
                    maxSampleOffset: .zero)
 }
 
 */


// Using Timeline with size and time parameters
//
// Color Effect snippet with Size and Time parameter
[[ stitchable ]] half4 name3(float2 position, half4 color, float2 size, float time) {
    float2 uv = position / size;
    half4 result = half4(uv.x, uv.y, 0, 1);
    
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
                        ShaderLibrary.name(
                                    .float2(proxy.size),
                                    .float(startDate.timeIntervalSinceNow)
                                        )
                        )
    }
 }
 
 */



// Using Timeline with size and time parameters
//
// Distortion Effect snippet with Size and Time parameter
[[ stitchable ]] float2 name6(float2 position, float2 size, float time) {
    float2 result = float2(position.x, position.y+2*sin(position.x));
    
    return result;
}

/*
 private let startDate = Date()
 
 TimelineView(.animation) { _ in
    Text("Distortion Effect with Time and Size")
        .font(.largeTitle)
        .visualEffect { content, proxy in
                content
                    .distortionEffect(
                        ShaderLibrary.name(
                                    .float2(proxy.size),
                                    .float(startDate.timeIntervalSinceNow)
                                        ),
                            maxSampleOffset: .zero
                        )
    }
 }
 
 */

// Using Timeline with size and time parameters
//
// Layer Effect snippet with Size and Time parameter
[[ stitchable ]] half4 name2(float2 position, SwiftUI::Layer layer, float2 size, float time) {
        
    return half4(0,0,1,1);
}

/*
 private let startDate = Date()
 
 TimelineView(.animation) { _ in
    Text("Layer Effect with Time and Size parameters")
        .font(.largeTitle)
        .visualEffect { content, proxy in
                content
                    .distortionEffect(
                        ShaderLibrary.name(
                                    .float2(proxy.size),
                                    .float(startDate.timeIntervalSinceNow)
                                        ),
                            maxSampleOffset: .zero
                        )
    }
 }
 
 */
