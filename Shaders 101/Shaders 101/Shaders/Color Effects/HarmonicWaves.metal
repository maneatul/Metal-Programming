//
//  GlowingString.metal
//  Shaders 101
//
//  Created by Atul Mane on 25/05/25.
//

#include <metal_stdlib>
using namespace metal;

float3 getColor(float t) {
    if (t == 0) {
        return float3(0.9647, 0.4824, 0.8118);   // vibrant pink
    }
    if (t == 1) {
        return float3(0.3765, 0.7333, 0.9647);   // electric sky blue
    }
    if (t == 2) {
        return float3(0.6039, 0.9294, 0.6157);   // soft mint green
    }
    if (t == 3) {
        return float3(0.9882, 0.7333, 0.4118);   // peach orange
    }
    if (t == 4) {
        return float3(0.8157, 0.5882, 0.9961);   // pastel lavender
    }
    if (t == 5) {
        return float3(0.9882, 0.4353, 0.3765);   // coral red
    }
    return float3(1.0); // fallback: white
}

float glow(float x, float str, float dist){
    return dist / pow(x, str);
}

float harmonicSDF(float2 uv, float a, float offset, float f, float phi) {
  return abs((uv.y - offset) + cos(uv.x * f + phi) * a);
}

[[ stitchable ]]
half4 harmonicColorEffect(
  float2 pos,
  half4 color,
  float4 bounds,
  float wavesCount,
  float time,
  float amplitude,
  float mixCoeff
) {
  float2 uv = pos / float2(bounds.z, bounds.w);
  uv -= float2(0.5, 0.5);

  float a = cos(uv.x * 3.0) * amplitude * 0.2;
  float offset = sin(uv.x * 12.0 + time) * a * 0.1;
  float frequency = mix(3.0, 12.0, mixCoeff);
  float glowWidth = mix(0.6, 0.9, mixCoeff);
  float glowIntensity = mix(0.02, 0.01, mixCoeff);

  float3 finalColor = float3(0.0);

  for (float i = 0.0; i < wavesCount; i++) {
    float phase = time + i * M_PI_F / wavesCount;
    float sdfDist = glow(harmonicSDF(uv, a, offset, frequency, phase), glowWidth, glowIntensity);

    float3 waveColor = mix(float3(1.0), getColor(i), mixCoeff);

    finalColor += waveColor * sdfDist;
  }

  return half4(half3(finalColor), 1.0);
}
