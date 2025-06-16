//
//  PcurveShader.metal
//  Shaders 101
//
//  Created by Atul Mane on 06/06/25.
//

#include <metal_stdlib>
using namespace metal;

//  Function from Iñigo Quiles
//  www.iquilezles.org/www/articles/functions/functions.htm
float pcurve( float x, float a, float b ){
    float k = pow(a+b,a+b) / (pow(a,a)*pow(b,b));
    return k * pow( x, a ) * pow( 1.0-x, b );
}

float plot(float2 uv, float pct){
  return  smoothstep( pct-0.02, pct, uv.y) -
          smoothstep( pct, pct+0.02, uv.y);
}


// Color Effect Snippets with size parameter
//[[ stitchable ]] half4 name(float2 position, half4 color, args...)

[[ stitchable ]] half4 pCurveShader(float2 position, half4 color, float2 size, float a, float b) {
    
    float2 uv = position / size;
    
    //calculate function pcurve
    float y = pcurve(uv.x, a, b);
    
    //flip y
    y = 1 - y;
    
    float pct = plot(uv, y);
    
    half3 green  = half3(0.0, 1.0, 0.0);
    half3 newColor = half3(uv.x);
//    half3 newColor = half3(0.0); ;
    newColor = (1.0 - pct) * newColor + pct * green;
    
    
    half4 result = half4(newColor, 1.0);
    return  result;
}

