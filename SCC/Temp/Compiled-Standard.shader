// Compiled shader for Windows, Mac, Linux

//////////////////////////////////////////////////////////////////////////
// 
// NOTE: This is *not* a valid shader file, the contents are provided just
// for information and for debugging purposes only.
// 
//////////////////////////////////////////////////////////////////////////
// Skipping shader variants that would not be included into build of current scene.

Shader "Standard" {
Properties {
 _Color ("Color", Color) = (1.000000,1.000000,1.000000,1.000000)
 _MainTex ("Albedo", 2D) = "white" { }
 _Cutoff ("Alpha Cutoff", Range(0.000000,1.000000)) = 0.500000
 _Glossiness ("Smoothness", Range(0.000000,1.000000)) = 0.500000
 _GlossMapScale ("Smoothness Scale", Range(0.000000,1.000000)) = 1.000000
[Enum(Metallic Alpha,0,Albedo Alpha,1)]  _SmoothnessTextureChannel ("Smoothness texture channel", Float) = 0.000000
[Gamma]  _Metallic ("Metallic", Range(0.000000,1.000000)) = 0.000000
 _MetallicGlossMap ("Metallic", 2D) = "white" { }
[ToggleOff]  _SpecularHighlights ("Specular Highlights", Float) = 1.000000
[ToggleOff]  _GlossyReflections ("Glossy Reflections", Float) = 1.000000
 _BumpScale ("Scale", Float) = 1.000000
[Normal]  _BumpMap ("Normal Map", 2D) = "bump" { }
 _Parallax ("Height Scale", Range(0.005000,0.080000)) = 0.020000
 _ParallaxMap ("Height Map", 2D) = "black" { }
 _OcclusionStrength ("Strength", Range(0.000000,1.000000)) = 1.000000
 _OcclusionMap ("Occlusion", 2D) = "white" { }
 _EmissionColor ("Color", Color) = (0.000000,0.000000,0.000000,1.000000)
 _EmissionMap ("Emission", 2D) = "white" { }
 _DetailMask ("Detail Mask", 2D) = "white" { }
 _DetailAlbedoMap ("Detail Albedo x2", 2D) = "grey" { }
 _DetailNormalMapScale ("Scale", Float) = 1.000000
[Normal]  _DetailNormalMap ("Normal Map", 2D) = "bump" { }
[Enum(UV0,0,UV1,1)]  _UVSec ("UV Set for secondary textures", Float) = 0.000000
[HideInInspector]  _Mode ("__mode", Float) = 0.000000
[HideInInspector]  _SrcBlend ("__src", Float) = 1.000000
[HideInInspector]  _DstBlend ("__dst", Float) = 0.000000
[HideInInspector]  _ZWrite ("__zw", Float) = 1.000000
}
SubShader { 
 LOD 300
 Tags { "RenderType"="Opaque" "PerformanceChecks"="False" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="FORWARDBASE" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite [_ZWrite]
  Blend [_SrcBlend] [_DstBlend]
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords: DIRECTIONAL
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (244 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _MainTex_ST at 208
  Vector4 _DetailAlbedoMap_ST at 224
  Float _UVSec at 240
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    bool u_xlatb0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    u_xlatb0 = VGlobals._UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat0.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD1.w = 0.0;
    u_xlat0.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    output.TEXCOORD1.xyz = u_xlat0.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat0.w = 0.0;
    output.TEXCOORD2 = u_xlat0.wwwx;
    output.TEXCOORD3 = u_xlat0.wwwy;
    output.TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    output.TEXCOORD4.xyz = float3(u_xlat6) * u_xlat0.xyz;
    output.TEXCOORD5 = float4(0.0, 0.0, 0.0, 0.0);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_OcclusionMap" to slot 1 sampler slot 3
Set CUBE Texture "unity_SpecCube0" to slot 2 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 3 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 4 sampler slot 1

Constant Buffer "FGlobals" (316 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 176
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_OcclusionMaskSelector at 16
  Vector4 unity_SpecCube0_BoxMax at 32
  Vector4 unity_SpecCube0_BoxMin at 48
  Vector4 unity_SpecCube0_ProbePosition at 64
  Vector4 unity_SpecCube0_HDR at 80
  Vector4 unity_SpecCube1_BoxMax at 96
  Vector4 unity_SpecCube1_BoxMin at 112
  Vector4 unity_SpecCube1_ProbePosition at 128
  Vector4 unity_SpecCube1_HDR at 144
  Vector4 unity_ProbeVolumeParams at 160
  Vector3 unity_ProbeVolumeSizeInv at 240
  Vector3 unity_ProbeVolumeMin at 256
  Vector4 _LightColor0 at 272
  Vector4 _Color at 288
  Float _Metallic at 304
  Float _Glossiness at 308
  Float _OcclusionStrength at 312
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 unity_SpecCube0_BoxMax;
    float4 unity_SpecCube0_BoxMin;
    float4 unity_SpecCube0_ProbePosition;
    float4 unity_SpecCube0_HDR;
    float4 unity_SpecCube1_BoxMax;
    float4 unity_SpecCube1_BoxMin;
    float4 unity_SpecCube1_ProbePosition;
    float4 unity_SpecCube1_HDR;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float _OcclusionStrength;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_SpecCube0 [[ sampler (0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    sampler sampler_OcclusionMap [[ sampler (3) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _OcclusionMap [[ texture(1) ]] ,
    texturecube<float, access::sample > unity_SpecCube0 [[ texture(2) ]] ,
    texturecube<float, access::sample > unity_SpecCube1 [[ texture(3) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(4) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float3 u_xlat5;
    float4 u_xlat6;
    float3 u_xlat7;
    float4 u_xlat8;
    float3 u_xlat9;
    float3 u_xlat10;
    bool3 u_xlatb10;
    float3 u_xlat11;
    bool3 u_xlatb12;
    float3 u_xlat15;
    float u_xlat16;
    float3 u_xlat17;
    float3 u_xlat18;
    float u_xlat28;
    float u_xlat29;
    float u_xlat39;
    float u_xlat40;
    float u_xlat41;
    bool u_xlatb41;
    float u_xlat42;
    float u_xlat44;
    float u_xlat45;
    bool u_xlatb45;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat39 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat39) * u_xlat1.xyz;
    u_xlat40 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat40 = rsqrt(u_xlat40);
    u_xlat2.xyz = float3(u_xlat40) * input.TEXCOORD4.xyz;
    u_xlat40 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat40 = rsqrt(u_xlat40);
    u_xlat3.xyz = float3(u_xlat40) * input.TEXCOORD1.xyz;
    u_xlatb41 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb41){
        u_xlatb41 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = input.TEXCOORD3.www * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.www, u_xlat4.xyz);
        u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD4.www, u_xlat4.xyz);
        u_xlat4.xyz = u_xlat4.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat18.x = input.TEXCOORD2.w;
        u_xlat18.y = input.TEXCOORD3.w;
        u_xlat18.z = input.TEXCOORD4.w;
        u_xlat4.xyz = (bool(u_xlatb41)) ? u_xlat4.xyz : u_xlat18.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat4.yzw = u_xlat4.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat41 = fma(u_xlat4.y, 0.25, 0.75);
        u_xlat42 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat4.x = max(u_xlat41, u_xlat42);
        u_xlat4 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat41 = dot(u_xlat4, FGlobals.unity_OcclusionMaskSelector);
    u_xlat41 = clamp(u_xlat41, 0.0f, 1.0f);
    u_xlat42 = _OcclusionMap.sample(sampler_OcclusionMap, input.TEXCOORD0.xy).y;
    u_xlat4.x = (-FGlobals._OcclusionStrength) + 1.0;
    u_xlat42 = fma(u_xlat42, FGlobals._OcclusionStrength, u_xlat4.x);
    u_xlat4.x = (-FGlobals._Glossiness) + 1.0;
    u_xlat17.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat17.x = u_xlat17.x + u_xlat17.x;
    u_xlat17.xyz = fma(u_xlat2.xyz, (-u_xlat17.xxx), u_xlat3.xyz);
    u_xlat5.xyz = float3(u_xlat41) * FGlobals._LightColor0.xyz;
    u_xlatb41 = 0.0<FGlobals.unity_SpecCube0_ProbePosition.w;
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat17.xyz, u_xlat17.xyz);
        u_xlat41 = rsqrt(u_xlat41);
        u_xlat6.xyz = float3(u_xlat41) * u_xlat17.xyz;
        u_xlat7.x = input.TEXCOORD2.w;
        u_xlat7.y = input.TEXCOORD3.w;
        u_xlat7.z = input.TEXCOORD4.w;
        u_xlat8.xyz = (-u_xlat7.xyz) + FGlobals.unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat6.xyz;
        u_xlat9.xyz = (-u_xlat7.xyz) + FGlobals.unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat6.xyz;
        u_xlatb10.xyz = (float3(0.0, 0.0, 0.0)<u_xlat6.xyz);
        {
            float4 hlslcc_movcTemp = u_xlat8;
            hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat8 = hlslcc_movcTemp;
        }
        u_xlat41 = min(u_xlat8.y, u_xlat8.x);
        u_xlat41 = min(u_xlat8.z, u_xlat41);
        u_xlat7.xyz = u_xlat7.xyz + (-FGlobals.unity_SpecCube0_ProbePosition.xyz);
        u_xlat6.xyz = fma(u_xlat6.xyz, float3(u_xlat41), u_xlat7.xyz);
    } else {
        u_xlat6.xyz = u_xlat17.xyz;
    }
    u_xlat41 = fma((-u_xlat4.x), 0.699999988, 1.70000005);
    u_xlat41 = u_xlat41 * u_xlat4.x;
    u_xlat41 = u_xlat41 * 6.0;
    u_xlat6 = unity_SpecCube0.sample(samplerunity_SpecCube0, u_xlat6.xyz, level(u_xlat41));
    u_xlat44 = u_xlat6.w + -1.0;
    u_xlat44 = fma(FGlobals.unity_SpecCube0_HDR.w, u_xlat44, 1.0);
    u_xlat44 = log2(u_xlat44);
    u_xlat44 = u_xlat44 * FGlobals.unity_SpecCube0_HDR.y;
    u_xlat44 = exp2(u_xlat44);
    u_xlat44 = u_xlat44 * FGlobals.unity_SpecCube0_HDR.x;
    u_xlat7.xyz = u_xlat6.xyz * float3(u_xlat44);
    u_xlatb45 = FGlobals.unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb45){
        u_xlatb45 = 0.0<FGlobals.unity_SpecCube1_ProbePosition.w;
        if(u_xlatb45){
            u_xlat45 = dot(u_xlat17.xyz, u_xlat17.xyz);
            u_xlat45 = rsqrt(u_xlat45);
            u_xlat8.xyz = u_xlat17.xyz * float3(u_xlat45);
            u_xlat9.x = input.TEXCOORD2.w;
            u_xlat9.y = input.TEXCOORD3.w;
            u_xlat9.z = input.TEXCOORD4.w;
            u_xlat10.xyz = (-u_xlat9.xyz) + FGlobals.unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
            u_xlat11.xyz = (-u_xlat9.xyz) + FGlobals.unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat8.xyz;
            u_xlatb12.xyz = (float3(0.0, 0.0, 0.0)<u_xlat8.xyz);
            {
                float3 hlslcc_movcTemp = u_xlat10;
                hlslcc_movcTemp.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
                hlslcc_movcTemp.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
                hlslcc_movcTemp.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
                u_xlat10 = hlslcc_movcTemp;
            }
            u_xlat45 = min(u_xlat10.y, u_xlat10.x);
            u_xlat45 = min(u_xlat10.z, u_xlat45);
            u_xlat9.xyz = u_xlat9.xyz + (-FGlobals.unity_SpecCube1_ProbePosition.xyz);
            u_xlat17.xyz = fma(u_xlat8.xyz, float3(u_xlat45), u_xlat9.xyz);
        }
        u_xlat8 = unity_SpecCube1.sample(samplerunity_SpecCube0, u_xlat17.xyz, level(u_xlat41));
        u_xlat41 = u_xlat8.w + -1.0;
        u_xlat41 = fma(FGlobals.unity_SpecCube1_HDR.w, u_xlat41, 1.0);
        u_xlat41 = log2(u_xlat41);
        u_xlat41 = u_xlat41 * FGlobals.unity_SpecCube1_HDR.y;
        u_xlat41 = exp2(u_xlat41);
        u_xlat41 = u_xlat41 * FGlobals.unity_SpecCube1_HDR.x;
        u_xlat17.xyz = u_xlat8.xyz * float3(u_xlat41);
        u_xlat6.xyz = fma(float3(u_xlat44), u_xlat6.xyz, (-u_xlat17.xyz));
        u_xlat7.xyz = fma(FGlobals.unity_SpecCube0_BoxMin.www, u_xlat6.xyz, u_xlat17.xyz);
    }
    u_xlat17.xyz = float3(u_xlat42) * u_xlat7.xyz;
    u_xlat6.xyz = fma((-input.TEXCOORD1.xyz), float3(u_xlat40), FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat40 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat40 = max(u_xlat40, 0.00100000005);
    u_xlat40 = rsqrt(u_xlat40);
    u_xlat6.xyz = float3(u_xlat40) * u_xlat6.xyz;
    u_xlat40 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat41 = dot(u_xlat2.xyz, FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat41 = clamp(u_xlat41, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat15.x = dot(FGlobals._WorldSpaceLightPos0.xyz, u_xlat6.xyz);
    u_xlat15.x = clamp(u_xlat15.x, 0.0f, 1.0f);
    u_xlat28 = u_xlat15.x * u_xlat15.x;
    u_xlat28 = dot(float2(u_xlat28), u_xlat4.xx);
    u_xlat28 = u_xlat28 + -0.5;
    u_xlat3.x = (-u_xlat41) + 1.0;
    u_xlat16 = u_xlat3.x * u_xlat3.x;
    u_xlat16 = u_xlat16 * u_xlat16;
    u_xlat3.x = u_xlat3.x * u_xlat16;
    u_xlat3.x = fma(u_xlat28, u_xlat3.x, 1.0);
    u_xlat16 = -abs(u_xlat40) + 1.0;
    u_xlat29 = u_xlat16 * u_xlat16;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat16 = u_xlat16 * u_xlat29;
    u_xlat28 = fma(u_xlat28, u_xlat16, 1.0);
    u_xlat28 = u_xlat28 * u_xlat3.x;
    u_xlat28 = u_xlat41 * u_xlat28;
    u_xlat3.x = u_xlat4.x * u_xlat4.x;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat29 = (-u_xlat3.x) + 1.0;
    u_xlat42 = fma(abs(u_xlat40), u_xlat29, u_xlat3.x);
    u_xlat29 = fma(u_xlat41, u_xlat29, u_xlat3.x);
    u_xlat40 = abs(u_xlat40) * u_xlat29;
    u_xlat40 = fma(u_xlat41, u_xlat42, u_xlat40);
    u_xlat40 = u_xlat40 + 9.99999975e-06;
    u_xlat40 = 0.5 / u_xlat40;
    u_xlat29 = u_xlat3.x * u_xlat3.x;
    u_xlat42 = fma(u_xlat2.x, u_xlat29, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat42, u_xlat2.x, 1.0);
    u_xlat29 = u_xlat29 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat2.x = u_xlat29 / u_xlat2.x;
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat40 = u_xlat41 * u_xlat40;
    u_xlat40 = u_xlat40 * 3.14159274;
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat2.x = fma(u_xlat3.x, u_xlat3.x, 1.0);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat41 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb41 = u_xlat41!=0.0;
    u_xlat41 = u_xlatb41 ? 1.0 : float(0.0);
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat39 = (-u_xlat39) + FGlobals._Glossiness;
    u_xlat39 = u_xlat39 + 1.0;
    u_xlat39 = clamp(u_xlat39, 0.0f, 1.0f);
    u_xlat3.xzw = float3(u_xlat28) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * float3(u_xlat40);
    u_xlat40 = (-u_xlat15.x) + 1.0;
    u_xlat15.x = u_xlat40 * u_xlat40;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat15.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat15.xyz = fma(u_xlat15.xyz, float3(u_xlat40), u_xlat0.xyz);
    u_xlat15.xyz = u_xlat15.xyz * u_xlat5.xyz;
    u_xlat1.xyz = fma(u_xlat1.xyz, u_xlat3.xzw, u_xlat15.xyz);
    u_xlat2.xyz = u_xlat17.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + float3(u_xlat39);
    u_xlat0.xyz = fma(float3(u_xlat16), u_xlat3.xzw, u_xlat0.xyz);
    output.SV_Target0.xyz = fma(u_xlat2.xyz, u_xlat0.xyz, u_xlat1.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (308 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 80
  Matrix4x4 unity_WorldToObject at 144
  Matrix4x4 unity_MatrixVP at 208
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 unity_SHBr at 16
  Vector4 unity_SHBg at 32
  Vector4 unity_SHBb at 48
  Vector4 unity_SHC at 64
  Vector4 _MainTex_ST at 272
  Vector4 _DetailAlbedoMap_ST at 288
  Float _UVSec at 304
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 unity_SHBr;
    float4 unity_SHBg;
    float4 unity_SHBb;
    float4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    bool u_xlatb0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    u_xlatb0 = VGlobals._UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat0.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD1.w = 0.0;
    u_xlat0.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    output.TEXCOORD1.xyz = u_xlat0.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat0.w = 0.0;
    output.TEXCOORD2 = u_xlat0.wwwx;
    output.TEXCOORD3 = u_xlat0.wwwy;
    output.TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    u_xlat0.xyz = float3(u_xlat6) * u_xlat0.xyz;
    output.TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat6 = u_xlat0.y * u_xlat0.y;
    u_xlat6 = fma(u_xlat0.x, u_xlat0.x, (-u_xlat6));
    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat0.x = dot(VGlobals.unity_SHBr, u_xlat1);
    u_xlat0.y = dot(VGlobals.unity_SHBg, u_xlat1);
    u_xlat0.z = dot(VGlobals.unity_SHBb, u_xlat1);
    output.TEXCOORD5.xyz = fma(VGlobals.unity_SHC.xyz, float3(u_xlat6), u_xlat0.xyz);
    output.TEXCOORD5.w = 0.0;
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL SHADOWS_SCREEN
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (260 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _ProjectionParams at 16
  Vector4 _MainTex_ST at 224
  Vector4 _DetailAlbedoMap_ST at 240
  Float _UVSec at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _ProjectionParams;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float u_xlat7;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    output.mtl_Position = u_xlat0;
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD1.w = 0.0;
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    output.TEXCOORD1.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat1.w = 0.0;
    output.TEXCOORD2 = u_xlat1.wwwx;
    output.TEXCOORD3 = u_xlat1.wwwy;
    output.TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = rsqrt(u_xlat7);
    output.TEXCOORD4.xyz = float3(u_xlat7) * u_xlat1.xyz;
    output.TEXCOORD5 = float4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.y = u_xlat0.y * VGlobals._ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * float3(0.5, 0.5, 0.5);
    output.TEXCOORD7.zw = u_xlat0.zw;
    output.TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH SHADOWS_SCREEN
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (324 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 96
  Matrix4x4 unity_WorldToObject at 160
  Matrix4x4 unity_MatrixVP at 224
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _ProjectionParams at 16
  Vector4 unity_SHBr at 32
  Vector4 unity_SHBg at 48
  Vector4 unity_SHBb at 64
  Vector4 unity_SHC at 80
  Vector4 _MainTex_ST at 288
  Vector4 _DetailAlbedoMap_ST at 304
  Float _UVSec at 320
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _ProjectionParams;
    float4 unity_SHBr;
    float4 unity_SHBg;
    float4 unity_SHBb;
    float4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float4 u_xlat2;
    float u_xlat10;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    output.mtl_Position = u_xlat0;
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD1.w = 0.0;
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    output.TEXCOORD1.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat1.w = 0.0;
    output.TEXCOORD2 = u_xlat1.wwwx;
    output.TEXCOORD3 = u_xlat1.wwwy;
    output.TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    u_xlat1.xyz = float3(u_xlat10) * u_xlat1.xyz;
    output.TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat10 = u_xlat1.y * u_xlat1.y;
    u_xlat10 = fma(u_xlat1.x, u_xlat1.x, (-u_xlat10));
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat1.x = dot(VGlobals.unity_SHBr, u_xlat2);
    u_xlat1.y = dot(VGlobals.unity_SHBg, u_xlat2);
    u_xlat1.z = dot(VGlobals.unity_SHBb, u_xlat2);
    output.TEXCOORD5.xyz = fma(VGlobals.unity_SHC.xyz, float3(u_xlat10), u_xlat1.xyz);
    output.TEXCOORD5.w = 0.0;
    u_xlat0.y = u_xlat0.y * VGlobals._ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * float3(0.5, 0.5, 0.5);
    output.TEXCOORD7.zw = u_xlat0.zw;
    output.TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (244 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _MainTex_ST at 208
  Vector4 _DetailAlbedoMap_ST at 224
  Float _UVSec at 240
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    bool u_xlatb0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    u_xlatb0 = VGlobals._UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat0.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD1.w = 0.0;
    u_xlat0.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    output.TEXCOORD1.xyz = u_xlat0.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat0.w = 0.0;
    output.TEXCOORD2 = u_xlat0.wwwx;
    output.TEXCOORD3 = u_xlat0.wwwy;
    output.TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    output.TEXCOORD4.xyz = float3(u_xlat6) * u_xlat0.xyz;
    output.TEXCOORD5 = float4(0.0, 0.0, 0.0, 0.0);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (500 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 272
  Matrix4x4 unity_WorldToObject at 336
  Matrix4x4 unity_MatrixVP at 400
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 unity_4LightPosX0 at 16
  Vector4 unity_4LightPosY0 at 32
  Vector4 unity_4LightPosZ0 at 48
  Vector4 unity_4LightAtten0 at 64
  Vector4 unity_LightColor[8] at 80
  Vector4 unity_SHBr at 208
  Vector4 unity_SHBg at 224
  Vector4 unity_SHBb at 240
  Vector4 unity_SHC at 256
  Vector4 _MainTex_ST at 464
  Vector4 _DetailAlbedoMap_ST at 480
  Float _UVSec at 496
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    float4 unity_4LightAtten0;
    float4 unity_LightColor[8];
    float4 unity_SHBr;
    float4 unity_SHBg;
    float4 unity_SHBb;
    float4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    bool u_xlatb0;
    float4 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float u_xlat15;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    u_xlatb0 = VGlobals._UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat0.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD1.w = 0.0;
    u_xlat0.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    output.TEXCOORD1.xyz = u_xlat0.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat0.w = 0.0;
    output.TEXCOORD2 = u_xlat0.wwwx;
    output.TEXCOORD3 = u_xlat0.wwwy;
    output.TEXCOORD4.w = u_xlat0.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = rsqrt(u_xlat15);
    u_xlat1.xyz = float3(u_xlat15) * u_xlat1.xyz;
    output.TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat2 = (-u_xlat0.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = fma(u_xlat2, u_xlat2, u_xlat3);
    u_xlat2 = fma(u_xlat2, u_xlat1.xxxx, u_xlat4);
    u_xlat2 = fma(u_xlat0, u_xlat1.zzzz, u_xlat2);
    u_xlat0 = fma(u_xlat0, u_xlat0, u_xlat3);
    u_xlat0 = max(u_xlat0, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = rsqrt(u_xlat0);
    u_xlat0 = fma(u_xlat0, VGlobals.unity_4LightAtten0, float4(1.0, 1.0, 1.0, 1.0));
    u_xlat0 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * VGlobals.unity_LightColor[1].xyz;
    u_xlat2.xyz = fma(VGlobals.unity_LightColor[0].xyz, u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = fma(VGlobals.unity_LightColor[2].xyz, u_xlat0.zzz, u_xlat2.xyz);
    u_xlat0.xyz = fma(VGlobals.unity_LightColor[3].xyz, u_xlat0.www, u_xlat0.xyz);
    u_xlat15 = u_xlat1.y * u_xlat1.y;
    u_xlat15 = fma(u_xlat1.x, u_xlat1.x, (-u_xlat15));
    u_xlat1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat2.x = dot(VGlobals.unity_SHBr, u_xlat1);
    u_xlat2.y = dot(VGlobals.unity_SHBg, u_xlat1);
    u_xlat2.z = dot(VGlobals.unity_SHBb, u_xlat1);
    u_xlat1.xyz = fma(VGlobals.unity_SHC.xyz, float3(u_xlat15), u_xlat2.xyz);
    output.TEXCOORD5.xyz = u_xlat0.xyz + u_xlat1.xyz;
    output.TEXCOORD5.w = 0.0;
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL SHADOWS_SCREEN VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (260 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _ProjectionParams at 16
  Vector4 _MainTex_ST at 224
  Vector4 _DetailAlbedoMap_ST at 240
  Float _UVSec at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _ProjectionParams;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float u_xlat7;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    output.mtl_Position = u_xlat0;
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD1.w = 0.0;
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    output.TEXCOORD1.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat1.w = 0.0;
    output.TEXCOORD2 = u_xlat1.wwwx;
    output.TEXCOORD3 = u_xlat1.wwwy;
    output.TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = rsqrt(u_xlat7);
    output.TEXCOORD4.xyz = float3(u_xlat7) * u_xlat1.xyz;
    output.TEXCOORD5 = float4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.y = u_xlat0.y * VGlobals._ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * float3(0.5, 0.5, 0.5);
    output.TEXCOORD7.zw = u_xlat0.zw;
    output.TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH SHADOWS_SCREEN VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (516 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 288
  Matrix4x4 unity_WorldToObject at 352
  Matrix4x4 unity_MatrixVP at 416
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _ProjectionParams at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  Vector4 unity_4LightAtten0 at 80
  Vector4 unity_LightColor[8] at 96
  Vector4 unity_SHBr at 224
  Vector4 unity_SHBg at 240
  Vector4 unity_SHBb at 256
  Vector4 unity_SHC at 272
  Vector4 _MainTex_ST at 480
  Vector4 _DetailAlbedoMap_ST at 496
  Float _UVSec at 512
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _ProjectionParams;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    float4 unity_4LightAtten0;
    float4 unity_LightColor[8];
    float4 unity_SHBr;
    float4 unity_SHBg;
    float4 unity_SHBb;
    float4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float4 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float4 u_xlat5;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    output.mtl_Position = u_xlat0;
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD1.w = 0.0;
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    output.TEXCOORD1.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat1.w = 0.0;
    output.TEXCOORD2 = u_xlat1.wwwx;
    output.TEXCOORD3 = u_xlat1.wwwy;
    output.TEXCOORD4.w = u_xlat1.z;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    output.TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3 = (-u_xlat1.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat4 = (-u_xlat1.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat1 = (-u_xlat1.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat5 = u_xlat2.yyyy * u_xlat4;
    u_xlat4 = u_xlat4 * u_xlat4;
    u_xlat4 = fma(u_xlat3, u_xlat3, u_xlat4);
    u_xlat3 = fma(u_xlat3, u_xlat2.xxxx, u_xlat5);
    u_xlat3 = fma(u_xlat1, u_xlat2.zzzz, u_xlat3);
    u_xlat1 = fma(u_xlat1, u_xlat1, u_xlat4);
    u_xlat1 = max(u_xlat1, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat4 = rsqrt(u_xlat1);
    u_xlat1 = fma(u_xlat1, VGlobals.unity_4LightAtten0, float4(1.0, 1.0, 1.0, 1.0));
    u_xlat1 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
    u_xlat3 = u_xlat3 * u_xlat4;
    u_xlat3 = max(u_xlat3, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat3.xyz = u_xlat1.yyy * VGlobals.unity_LightColor[1].xyz;
    u_xlat3.xyz = fma(VGlobals.unity_LightColor[0].xyz, u_xlat1.xxx, u_xlat3.xyz);
    u_xlat1.xyz = fma(VGlobals.unity_LightColor[2].xyz, u_xlat1.zzz, u_xlat3.xyz);
    u_xlat1.xyz = fma(VGlobals.unity_LightColor[3].xyz, u_xlat1.www, u_xlat1.xyz);
    u_xlat19 = u_xlat2.y * u_xlat2.y;
    u_xlat19 = fma(u_xlat2.x, u_xlat2.x, (-u_xlat19));
    u_xlat2 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat3.x = dot(VGlobals.unity_SHBr, u_xlat2);
    u_xlat3.y = dot(VGlobals.unity_SHBg, u_xlat2);
    u_xlat3.z = dot(VGlobals.unity_SHBb, u_xlat2);
    u_xlat2.xyz = fma(VGlobals.unity_SHC.xyz, float3(u_xlat19), u_xlat3.xyz);
    output.TEXCOORD5.xyz = u_xlat1.xyz + u_xlat2.xyz;
    output.TEXCOORD5.w = 0.0;
    u_xlat0.y = u_xlat0.y * VGlobals._ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * float3(0.5, 0.5, 0.5);
    output.TEXCOORD7.zw = u_xlat0.zw;
    output.TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH _EMISSION
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_OcclusionMap" to slot 1 sampler slot 3
Set 2D Texture "_EmissionMap" to slot 2 sampler slot 4
Set CUBE Texture "unity_SpecCube0" to slot 3 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 4 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 5 sampler slot 1

Constant Buffer "FGlobals" (384 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 224
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_SHAr at 16
  Vector4 unity_SHAg at 32
  Vector4 unity_SHAb at 48
  Vector4 unity_OcclusionMaskSelector at 64
  Vector4 unity_SpecCube0_BoxMax at 80
  Vector4 unity_SpecCube0_BoxMin at 96
  Vector4 unity_SpecCube0_ProbePosition at 112
  Vector4 unity_SpecCube0_HDR at 128
  Vector4 unity_SpecCube1_BoxMax at 144
  Vector4 unity_SpecCube1_BoxMin at 160
  Vector4 unity_SpecCube1_ProbePosition at 176
  Vector4 unity_SpecCube1_HDR at 192
  Vector4 unity_ProbeVolumeParams at 208
  Vector3 unity_ProbeVolumeSizeInv at 288
  Vector3 unity_ProbeVolumeMin at 304
  Vector4 _LightColor0 at 320
  Vector4 _Color at 336
  Float _Metallic at 352
  Float _Glossiness at 356
  Float _OcclusionStrength at 360
  Vector4 _EmissionColor at 368
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 unity_SHAr;
    float4 unity_SHAg;
    float4 unity_SHAb;
    float4 unity_OcclusionMaskSelector;
    float4 unity_SpecCube0_BoxMax;
    float4 unity_SpecCube0_BoxMin;
    float4 unity_SpecCube0_ProbePosition;
    float4 unity_SpecCube0_HDR;
    float4 unity_SpecCube1_BoxMax;
    float4 unity_SpecCube1_BoxMin;
    float4 unity_SpecCube1_ProbePosition;
    float4 unity_SpecCube1_HDR;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float _OcclusionStrength;
    float4 _EmissionColor;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_SpecCube0 [[ sampler (0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    sampler sampler_OcclusionMap [[ sampler (3) ]],
    sampler sampler_EmissionMap [[ sampler (4) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _OcclusionMap [[ texture(1) ]] ,
    texture2d<float, access::sample > _EmissionMap [[ texture(2) ]] ,
    texturecube<float, access::sample > unity_SpecCube0 [[ texture(3) ]] ,
    texturecube<float, access::sample > unity_SpecCube1 [[ texture(4) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(5) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    bool u_xlatb4;
    float4 u_xlat5;
    float3 u_xlat6;
    float4 u_xlat7;
    float4 u_xlat8;
    float4 u_xlat9;
    float3 u_xlat10;
    float3 u_xlat11;
    float3 u_xlat12;
    bool3 u_xlatb12;
    float3 u_xlat13;
    bool3 u_xlatb14;
    float3 u_xlat17;
    float u_xlat18;
    float3 u_xlat19;
    float3 u_xlat20;
    float3 u_xlat23;
    float u_xlat32;
    float u_xlat33;
    float u_xlat34;
    float u_xlat45;
    float u_xlat46;
    float u_xlat47;
    bool u_xlatb47;
    float u_xlat48;
    bool u_xlatb48;
    float u_xlat49;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat45 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat45) * u_xlat1.xyz;
    u_xlat46 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat46 = rsqrt(u_xlat46);
    u_xlat2.xyz = float3(u_xlat46) * input.TEXCOORD4.xyz;
    u_xlat46 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat46 = rsqrt(u_xlat46);
    u_xlat3.xyz = float3(u_xlat46) * input.TEXCOORD1.xyz;
    u_xlatb48 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb48){
        u_xlatb4 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat19.xyz = input.TEXCOORD3.www * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat19.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.www, u_xlat19.xyz);
        u_xlat19.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD4.www, u_xlat19.xyz);
        u_xlat19.xyz = u_xlat19.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat20.x = input.TEXCOORD2.w;
        u_xlat20.y = input.TEXCOORD3.w;
        u_xlat20.z = input.TEXCOORD4.w;
        u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat19.xyz : u_xlat20.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat4.yzw = u_xlat4.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat19.x = fma(u_xlat4.y, 0.25, 0.75);
        u_xlat5.x = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat4.x = max(u_xlat19.x, u_xlat5.x);
        u_xlat4 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat4.x = dot(u_xlat4, FGlobals.unity_OcclusionMaskSelector);
    u_xlat4.x = clamp(u_xlat4.x, 0.0f, 1.0f);
    u_xlat19.x = _OcclusionMap.sample(sampler_OcclusionMap, input.TEXCOORD0.xy).y;
    u_xlat34 = (-FGlobals._OcclusionStrength) + 1.0;
    u_xlat19.x = fma(u_xlat19.x, FGlobals._OcclusionStrength, u_xlat34);
    u_xlat34 = (-FGlobals._Glossiness) + 1.0;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat49 = u_xlat49 + u_xlat49;
    u_xlat5.xyz = fma(u_xlat2.xyz, (-float3(u_xlat49)), u_xlat3.xyz);
    u_xlat6.xyz = u_xlat4.xxx * FGlobals._LightColor0.xyz;
    if(u_xlatb48){
        u_xlatb48 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = input.TEXCOORD3.www * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.www, u_xlat7.xyz);
        u_xlat7.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD4.www, u_xlat7.xyz);
        u_xlat7.xyz = u_xlat7.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat23.x = input.TEXCOORD2.w;
        u_xlat23.y = input.TEXCOORD3.w;
        u_xlat23.z = input.TEXCOORD4.w;
        u_xlat7.xyz = (bool(u_xlatb48)) ? u_xlat7.xyz : u_xlat23.xyz;
        u_xlat7.xyz = u_xlat7.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat7.yzw = u_xlat7.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat48 = u_xlat7.y * 0.25;
        u_xlat4.x = FGlobals.unity_ProbeVolumeParams.z * 0.5;
        u_xlat49 = fma((-FGlobals.unity_ProbeVolumeParams.z), 0.5, 0.25);
        u_xlat48 = max(u_xlat48, u_xlat4.x);
        u_xlat7.x = min(u_xlat49, u_xlat48);
        u_xlat8 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat7.xzw);
        u_xlat9.xyz = u_xlat7.xzw + float3(0.25, 0.0, 0.0);
        u_xlat9 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat9.xyz);
        u_xlat7.xyz = u_xlat7.xzw + float3(0.5, 0.0, 0.0);
        u_xlat7 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat7.xyz);
        u_xlat2.w = 1.0;
        u_xlat8.x = dot(u_xlat8, u_xlat2);
        u_xlat8.y = dot(u_xlat9, u_xlat2);
        u_xlat8.z = dot(u_xlat7, u_xlat2);
    } else {
        u_xlat2.w = 1.0;
        u_xlat8.x = dot(FGlobals.unity_SHAr, u_xlat2);
        u_xlat8.y = dot(FGlobals.unity_SHAg, u_xlat2);
        u_xlat8.z = dot(FGlobals.unity_SHAb, u_xlat2);
    }
    u_xlat7.xyz = u_xlat8.xyz + input.TEXCOORD5.xyz;
    u_xlat7.xyz = max(u_xlat7.xyz, float3(0.0, 0.0, 0.0));
    u_xlatb47 = 0.0<FGlobals.unity_SpecCube0_ProbePosition.w;
    if(u_xlatb47){
        u_xlat47 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat47 = rsqrt(u_xlat47);
        u_xlat8.xyz = float3(u_xlat47) * u_xlat5.xyz;
        u_xlat9.x = input.TEXCOORD2.w;
        u_xlat9.y = input.TEXCOORD3.w;
        u_xlat9.z = input.TEXCOORD4.w;
        u_xlat10.xyz = (-u_xlat9.xyz) + FGlobals.unity_SpecCube0_BoxMax.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
        u_xlat11.xyz = (-u_xlat9.xyz) + FGlobals.unity_SpecCube0_BoxMin.xyz;
        u_xlat11.xyz = u_xlat11.xyz / u_xlat8.xyz;
        u_xlatb12.xyz = (float3(0.0, 0.0, 0.0)<u_xlat8.xyz);
        {
            float3 hlslcc_movcTemp = u_xlat10;
            hlslcc_movcTemp.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
            hlslcc_movcTemp.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
            hlslcc_movcTemp.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
            u_xlat10 = hlslcc_movcTemp;
        }
        u_xlat47 = min(u_xlat10.y, u_xlat10.x);
        u_xlat47 = min(u_xlat10.z, u_xlat47);
        u_xlat9.xyz = u_xlat9.xyz + (-FGlobals.unity_SpecCube0_ProbePosition.xyz);
        u_xlat8.xyz = fma(u_xlat8.xyz, float3(u_xlat47), u_xlat9.xyz);
    } else {
        u_xlat8.xyz = u_xlat5.xyz;
    }
    u_xlat47 = fma((-u_xlat34), 0.699999988, 1.70000005);
    u_xlat47 = u_xlat47 * u_xlat34;
    u_xlat47 = u_xlat47 * 6.0;
    u_xlat8 = unity_SpecCube0.sample(samplerunity_SpecCube0, u_xlat8.xyz, level(u_xlat47));
    u_xlat48 = u_xlat8.w + -1.0;
    u_xlat48 = fma(FGlobals.unity_SpecCube0_HDR.w, u_xlat48, 1.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * FGlobals.unity_SpecCube0_HDR.y;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * FGlobals.unity_SpecCube0_HDR.x;
    u_xlat9.xyz = u_xlat8.xyz * float3(u_xlat48);
    u_xlatb4 = FGlobals.unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb4){
        u_xlatb4 = 0.0<FGlobals.unity_SpecCube1_ProbePosition.w;
        if(u_xlatb4){
            u_xlat4.x = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat4.x = rsqrt(u_xlat4.x);
            u_xlat10.xyz = u_xlat4.xxx * u_xlat5.xyz;
            u_xlat11.x = input.TEXCOORD2.w;
            u_xlat11.y = input.TEXCOORD3.w;
            u_xlat11.z = input.TEXCOORD4.w;
            u_xlat12.xyz = (-u_xlat11.xyz) + FGlobals.unity_SpecCube1_BoxMax.xyz;
            u_xlat12.xyz = u_xlat12.xyz / u_xlat10.xyz;
            u_xlat13.xyz = (-u_xlat11.xyz) + FGlobals.unity_SpecCube1_BoxMin.xyz;
            u_xlat13.xyz = u_xlat13.xyz / u_xlat10.xyz;
            u_xlatb14.xyz = (float3(0.0, 0.0, 0.0)<u_xlat10.xyz);
            {
                float3 hlslcc_movcTemp = u_xlat12;
                hlslcc_movcTemp.x = (u_xlatb14.x) ? u_xlat12.x : u_xlat13.x;
                hlslcc_movcTemp.y = (u_xlatb14.y) ? u_xlat12.y : u_xlat13.y;
                hlslcc_movcTemp.z = (u_xlatb14.z) ? u_xlat12.z : u_xlat13.z;
                u_xlat12 = hlslcc_movcTemp;
            }
            u_xlat4.x = min(u_xlat12.y, u_xlat12.x);
            u_xlat4.x = min(u_xlat12.z, u_xlat4.x);
            u_xlat11.xyz = u_xlat11.xyz + (-FGlobals.unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = fma(u_xlat10.xyz, u_xlat4.xxx, u_xlat11.xyz);
        }
        u_xlat5 = unity_SpecCube1.sample(samplerunity_SpecCube0, u_xlat5.xyz, level(u_xlat47));
        u_xlat47 = u_xlat5.w + -1.0;
        u_xlat47 = fma(FGlobals.unity_SpecCube1_HDR.w, u_xlat47, 1.0);
        u_xlat47 = log2(u_xlat47);
        u_xlat47 = u_xlat47 * FGlobals.unity_SpecCube1_HDR.y;
        u_xlat47 = exp2(u_xlat47);
        u_xlat47 = u_xlat47 * FGlobals.unity_SpecCube1_HDR.x;
        u_xlat5.xyz = u_xlat5.xyz * float3(u_xlat47);
        u_xlat8.xyz = fma(float3(u_xlat48), u_xlat8.xyz, (-u_xlat5.xyz));
        u_xlat9.xyz = fma(FGlobals.unity_SpecCube0_BoxMin.www, u_xlat8.xyz, u_xlat5.xyz);
    }
    u_xlat5.xyz = u_xlat19.xxx * u_xlat9.xyz;
    u_xlat8.xyz = fma((-input.TEXCOORD1.xyz), float3(u_xlat46), FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat46 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat46 = max(u_xlat46, 0.00100000005);
    u_xlat46 = rsqrt(u_xlat46);
    u_xlat8.xyz = float3(u_xlat46) * u_xlat8.xyz;
    u_xlat46 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat47 = dot(u_xlat2.xyz, FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat47 = clamp(u_xlat47, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat17.x = dot(FGlobals._WorldSpaceLightPos0.xyz, u_xlat8.xyz);
    u_xlat17.x = clamp(u_xlat17.x, 0.0f, 1.0f);
    u_xlat32 = u_xlat17.x * u_xlat17.x;
    u_xlat32 = dot(float2(u_xlat32), float2(u_xlat34));
    u_xlat32 = u_xlat32 + -0.5;
    u_xlat3.x = (-u_xlat47) + 1.0;
    u_xlat18 = u_xlat3.x * u_xlat3.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat3.x = u_xlat3.x * u_xlat18;
    u_xlat3.x = fma(u_xlat32, u_xlat3.x, 1.0);
    u_xlat18 = -abs(u_xlat46) + 1.0;
    u_xlat33 = u_xlat18 * u_xlat18;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat18 = u_xlat18 * u_xlat33;
    u_xlat32 = fma(u_xlat32, u_xlat18, 1.0);
    u_xlat32 = u_xlat32 * u_xlat3.x;
    u_xlat32 = u_xlat47 * u_xlat32;
    u_xlat3.x = u_xlat34 * u_xlat34;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat33 = (-u_xlat3.x) + 1.0;
    u_xlat48 = fma(abs(u_xlat46), u_xlat33, u_xlat3.x);
    u_xlat33 = fma(u_xlat47, u_xlat33, u_xlat3.x);
    u_xlat46 = abs(u_xlat46) * u_xlat33;
    u_xlat46 = fma(u_xlat47, u_xlat48, u_xlat46);
    u_xlat46 = u_xlat46 + 9.99999975e-06;
    u_xlat46 = 0.5 / u_xlat46;
    u_xlat33 = u_xlat3.x * u_xlat3.x;
    u_xlat48 = fma(u_xlat2.x, u_xlat33, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat48, u_xlat2.x, 1.0);
    u_xlat33 = u_xlat33 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat2.x = u_xlat33 / u_xlat2.x;
    u_xlat46 = u_xlat46 * u_xlat2.x;
    u_xlat46 = u_xlat47 * u_xlat46;
    u_xlat46 = u_xlat46 * 3.14159274;
    u_xlat46 = max(u_xlat46, 0.0);
    u_xlat2.x = fma(u_xlat3.x, u_xlat3.x, 1.0);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat47 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb47 = u_xlat47!=0.0;
    u_xlat47 = u_xlatb47 ? 1.0 : float(0.0);
    u_xlat46 = u_xlat46 * u_xlat47;
    u_xlat45 = (-u_xlat45) + FGlobals._Glossiness;
    u_xlat45 = u_xlat45 + 1.0;
    u_xlat45 = clamp(u_xlat45, 0.0f, 1.0f);
    u_xlat3.xzw = float3(u_xlat32) * u_xlat6.xyz;
    u_xlat3.xzw = fma(u_xlat7.xyz, u_xlat19.xxx, u_xlat3.xzw);
    u_xlat4.xyz = u_xlat6.xyz * float3(u_xlat46);
    u_xlat46 = (-u_xlat17.x) + 1.0;
    u_xlat17.x = u_xlat46 * u_xlat46;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat46 = u_xlat46 * u_xlat17.x;
    u_xlat17.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat17.xyz = fma(u_xlat17.xyz, float3(u_xlat46), u_xlat0.xyz);
    u_xlat17.xyz = u_xlat17.xyz * u_xlat4.xyz;
    u_xlat1.xyz = fma(u_xlat1.xyz, u_xlat3.xzw, u_xlat17.xyz);
    u_xlat2.xyz = u_xlat5.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + float3(u_xlat45);
    u_xlat0.xyz = fma(float3(u_xlat18), u_xlat3.xzw, u_xlat0.xyz);
    u_xlat0.xyz = fma(u_xlat2.xyz, u_xlat0.xyz, u_xlat1.xyz);
    u_xlat1.xyz = _EmissionMap.sample(sampler_EmissionMap, input.TEXCOORD0.xy).xyz;
    output.SV_Target0.xyz = fma(u_xlat1.xyz, FGlobals._EmissionColor.xyz, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_OcclusionMap" to slot 1 sampler slot 3
Set CUBE Texture "unity_SpecCube0" to slot 2 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 3 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 4 sampler slot 1

Constant Buffer "FGlobals" (364 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 224
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_SHAr at 16
  Vector4 unity_SHAg at 32
  Vector4 unity_SHAb at 48
  Vector4 unity_OcclusionMaskSelector at 64
  Vector4 unity_SpecCube0_BoxMax at 80
  Vector4 unity_SpecCube0_BoxMin at 96
  Vector4 unity_SpecCube0_ProbePosition at 112
  Vector4 unity_SpecCube0_HDR at 128
  Vector4 unity_SpecCube1_BoxMax at 144
  Vector4 unity_SpecCube1_BoxMin at 160
  Vector4 unity_SpecCube1_ProbePosition at 176
  Vector4 unity_SpecCube1_HDR at 192
  Vector4 unity_ProbeVolumeParams at 208
  Vector3 unity_ProbeVolumeSizeInv at 288
  Vector3 unity_ProbeVolumeMin at 304
  Vector4 _LightColor0 at 320
  Vector4 _Color at 336
  Float _Metallic at 352
  Float _Glossiness at 356
  Float _OcclusionStrength at 360
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 unity_SHAr;
    float4 unity_SHAg;
    float4 unity_SHAb;
    float4 unity_OcclusionMaskSelector;
    float4 unity_SpecCube0_BoxMax;
    float4 unity_SpecCube0_BoxMin;
    float4 unity_SpecCube0_ProbePosition;
    float4 unity_SpecCube0_HDR;
    float4 unity_SpecCube1_BoxMax;
    float4 unity_SpecCube1_BoxMin;
    float4 unity_SpecCube1_ProbePosition;
    float4 unity_SpecCube1_HDR;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float _OcclusionStrength;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_SpecCube0 [[ sampler (0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    sampler sampler_OcclusionMap [[ sampler (3) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _OcclusionMap [[ texture(1) ]] ,
    texturecube<float, access::sample > unity_SpecCube0 [[ texture(2) ]] ,
    texturecube<float, access::sample > unity_SpecCube1 [[ texture(3) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(4) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    bool u_xlatb4;
    float4 u_xlat5;
    float3 u_xlat6;
    float4 u_xlat7;
    float4 u_xlat8;
    float4 u_xlat9;
    float3 u_xlat10;
    float3 u_xlat11;
    float3 u_xlat12;
    bool3 u_xlatb12;
    float3 u_xlat13;
    bool3 u_xlatb14;
    float3 u_xlat17;
    float u_xlat18;
    float3 u_xlat19;
    float3 u_xlat20;
    float3 u_xlat23;
    float u_xlat32;
    float u_xlat33;
    float u_xlat34;
    float u_xlat45;
    float u_xlat46;
    float u_xlat47;
    bool u_xlatb47;
    float u_xlat48;
    bool u_xlatb48;
    float u_xlat49;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat45 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat45) * u_xlat1.xyz;
    u_xlat46 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat46 = rsqrt(u_xlat46);
    u_xlat2.xyz = float3(u_xlat46) * input.TEXCOORD4.xyz;
    u_xlat46 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat46 = rsqrt(u_xlat46);
    u_xlat3.xyz = float3(u_xlat46) * input.TEXCOORD1.xyz;
    u_xlatb48 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb48){
        u_xlatb4 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat19.xyz = input.TEXCOORD3.www * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat19.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.www, u_xlat19.xyz);
        u_xlat19.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD4.www, u_xlat19.xyz);
        u_xlat19.xyz = u_xlat19.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat20.x = input.TEXCOORD2.w;
        u_xlat20.y = input.TEXCOORD3.w;
        u_xlat20.z = input.TEXCOORD4.w;
        u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat19.xyz : u_xlat20.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat4.yzw = u_xlat4.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat19.x = fma(u_xlat4.y, 0.25, 0.75);
        u_xlat5.x = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat4.x = max(u_xlat19.x, u_xlat5.x);
        u_xlat4 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat4.x = dot(u_xlat4, FGlobals.unity_OcclusionMaskSelector);
    u_xlat4.x = clamp(u_xlat4.x, 0.0f, 1.0f);
    u_xlat19.x = _OcclusionMap.sample(sampler_OcclusionMap, input.TEXCOORD0.xy).y;
    u_xlat34 = (-FGlobals._OcclusionStrength) + 1.0;
    u_xlat19.x = fma(u_xlat19.x, FGlobals._OcclusionStrength, u_xlat34);
    u_xlat34 = (-FGlobals._Glossiness) + 1.0;
    u_xlat49 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat49 = u_xlat49 + u_xlat49;
    u_xlat5.xyz = fma(u_xlat2.xyz, (-float3(u_xlat49)), u_xlat3.xyz);
    u_xlat6.xyz = u_xlat4.xxx * FGlobals._LightColor0.xyz;
    if(u_xlatb48){
        u_xlatb48 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = input.TEXCOORD3.www * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.www, u_xlat7.xyz);
        u_xlat7.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD4.www, u_xlat7.xyz);
        u_xlat7.xyz = u_xlat7.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat23.x = input.TEXCOORD2.w;
        u_xlat23.y = input.TEXCOORD3.w;
        u_xlat23.z = input.TEXCOORD4.w;
        u_xlat7.xyz = (bool(u_xlatb48)) ? u_xlat7.xyz : u_xlat23.xyz;
        u_xlat7.xyz = u_xlat7.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat7.yzw = u_xlat7.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat48 = u_xlat7.y * 0.25;
        u_xlat4.x = FGlobals.unity_ProbeVolumeParams.z * 0.5;
        u_xlat49 = fma((-FGlobals.unity_ProbeVolumeParams.z), 0.5, 0.25);
        u_xlat48 = max(u_xlat48, u_xlat4.x);
        u_xlat7.x = min(u_xlat49, u_xlat48);
        u_xlat8 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat7.xzw);
        u_xlat9.xyz = u_xlat7.xzw + float3(0.25, 0.0, 0.0);
        u_xlat9 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat9.xyz);
        u_xlat7.xyz = u_xlat7.xzw + float3(0.5, 0.0, 0.0);
        u_xlat7 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat7.xyz);
        u_xlat2.w = 1.0;
        u_xlat8.x = dot(u_xlat8, u_xlat2);
        u_xlat8.y = dot(u_xlat9, u_xlat2);
        u_xlat8.z = dot(u_xlat7, u_xlat2);
    } else {
        u_xlat2.w = 1.0;
        u_xlat8.x = dot(FGlobals.unity_SHAr, u_xlat2);
        u_xlat8.y = dot(FGlobals.unity_SHAg, u_xlat2);
        u_xlat8.z = dot(FGlobals.unity_SHAb, u_xlat2);
    }
    u_xlat7.xyz = u_xlat8.xyz + input.TEXCOORD5.xyz;
    u_xlat7.xyz = max(u_xlat7.xyz, float3(0.0, 0.0, 0.0));
    u_xlatb47 = 0.0<FGlobals.unity_SpecCube0_ProbePosition.w;
    if(u_xlatb47){
        u_xlat47 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat47 = rsqrt(u_xlat47);
        u_xlat8.xyz = float3(u_xlat47) * u_xlat5.xyz;
        u_xlat9.x = input.TEXCOORD2.w;
        u_xlat9.y = input.TEXCOORD3.w;
        u_xlat9.z = input.TEXCOORD4.w;
        u_xlat10.xyz = (-u_xlat9.xyz) + FGlobals.unity_SpecCube0_BoxMax.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
        u_xlat11.xyz = (-u_xlat9.xyz) + FGlobals.unity_SpecCube0_BoxMin.xyz;
        u_xlat11.xyz = u_xlat11.xyz / u_xlat8.xyz;
        u_xlatb12.xyz = (float3(0.0, 0.0, 0.0)<u_xlat8.xyz);
        {
            float3 hlslcc_movcTemp = u_xlat10;
            hlslcc_movcTemp.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
            hlslcc_movcTemp.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
            hlslcc_movcTemp.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
            u_xlat10 = hlslcc_movcTemp;
        }
        u_xlat47 = min(u_xlat10.y, u_xlat10.x);
        u_xlat47 = min(u_xlat10.z, u_xlat47);
        u_xlat9.xyz = u_xlat9.xyz + (-FGlobals.unity_SpecCube0_ProbePosition.xyz);
        u_xlat8.xyz = fma(u_xlat8.xyz, float3(u_xlat47), u_xlat9.xyz);
    } else {
        u_xlat8.xyz = u_xlat5.xyz;
    }
    u_xlat47 = fma((-u_xlat34), 0.699999988, 1.70000005);
    u_xlat47 = u_xlat47 * u_xlat34;
    u_xlat47 = u_xlat47 * 6.0;
    u_xlat8 = unity_SpecCube0.sample(samplerunity_SpecCube0, u_xlat8.xyz, level(u_xlat47));
    u_xlat48 = u_xlat8.w + -1.0;
    u_xlat48 = fma(FGlobals.unity_SpecCube0_HDR.w, u_xlat48, 1.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * FGlobals.unity_SpecCube0_HDR.y;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * FGlobals.unity_SpecCube0_HDR.x;
    u_xlat9.xyz = u_xlat8.xyz * float3(u_xlat48);
    u_xlatb4 = FGlobals.unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb4){
        u_xlatb4 = 0.0<FGlobals.unity_SpecCube1_ProbePosition.w;
        if(u_xlatb4){
            u_xlat4.x = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat4.x = rsqrt(u_xlat4.x);
            u_xlat10.xyz = u_xlat4.xxx * u_xlat5.xyz;
            u_xlat11.x = input.TEXCOORD2.w;
            u_xlat11.y = input.TEXCOORD3.w;
            u_xlat11.z = input.TEXCOORD4.w;
            u_xlat12.xyz = (-u_xlat11.xyz) + FGlobals.unity_SpecCube1_BoxMax.xyz;
            u_xlat12.xyz = u_xlat12.xyz / u_xlat10.xyz;
            u_xlat13.xyz = (-u_xlat11.xyz) + FGlobals.unity_SpecCube1_BoxMin.xyz;
            u_xlat13.xyz = u_xlat13.xyz / u_xlat10.xyz;
            u_xlatb14.xyz = (float3(0.0, 0.0, 0.0)<u_xlat10.xyz);
            {
                float3 hlslcc_movcTemp = u_xlat12;
                hlslcc_movcTemp.x = (u_xlatb14.x) ? u_xlat12.x : u_xlat13.x;
                hlslcc_movcTemp.y = (u_xlatb14.y) ? u_xlat12.y : u_xlat13.y;
                hlslcc_movcTemp.z = (u_xlatb14.z) ? u_xlat12.z : u_xlat13.z;
                u_xlat12 = hlslcc_movcTemp;
            }
            u_xlat4.x = min(u_xlat12.y, u_xlat12.x);
            u_xlat4.x = min(u_xlat12.z, u_xlat4.x);
            u_xlat11.xyz = u_xlat11.xyz + (-FGlobals.unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = fma(u_xlat10.xyz, u_xlat4.xxx, u_xlat11.xyz);
        }
        u_xlat5 = unity_SpecCube1.sample(samplerunity_SpecCube0, u_xlat5.xyz, level(u_xlat47));
        u_xlat47 = u_xlat5.w + -1.0;
        u_xlat47 = fma(FGlobals.unity_SpecCube1_HDR.w, u_xlat47, 1.0);
        u_xlat47 = log2(u_xlat47);
        u_xlat47 = u_xlat47 * FGlobals.unity_SpecCube1_HDR.y;
        u_xlat47 = exp2(u_xlat47);
        u_xlat47 = u_xlat47 * FGlobals.unity_SpecCube1_HDR.x;
        u_xlat5.xyz = u_xlat5.xyz * float3(u_xlat47);
        u_xlat8.xyz = fma(float3(u_xlat48), u_xlat8.xyz, (-u_xlat5.xyz));
        u_xlat9.xyz = fma(FGlobals.unity_SpecCube0_BoxMin.www, u_xlat8.xyz, u_xlat5.xyz);
    }
    u_xlat5.xyz = u_xlat19.xxx * u_xlat9.xyz;
    u_xlat8.xyz = fma((-input.TEXCOORD1.xyz), float3(u_xlat46), FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat46 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat46 = max(u_xlat46, 0.00100000005);
    u_xlat46 = rsqrt(u_xlat46);
    u_xlat8.xyz = float3(u_xlat46) * u_xlat8.xyz;
    u_xlat46 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat47 = dot(u_xlat2.xyz, FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat47 = clamp(u_xlat47, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat17.x = dot(FGlobals._WorldSpaceLightPos0.xyz, u_xlat8.xyz);
    u_xlat17.x = clamp(u_xlat17.x, 0.0f, 1.0f);
    u_xlat32 = u_xlat17.x * u_xlat17.x;
    u_xlat32 = dot(float2(u_xlat32), float2(u_xlat34));
    u_xlat32 = u_xlat32 + -0.5;
    u_xlat3.x = (-u_xlat47) + 1.0;
    u_xlat18 = u_xlat3.x * u_xlat3.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat3.x = u_xlat3.x * u_xlat18;
    u_xlat3.x = fma(u_xlat32, u_xlat3.x, 1.0);
    u_xlat18 = -abs(u_xlat46) + 1.0;
    u_xlat33 = u_xlat18 * u_xlat18;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat18 = u_xlat18 * u_xlat33;
    u_xlat32 = fma(u_xlat32, u_xlat18, 1.0);
    u_xlat32 = u_xlat32 * u_xlat3.x;
    u_xlat32 = u_xlat47 * u_xlat32;
    u_xlat3.x = u_xlat34 * u_xlat34;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat33 = (-u_xlat3.x) + 1.0;
    u_xlat48 = fma(abs(u_xlat46), u_xlat33, u_xlat3.x);
    u_xlat33 = fma(u_xlat47, u_xlat33, u_xlat3.x);
    u_xlat46 = abs(u_xlat46) * u_xlat33;
    u_xlat46 = fma(u_xlat47, u_xlat48, u_xlat46);
    u_xlat46 = u_xlat46 + 9.99999975e-06;
    u_xlat46 = 0.5 / u_xlat46;
    u_xlat33 = u_xlat3.x * u_xlat3.x;
    u_xlat48 = fma(u_xlat2.x, u_xlat33, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat48, u_xlat2.x, 1.0);
    u_xlat33 = u_xlat33 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat2.x = u_xlat33 / u_xlat2.x;
    u_xlat46 = u_xlat46 * u_xlat2.x;
    u_xlat46 = u_xlat47 * u_xlat46;
    u_xlat46 = u_xlat46 * 3.14159274;
    u_xlat46 = max(u_xlat46, 0.0);
    u_xlat2.x = fma(u_xlat3.x, u_xlat3.x, 1.0);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat47 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb47 = u_xlat47!=0.0;
    u_xlat47 = u_xlatb47 ? 1.0 : float(0.0);
    u_xlat46 = u_xlat46 * u_xlat47;
    u_xlat45 = (-u_xlat45) + FGlobals._Glossiness;
    u_xlat45 = u_xlat45 + 1.0;
    u_xlat45 = clamp(u_xlat45, 0.0f, 1.0f);
    u_xlat3.xzw = float3(u_xlat32) * u_xlat6.xyz;
    u_xlat3.xzw = fma(u_xlat7.xyz, u_xlat19.xxx, u_xlat3.xzw);
    u_xlat4.xyz = u_xlat6.xyz * float3(u_xlat46);
    u_xlat46 = (-u_xlat17.x) + 1.0;
    u_xlat17.x = u_xlat46 * u_xlat46;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat46 = u_xlat46 * u_xlat17.x;
    u_xlat17.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat17.xyz = fma(u_xlat17.xyz, float3(u_xlat46), u_xlat0.xyz);
    u_xlat17.xyz = u_xlat17.xyz * u_xlat4.xyz;
    u_xlat1.xyz = fma(u_xlat1.xyz, u_xlat3.xzw, u_xlat17.xyz);
    u_xlat2.xyz = u_xlat5.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + float3(u_xlat45);
    u_xlat0.xyz = fma(float3(u_xlat18), u_xlat3.xzw, u_xlat0.xyz);
    output.SV_Target0.xyz = fma(u_xlat2.xyz, u_xlat0.xyz, u_xlat1.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL SHADOWS_SCREEN _EMISSION
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 1 sampler slot 5
Set 2D Texture "_OcclusionMap" to slot 2 sampler slot 3
Set 2D Texture "_EmissionMap" to slot 3 sampler slot 4
Set CUBE Texture "unity_SpecCube0" to slot 4 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 5 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 6 sampler slot 1

Constant Buffer "FGlobals" (448 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 80
  Matrix4x4 unity_ProbeVolumeWorldToObject at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_SpecCube0_BoxMax at 144
  Vector4 unity_SpecCube0_BoxMin at 160
  Vector4 unity_SpecCube0_ProbePosition at 176
  Vector4 unity_SpecCube0_HDR at 192
  Vector4 unity_SpecCube1_BoxMax at 208
  Vector4 unity_SpecCube1_BoxMin at 224
  Vector4 unity_SpecCube1_ProbePosition at 240
  Vector4 unity_SpecCube1_HDR at 256
  Vector4 unity_ProbeVolumeParams at 272
  Vector3 unity_ProbeVolumeSizeInv at 352
  Vector3 unity_ProbeVolumeMin at 368
  Vector4 _LightColor0 at 384
  Vector4 _Color at 400
  Float _Metallic at 416
  Float _Glossiness at 420
  Float _OcclusionStrength at 424
  Vector4 _EmissionColor at 432
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_SpecCube0_BoxMax;
    float4 unity_SpecCube0_BoxMin;
    float4 unity_SpecCube0_ProbePosition;
    float4 unity_SpecCube0_HDR;
    float4 unity_SpecCube1_BoxMax;
    float4 unity_SpecCube1_BoxMin;
    float4 unity_SpecCube1_ProbePosition;
    float4 unity_SpecCube1_HDR;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float _OcclusionStrength;
    float4 _EmissionColor;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_SpecCube0 [[ sampler (0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    sampler sampler_OcclusionMap [[ sampler (3) ]],
    sampler sampler_EmissionMap [[ sampler (4) ]],
    sampler sampler_ShadowMapTexture [[ sampler (5) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _ShadowMapTexture [[ texture(1) ]] ,
    texture2d<float, access::sample > _OcclusionMap [[ texture(2) ]] ,
    texture2d<float, access::sample > _EmissionMap [[ texture(3) ]] ,
    texturecube<float, access::sample > unity_SpecCube0 [[ texture(4) ]] ,
    texturecube<float, access::sample > unity_SpecCube1 [[ texture(5) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(6) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float4 u_xlat3;
    float3 u_xlat4;
    float4 u_xlat5;
    float3 u_xlat6;
    float4 u_xlat7;
    float3 u_xlat8;
    float4 u_xlat9;
    float3 u_xlat10;
    bool3 u_xlatb10;
    float3 u_xlat11;
    bool3 u_xlatb12;
    float3 u_xlat15;
    float u_xlat16;
    float u_xlat28;
    float u_xlat29;
    float u_xlat39;
    float u_xlat40;
    float u_xlat41;
    bool u_xlatb41;
    float u_xlat42;
    bool u_xlatb42;
    float u_xlat43;
    float u_xlat44;
    float u_xlat45;
    bool u_xlatb45;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat39 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat39) * u_xlat1.xyz;
    u_xlat40 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat40 = rsqrt(u_xlat40);
    u_xlat2.xyz = float3(u_xlat40) * input.TEXCOORD4.xyz;
    u_xlat40 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat40 = rsqrt(u_xlat40);
    u_xlat3.xyz = float3(u_xlat40) * input.TEXCOORD1.xyz;
    u_xlat4.x = input.TEXCOORD2.w;
    u_xlat4.y = input.TEXCOORD3.w;
    u_xlat4.z = input.TEXCOORD4.w;
    u_xlat5.xyz = (-u_xlat4.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat6.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat41 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat4.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat42 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat42 = sqrt(u_xlat42);
    u_xlat42 = (-u_xlat41) + u_xlat42;
    u_xlat41 = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat42, u_xlat41);
    u_xlat41 = fma(u_xlat41, FGlobals._LightShadowData.z, FGlobals._LightShadowData.w);
    u_xlat41 = clamp(u_xlat41, 0.0f, 1.0f);
    u_xlatb42 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb42){
        u_xlatb42 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = input.TEXCOORD3.www * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.www, u_xlat5.xyz);
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD4.www, u_xlat5.xyz);
        u_xlat5.xyz = u_xlat5.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb42)) ? u_xlat5.xyz : u_xlat4.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat5.yzw = u_xlat5.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat42 = fma(u_xlat5.y, 0.25, 0.75);
        u_xlat43 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat5.x = max(u_xlat42, u_xlat43);
        u_xlat5 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat42 = dot(u_xlat5, FGlobals.unity_OcclusionMaskSelector);
    u_xlat42 = clamp(u_xlat42, 0.0f, 1.0f);
    u_xlat5.xy = input.TEXCOORD7.xy / input.TEXCOORD7.ww;
    u_xlat43 = _ShadowMapTexture.sample(sampler_ShadowMapTexture, u_xlat5.xy).x;
    u_xlat42 = u_xlat42 + (-u_xlat43);
    u_xlat41 = fma(u_xlat41, u_xlat42, u_xlat43);
    u_xlat42 = _OcclusionMap.sample(sampler_OcclusionMap, input.TEXCOORD0.xy).y;
    u_xlat43 = (-FGlobals._OcclusionStrength) + 1.0;
    u_xlat42 = fma(u_xlat42, FGlobals._OcclusionStrength, u_xlat43);
    u_xlat43 = (-FGlobals._Glossiness) + 1.0;
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat5.x = u_xlat5.x + u_xlat5.x;
    u_xlat5.xyz = fma(u_xlat2.xyz, (-u_xlat5.xxx), u_xlat3.xyz);
    u_xlat6.xyz = float3(u_xlat41) * FGlobals._LightColor0.xyz;
    u_xlatb41 = 0.0<FGlobals.unity_SpecCube0_ProbePosition.w;
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat41 = rsqrt(u_xlat41);
        u_xlat7.xyz = float3(u_xlat41) * u_xlat5.xyz;
        u_xlat8.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
        u_xlat9.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
        u_xlatb10.xyz = (float3(0.0, 0.0, 0.0)<u_xlat7.xyz);
        {
            float3 hlslcc_movcTemp = u_xlat8;
            hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat8 = hlslcc_movcTemp;
        }
        u_xlat41 = min(u_xlat8.y, u_xlat8.x);
        u_xlat41 = min(u_xlat8.z, u_xlat41);
        u_xlat8.xyz = u_xlat4.xyz + (-FGlobals.unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = fma(u_xlat7.xyz, float3(u_xlat41), u_xlat8.xyz);
    } else {
        u_xlat7.xyz = u_xlat5.xyz;
    }
    u_xlat41 = fma((-u_xlat43), 0.699999988, 1.70000005);
    u_xlat41 = u_xlat41 * u_xlat43;
    u_xlat41 = u_xlat41 * 6.0;
    u_xlat7 = unity_SpecCube0.sample(samplerunity_SpecCube0, u_xlat7.xyz, level(u_xlat41));
    u_xlat44 = u_xlat7.w + -1.0;
    u_xlat44 = fma(FGlobals.unity_SpecCube0_HDR.w, u_xlat44, 1.0);
    u_xlat44 = log2(u_xlat44);
    u_xlat44 = u_xlat44 * FGlobals.unity_SpecCube0_HDR.y;
    u_xlat44 = exp2(u_xlat44);
    u_xlat44 = u_xlat44 * FGlobals.unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat7.xyz * float3(u_xlat44);
    u_xlatb45 = FGlobals.unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb45){
        u_xlatb45 = 0.0<FGlobals.unity_SpecCube1_ProbePosition.w;
        if(u_xlatb45){
            u_xlat45 = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat45 = rsqrt(u_xlat45);
            u_xlat9.xyz = u_xlat5.xyz * float3(u_xlat45);
            u_xlat10.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
            u_xlat11.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
            u_xlatb12.xyz = (float3(0.0, 0.0, 0.0)<u_xlat9.xyz);
            {
                float3 hlslcc_movcTemp = u_xlat10;
                hlslcc_movcTemp.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
                hlslcc_movcTemp.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
                hlslcc_movcTemp.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
                u_xlat10 = hlslcc_movcTemp;
            }
            u_xlat45 = min(u_xlat10.y, u_xlat10.x);
            u_xlat45 = min(u_xlat10.z, u_xlat45);
            u_xlat4.xyz = u_xlat4.xyz + (-FGlobals.unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = fma(u_xlat9.xyz, float3(u_xlat45), u_xlat4.xyz);
        }
        u_xlat9 = unity_SpecCube1.sample(samplerunity_SpecCube0, u_xlat5.xyz, level(u_xlat41));
        u_xlat41 = u_xlat9.w + -1.0;
        u_xlat41 = fma(FGlobals.unity_SpecCube1_HDR.w, u_xlat41, 1.0);
        u_xlat41 = log2(u_xlat41);
        u_xlat41 = u_xlat41 * FGlobals.unity_SpecCube1_HDR.y;
        u_xlat41 = exp2(u_xlat41);
        u_xlat41 = u_xlat41 * FGlobals.unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat9.xyz * float3(u_xlat41);
        u_xlat5.xyz = fma(float3(u_xlat44), u_xlat7.xyz, (-u_xlat4.xyz));
        u_xlat8.xyz = fma(FGlobals.unity_SpecCube0_BoxMin.www, u_xlat5.xyz, u_xlat4.xyz);
    }
    u_xlat4.xyz = float3(u_xlat42) * u_xlat8.xyz;
    u_xlat5.xyz = fma((-input.TEXCOORD1.xyz), float3(u_xlat40), FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat40 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat40 = max(u_xlat40, 0.00100000005);
    u_xlat40 = rsqrt(u_xlat40);
    u_xlat5.xyz = float3(u_xlat40) * u_xlat5.xyz;
    u_xlat40 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat41 = dot(u_xlat2.xyz, FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat41 = clamp(u_xlat41, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat15.x = dot(FGlobals._WorldSpaceLightPos0.xyz, u_xlat5.xyz);
    u_xlat15.x = clamp(u_xlat15.x, 0.0f, 1.0f);
    u_xlat28 = u_xlat15.x * u_xlat15.x;
    u_xlat28 = dot(float2(u_xlat28), float2(u_xlat43));
    u_xlat28 = u_xlat28 + -0.5;
    u_xlat3.x = (-u_xlat41) + 1.0;
    u_xlat16 = u_xlat3.x * u_xlat3.x;
    u_xlat16 = u_xlat16 * u_xlat16;
    u_xlat3.x = u_xlat3.x * u_xlat16;
    u_xlat3.x = fma(u_xlat28, u_xlat3.x, 1.0);
    u_xlat16 = -abs(u_xlat40) + 1.0;
    u_xlat29 = u_xlat16 * u_xlat16;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat16 = u_xlat16 * u_xlat29;
    u_xlat28 = fma(u_xlat28, u_xlat16, 1.0);
    u_xlat28 = u_xlat28 * u_xlat3.x;
    u_xlat28 = u_xlat41 * u_xlat28;
    u_xlat3.x = u_xlat43 * u_xlat43;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat29 = (-u_xlat3.x) + 1.0;
    u_xlat42 = fma(abs(u_xlat40), u_xlat29, u_xlat3.x);
    u_xlat29 = fma(u_xlat41, u_xlat29, u_xlat3.x);
    u_xlat40 = abs(u_xlat40) * u_xlat29;
    u_xlat40 = fma(u_xlat41, u_xlat42, u_xlat40);
    u_xlat40 = u_xlat40 + 9.99999975e-06;
    u_xlat40 = 0.5 / u_xlat40;
    u_xlat29 = u_xlat3.x * u_xlat3.x;
    u_xlat42 = fma(u_xlat2.x, u_xlat29, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat42, u_xlat2.x, 1.0);
    u_xlat29 = u_xlat29 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat2.x = u_xlat29 / u_xlat2.x;
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat40 = u_xlat41 * u_xlat40;
    u_xlat40 = u_xlat40 * 3.14159274;
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat2.x = fma(u_xlat3.x, u_xlat3.x, 1.0);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat41 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb41 = u_xlat41!=0.0;
    u_xlat41 = u_xlatb41 ? 1.0 : float(0.0);
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat39 = (-u_xlat39) + FGlobals._Glossiness;
    u_xlat39 = u_xlat39 + 1.0;
    u_xlat39 = clamp(u_xlat39, 0.0f, 1.0f);
    u_xlat3.xzw = float3(u_xlat28) * u_xlat6.xyz;
    u_xlat5.xyz = u_xlat6.xyz * float3(u_xlat40);
    u_xlat40 = (-u_xlat15.x) + 1.0;
    u_xlat15.x = u_xlat40 * u_xlat40;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat15.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat15.xyz = fma(u_xlat15.xyz, float3(u_xlat40), u_xlat0.xyz);
    u_xlat15.xyz = u_xlat15.xyz * u_xlat5.xyz;
    u_xlat1.xyz = fma(u_xlat1.xyz, u_xlat3.xzw, u_xlat15.xyz);
    u_xlat2.xyz = u_xlat4.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + float3(u_xlat39);
    u_xlat0.xyz = fma(float3(u_xlat16), u_xlat3.xzw, u_xlat0.xyz);
    u_xlat0.xyz = fma(u_xlat2.xyz, u_xlat0.xyz, u_xlat1.xyz);
    u_xlat1.xyz = _EmissionMap.sample(sampler_EmissionMap, input.TEXCOORD0.xy).xyz;
    output.SV_Target0.xyz = fma(u_xlat1.xyz, FGlobals._EmissionColor.xyz, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL SHADOWS_SCREEN
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 1 sampler slot 4
Set 2D Texture "_OcclusionMap" to slot 2 sampler slot 3
Set CUBE Texture "unity_SpecCube0" to slot 3 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 4 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 5 sampler slot 1

Constant Buffer "FGlobals" (428 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 80
  Matrix4x4 unity_ProbeVolumeWorldToObject at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_SpecCube0_BoxMax at 144
  Vector4 unity_SpecCube0_BoxMin at 160
  Vector4 unity_SpecCube0_ProbePosition at 176
  Vector4 unity_SpecCube0_HDR at 192
  Vector4 unity_SpecCube1_BoxMax at 208
  Vector4 unity_SpecCube1_BoxMin at 224
  Vector4 unity_SpecCube1_ProbePosition at 240
  Vector4 unity_SpecCube1_HDR at 256
  Vector4 unity_ProbeVolumeParams at 272
  Vector3 unity_ProbeVolumeSizeInv at 352
  Vector3 unity_ProbeVolumeMin at 368
  Vector4 _LightColor0 at 384
  Vector4 _Color at 400
  Float _Metallic at 416
  Float _Glossiness at 420
  Float _OcclusionStrength at 424
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_SpecCube0_BoxMax;
    float4 unity_SpecCube0_BoxMin;
    float4 unity_SpecCube0_ProbePosition;
    float4 unity_SpecCube0_HDR;
    float4 unity_SpecCube1_BoxMax;
    float4 unity_SpecCube1_BoxMin;
    float4 unity_SpecCube1_ProbePosition;
    float4 unity_SpecCube1_HDR;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float _OcclusionStrength;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_SpecCube0 [[ sampler (0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    sampler sampler_OcclusionMap [[ sampler (3) ]],
    sampler sampler_ShadowMapTexture [[ sampler (4) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _ShadowMapTexture [[ texture(1) ]] ,
    texture2d<float, access::sample > _OcclusionMap [[ texture(2) ]] ,
    texturecube<float, access::sample > unity_SpecCube0 [[ texture(3) ]] ,
    texturecube<float, access::sample > unity_SpecCube1 [[ texture(4) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(5) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float4 u_xlat3;
    float3 u_xlat4;
    float4 u_xlat5;
    float3 u_xlat6;
    float4 u_xlat7;
    float3 u_xlat8;
    float4 u_xlat9;
    float3 u_xlat10;
    bool3 u_xlatb10;
    float3 u_xlat11;
    bool3 u_xlatb12;
    float3 u_xlat15;
    float u_xlat16;
    float u_xlat28;
    float u_xlat29;
    float u_xlat39;
    float u_xlat40;
    float u_xlat41;
    bool u_xlatb41;
    float u_xlat42;
    bool u_xlatb42;
    float u_xlat43;
    float u_xlat44;
    float u_xlat45;
    bool u_xlatb45;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat39 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat39) * u_xlat1.xyz;
    u_xlat40 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat40 = rsqrt(u_xlat40);
    u_xlat2.xyz = float3(u_xlat40) * input.TEXCOORD4.xyz;
    u_xlat40 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat40 = rsqrt(u_xlat40);
    u_xlat3.xyz = float3(u_xlat40) * input.TEXCOORD1.xyz;
    u_xlat4.x = input.TEXCOORD2.w;
    u_xlat4.y = input.TEXCOORD3.w;
    u_xlat4.z = input.TEXCOORD4.w;
    u_xlat5.xyz = (-u_xlat4.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat6.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat41 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat4.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat42 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat42 = sqrt(u_xlat42);
    u_xlat42 = (-u_xlat41) + u_xlat42;
    u_xlat41 = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat42, u_xlat41);
    u_xlat41 = fma(u_xlat41, FGlobals._LightShadowData.z, FGlobals._LightShadowData.w);
    u_xlat41 = clamp(u_xlat41, 0.0f, 1.0f);
    u_xlatb42 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb42){
        u_xlatb42 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = input.TEXCOORD3.www * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.www, u_xlat5.xyz);
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD4.www, u_xlat5.xyz);
        u_xlat5.xyz = u_xlat5.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb42)) ? u_xlat5.xyz : u_xlat4.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat5.yzw = u_xlat5.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat42 = fma(u_xlat5.y, 0.25, 0.75);
        u_xlat43 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat5.x = max(u_xlat42, u_xlat43);
        u_xlat5 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat42 = dot(u_xlat5, FGlobals.unity_OcclusionMaskSelector);
    u_xlat42 = clamp(u_xlat42, 0.0f, 1.0f);
    u_xlat5.xy = input.TEXCOORD7.xy / input.TEXCOORD7.ww;
    u_xlat43 = _ShadowMapTexture.sample(sampler_ShadowMapTexture, u_xlat5.xy).x;
    u_xlat42 = u_xlat42 + (-u_xlat43);
    u_xlat41 = fma(u_xlat41, u_xlat42, u_xlat43);
    u_xlat42 = _OcclusionMap.sample(sampler_OcclusionMap, input.TEXCOORD0.xy).y;
    u_xlat43 = (-FGlobals._OcclusionStrength) + 1.0;
    u_xlat42 = fma(u_xlat42, FGlobals._OcclusionStrength, u_xlat43);
    u_xlat43 = (-FGlobals._Glossiness) + 1.0;
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat5.x = u_xlat5.x + u_xlat5.x;
    u_xlat5.xyz = fma(u_xlat2.xyz, (-u_xlat5.xxx), u_xlat3.xyz);
    u_xlat6.xyz = float3(u_xlat41) * FGlobals._LightColor0.xyz;
    u_xlatb41 = 0.0<FGlobals.unity_SpecCube0_ProbePosition.w;
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat41 = rsqrt(u_xlat41);
        u_xlat7.xyz = float3(u_xlat41) * u_xlat5.xyz;
        u_xlat8.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
        u_xlat9.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
        u_xlatb10.xyz = (float3(0.0, 0.0, 0.0)<u_xlat7.xyz);
        {
            float3 hlslcc_movcTemp = u_xlat8;
            hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat8 = hlslcc_movcTemp;
        }
        u_xlat41 = min(u_xlat8.y, u_xlat8.x);
        u_xlat41 = min(u_xlat8.z, u_xlat41);
        u_xlat8.xyz = u_xlat4.xyz + (-FGlobals.unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = fma(u_xlat7.xyz, float3(u_xlat41), u_xlat8.xyz);
    } else {
        u_xlat7.xyz = u_xlat5.xyz;
    }
    u_xlat41 = fma((-u_xlat43), 0.699999988, 1.70000005);
    u_xlat41 = u_xlat41 * u_xlat43;
    u_xlat41 = u_xlat41 * 6.0;
    u_xlat7 = unity_SpecCube0.sample(samplerunity_SpecCube0, u_xlat7.xyz, level(u_xlat41));
    u_xlat44 = u_xlat7.w + -1.0;
    u_xlat44 = fma(FGlobals.unity_SpecCube0_HDR.w, u_xlat44, 1.0);
    u_xlat44 = log2(u_xlat44);
    u_xlat44 = u_xlat44 * FGlobals.unity_SpecCube0_HDR.y;
    u_xlat44 = exp2(u_xlat44);
    u_xlat44 = u_xlat44 * FGlobals.unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat7.xyz * float3(u_xlat44);
    u_xlatb45 = FGlobals.unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb45){
        u_xlatb45 = 0.0<FGlobals.unity_SpecCube1_ProbePosition.w;
        if(u_xlatb45){
            u_xlat45 = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat45 = rsqrt(u_xlat45);
            u_xlat9.xyz = u_xlat5.xyz * float3(u_xlat45);
            u_xlat10.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
            u_xlat11.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
            u_xlatb12.xyz = (float3(0.0, 0.0, 0.0)<u_xlat9.xyz);
            {
                float3 hlslcc_movcTemp = u_xlat10;
                hlslcc_movcTemp.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
                hlslcc_movcTemp.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
                hlslcc_movcTemp.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
                u_xlat10 = hlslcc_movcTemp;
            }
            u_xlat45 = min(u_xlat10.y, u_xlat10.x);
            u_xlat45 = min(u_xlat10.z, u_xlat45);
            u_xlat4.xyz = u_xlat4.xyz + (-FGlobals.unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = fma(u_xlat9.xyz, float3(u_xlat45), u_xlat4.xyz);
        }
        u_xlat9 = unity_SpecCube1.sample(samplerunity_SpecCube0, u_xlat5.xyz, level(u_xlat41));
        u_xlat41 = u_xlat9.w + -1.0;
        u_xlat41 = fma(FGlobals.unity_SpecCube1_HDR.w, u_xlat41, 1.0);
        u_xlat41 = log2(u_xlat41);
        u_xlat41 = u_xlat41 * FGlobals.unity_SpecCube1_HDR.y;
        u_xlat41 = exp2(u_xlat41);
        u_xlat41 = u_xlat41 * FGlobals.unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat9.xyz * float3(u_xlat41);
        u_xlat5.xyz = fma(float3(u_xlat44), u_xlat7.xyz, (-u_xlat4.xyz));
        u_xlat8.xyz = fma(FGlobals.unity_SpecCube0_BoxMin.www, u_xlat5.xyz, u_xlat4.xyz);
    }
    u_xlat4.xyz = float3(u_xlat42) * u_xlat8.xyz;
    u_xlat5.xyz = fma((-input.TEXCOORD1.xyz), float3(u_xlat40), FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat40 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat40 = max(u_xlat40, 0.00100000005);
    u_xlat40 = rsqrt(u_xlat40);
    u_xlat5.xyz = float3(u_xlat40) * u_xlat5.xyz;
    u_xlat40 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat41 = dot(u_xlat2.xyz, FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat41 = clamp(u_xlat41, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat15.x = dot(FGlobals._WorldSpaceLightPos0.xyz, u_xlat5.xyz);
    u_xlat15.x = clamp(u_xlat15.x, 0.0f, 1.0f);
    u_xlat28 = u_xlat15.x * u_xlat15.x;
    u_xlat28 = dot(float2(u_xlat28), float2(u_xlat43));
    u_xlat28 = u_xlat28 + -0.5;
    u_xlat3.x = (-u_xlat41) + 1.0;
    u_xlat16 = u_xlat3.x * u_xlat3.x;
    u_xlat16 = u_xlat16 * u_xlat16;
    u_xlat3.x = u_xlat3.x * u_xlat16;
    u_xlat3.x = fma(u_xlat28, u_xlat3.x, 1.0);
    u_xlat16 = -abs(u_xlat40) + 1.0;
    u_xlat29 = u_xlat16 * u_xlat16;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat16 = u_xlat16 * u_xlat29;
    u_xlat28 = fma(u_xlat28, u_xlat16, 1.0);
    u_xlat28 = u_xlat28 * u_xlat3.x;
    u_xlat28 = u_xlat41 * u_xlat28;
    u_xlat3.x = u_xlat43 * u_xlat43;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat29 = (-u_xlat3.x) + 1.0;
    u_xlat42 = fma(abs(u_xlat40), u_xlat29, u_xlat3.x);
    u_xlat29 = fma(u_xlat41, u_xlat29, u_xlat3.x);
    u_xlat40 = abs(u_xlat40) * u_xlat29;
    u_xlat40 = fma(u_xlat41, u_xlat42, u_xlat40);
    u_xlat40 = u_xlat40 + 9.99999975e-06;
    u_xlat40 = 0.5 / u_xlat40;
    u_xlat29 = u_xlat3.x * u_xlat3.x;
    u_xlat42 = fma(u_xlat2.x, u_xlat29, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat42, u_xlat2.x, 1.0);
    u_xlat29 = u_xlat29 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat2.x = u_xlat29 / u_xlat2.x;
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat40 = u_xlat41 * u_xlat40;
    u_xlat40 = u_xlat40 * 3.14159274;
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat2.x = fma(u_xlat3.x, u_xlat3.x, 1.0);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat41 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb41 = u_xlat41!=0.0;
    u_xlat41 = u_xlatb41 ? 1.0 : float(0.0);
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat39 = (-u_xlat39) + FGlobals._Glossiness;
    u_xlat39 = u_xlat39 + 1.0;
    u_xlat39 = clamp(u_xlat39, 0.0f, 1.0f);
    u_xlat3.xzw = float3(u_xlat28) * u_xlat6.xyz;
    u_xlat5.xyz = u_xlat6.xyz * float3(u_xlat40);
    u_xlat40 = (-u_xlat15.x) + 1.0;
    u_xlat15.x = u_xlat40 * u_xlat40;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat15.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat15.xyz = fma(u_xlat15.xyz, float3(u_xlat40), u_xlat0.xyz);
    u_xlat15.xyz = u_xlat15.xyz * u_xlat5.xyz;
    u_xlat1.xyz = fma(u_xlat1.xyz, u_xlat3.xzw, u_xlat15.xyz);
    u_xlat2.xyz = u_xlat4.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + float3(u_xlat39);
    u_xlat0.xyz = fma(float3(u_xlat16), u_xlat3.xzw, u_xlat0.xyz);
    output.SV_Target0.xyz = fma(u_xlat2.xyz, u_xlat0.xyz, u_xlat1.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH SHADOWS_SCREEN _EMISSION
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 1 sampler slot 5
Set 2D Texture "_OcclusionMap" to slot 2 sampler slot 3
Set 2D Texture "_EmissionMap" to slot 3 sampler slot 4
Set CUBE Texture "unity_SpecCube0" to slot 4 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 5 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 6 sampler slot 1

Constant Buffer "FGlobals" (496 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 128
  Matrix4x4 unity_ProbeVolumeWorldToObject at 336
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_OcclusionMaskSelector at 80
  Vector4 _LightShadowData at 96
  Vector4 unity_ShadowFadeCenterAndType at 112
  Vector4 unity_SpecCube0_BoxMax at 192
  Vector4 unity_SpecCube0_BoxMin at 208
  Vector4 unity_SpecCube0_ProbePosition at 224
  Vector4 unity_SpecCube0_HDR at 240
  Vector4 unity_SpecCube1_BoxMax at 256
  Vector4 unity_SpecCube1_BoxMin at 272
  Vector4 unity_SpecCube1_ProbePosition at 288
  Vector4 unity_SpecCube1_HDR at 304
  Vector4 unity_ProbeVolumeParams at 320
  Vector3 unity_ProbeVolumeSizeInv at 400
  Vector3 unity_ProbeVolumeMin at 416
  Vector4 _LightColor0 at 432
  Vector4 _Color at 448
  Float _Metallic at 464
  Float _Glossiness at 468
  Float _OcclusionStrength at 472
  Vector4 _EmissionColor at 480
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_SHAr;
    float4 unity_SHAg;
    float4 unity_SHAb;
    float4 unity_OcclusionMaskSelector;
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_SpecCube0_BoxMax;
    float4 unity_SpecCube0_BoxMin;
    float4 unity_SpecCube0_ProbePosition;
    float4 unity_SpecCube0_HDR;
    float4 unity_SpecCube1_BoxMax;
    float4 unity_SpecCube1_BoxMin;
    float4 unity_SpecCube1_ProbePosition;
    float4 unity_SpecCube1_HDR;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float _OcclusionStrength;
    float4 _EmissionColor;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_SpecCube0 [[ sampler (0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    sampler sampler_OcclusionMap [[ sampler (3) ]],
    sampler sampler_EmissionMap [[ sampler (4) ]],
    sampler sampler_ShadowMapTexture [[ sampler (5) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _ShadowMapTexture [[ texture(1) ]] ,
    texture2d<float, access::sample > _OcclusionMap [[ texture(2) ]] ,
    texture2d<float, access::sample > _EmissionMap [[ texture(3) ]] ,
    texturecube<float, access::sample > unity_SpecCube0 [[ texture(4) ]] ,
    texturecube<float, access::sample > unity_SpecCube1 [[ texture(5) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(6) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float4 u_xlat5;
    bool u_xlatb5;
    float3 u_xlat6;
    float3 u_xlat7;
    float4 u_xlat8;
    float4 u_xlat9;
    float4 u_xlat10;
    float3 u_xlat11;
    float3 u_xlat12;
    bool3 u_xlatb12;
    float3 u_xlat13;
    bool3 u_xlatb14;
    float3 u_xlat17;
    float u_xlat18;
    float3 u_xlat20;
    float u_xlat32;
    float u_xlat33;
    float u_xlat35;
    float u_xlat45;
    float u_xlat46;
    float u_xlat47;
    bool u_xlatb47;
    float u_xlat48;
    bool u_xlatb48;
    float u_xlat49;
    bool u_xlatb49;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat45 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat45) * u_xlat1.xyz;
    u_xlat46 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat46 = rsqrt(u_xlat46);
    u_xlat2.xyz = float3(u_xlat46) * input.TEXCOORD4.xyz;
    u_xlat46 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat46 = rsqrt(u_xlat46);
    u_xlat3.xyz = float3(u_xlat46) * input.TEXCOORD1.xyz;
    u_xlat4.x = input.TEXCOORD2.w;
    u_xlat4.y = input.TEXCOORD3.w;
    u_xlat4.z = input.TEXCOORD4.w;
    u_xlat5.xyz = (-u_xlat4.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat6.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat48 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat4.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = sqrt(u_xlat49);
    u_xlat49 = (-u_xlat48) + u_xlat49;
    u_xlat48 = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat49, u_xlat48);
    u_xlat48 = fma(u_xlat48, FGlobals._LightShadowData.z, FGlobals._LightShadowData.w);
    u_xlat48 = clamp(u_xlat48, 0.0f, 1.0f);
    u_xlatb49 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb49){
        u_xlatb5 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat20.xyz = input.TEXCOORD3.www * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat20.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.www, u_xlat20.xyz);
        u_xlat20.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD4.www, u_xlat20.xyz);
        u_xlat20.xyz = u_xlat20.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb5)) ? u_xlat20.xyz : u_xlat4.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat5.yzw = u_xlat5.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat20.x = fma(u_xlat5.y, 0.25, 0.75);
        u_xlat6.x = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat5.x = max(u_xlat20.x, u_xlat6.x);
        u_xlat5 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat5.x = dot(u_xlat5, FGlobals.unity_OcclusionMaskSelector);
    u_xlat5.x = clamp(u_xlat5.x, 0.0f, 1.0f);
    u_xlat20.xy = input.TEXCOORD7.xy / input.TEXCOORD7.ww;
    u_xlat20.x = _ShadowMapTexture.sample(sampler_ShadowMapTexture, u_xlat20.xy).x;
    u_xlat5.x = (-u_xlat20.x) + u_xlat5.x;
    u_xlat48 = fma(u_xlat48, u_xlat5.x, u_xlat20.x);
    u_xlat5.x = _OcclusionMap.sample(sampler_OcclusionMap, input.TEXCOORD0.xy).y;
    u_xlat20.x = (-FGlobals._OcclusionStrength) + 1.0;
    u_xlat5.x = fma(u_xlat5.x, FGlobals._OcclusionStrength, u_xlat20.x);
    u_xlat20.x = (-FGlobals._Glossiness) + 1.0;
    u_xlat35 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat35 = u_xlat35 + u_xlat35;
    u_xlat6.xyz = fma(u_xlat2.xyz, (-float3(u_xlat35)), u_xlat3.xyz);
    u_xlat7.xyz = float3(u_xlat48) * FGlobals._LightColor0.xyz;
    if(u_xlatb49){
        u_xlatb48 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat8.xyz = input.TEXCOORD3.www * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat8.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.www, u_xlat8.xyz);
        u_xlat8.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD4.www, u_xlat8.xyz);
        u_xlat8.xyz = u_xlat8.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat8.xyz = (bool(u_xlatb48)) ? u_xlat8.xyz : u_xlat4.xyz;
        u_xlat8.xyz = u_xlat8.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat8.yzw = u_xlat8.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat48 = u_xlat8.y * 0.25;
        u_xlat49 = FGlobals.unity_ProbeVolumeParams.z * 0.5;
        u_xlat35 = fma((-FGlobals.unity_ProbeVolumeParams.z), 0.5, 0.25);
        u_xlat48 = max(u_xlat48, u_xlat49);
        u_xlat8.x = min(u_xlat35, u_xlat48);
        u_xlat9 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat8.xzw);
        u_xlat10.xyz = u_xlat8.xzw + float3(0.25, 0.0, 0.0);
        u_xlat10 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat10.xyz);
        u_xlat8.xyz = u_xlat8.xzw + float3(0.5, 0.0, 0.0);
        u_xlat8 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat8.xyz);
        u_xlat2.w = 1.0;
        u_xlat9.x = dot(u_xlat9, u_xlat2);
        u_xlat9.y = dot(u_xlat10, u_xlat2);
        u_xlat9.z = dot(u_xlat8, u_xlat2);
    } else {
        u_xlat2.w = 1.0;
        u_xlat9.x = dot(FGlobals.unity_SHAr, u_xlat2);
        u_xlat9.y = dot(FGlobals.unity_SHAg, u_xlat2);
        u_xlat9.z = dot(FGlobals.unity_SHAb, u_xlat2);
    }
    u_xlat8.xyz = u_xlat9.xyz + input.TEXCOORD5.xyz;
    u_xlat8.xyz = max(u_xlat8.xyz, float3(0.0, 0.0, 0.0));
    u_xlatb47 = 0.0<FGlobals.unity_SpecCube0_ProbePosition.w;
    if(u_xlatb47){
        u_xlat47 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat47 = rsqrt(u_xlat47);
        u_xlat9.xyz = float3(u_xlat47) * u_xlat6.xyz;
        u_xlat10.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube0_BoxMax.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
        u_xlat11.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube0_BoxMin.xyz;
        u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
        u_xlatb12.xyz = (float3(0.0, 0.0, 0.0)<u_xlat9.xyz);
        {
            float4 hlslcc_movcTemp = u_xlat10;
            hlslcc_movcTemp.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
            hlslcc_movcTemp.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
            hlslcc_movcTemp.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
            u_xlat10 = hlslcc_movcTemp;
        }
        u_xlat47 = min(u_xlat10.y, u_xlat10.x);
        u_xlat47 = min(u_xlat10.z, u_xlat47);
        u_xlat10.xyz = u_xlat4.xyz + (-FGlobals.unity_SpecCube0_ProbePosition.xyz);
        u_xlat9.xyz = fma(u_xlat9.xyz, float3(u_xlat47), u_xlat10.xyz);
    } else {
        u_xlat9.xyz = u_xlat6.xyz;
    }
    u_xlat47 = fma((-u_xlat20.x), 0.699999988, 1.70000005);
    u_xlat47 = u_xlat47 * u_xlat20.x;
    u_xlat47 = u_xlat47 * 6.0;
    u_xlat9 = unity_SpecCube0.sample(samplerunity_SpecCube0, u_xlat9.xyz, level(u_xlat47));
    u_xlat48 = u_xlat9.w + -1.0;
    u_xlat48 = fma(FGlobals.unity_SpecCube0_HDR.w, u_xlat48, 1.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * FGlobals.unity_SpecCube0_HDR.y;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * FGlobals.unity_SpecCube0_HDR.x;
    u_xlat10.xyz = u_xlat9.xyz * float3(u_xlat48);
    u_xlatb49 = FGlobals.unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb49){
        u_xlatb49 = 0.0<FGlobals.unity_SpecCube1_ProbePosition.w;
        if(u_xlatb49){
            u_xlat49 = dot(u_xlat6.xyz, u_xlat6.xyz);
            u_xlat49 = rsqrt(u_xlat49);
            u_xlat11.xyz = float3(u_xlat49) * u_xlat6.xyz;
            u_xlat12.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube1_BoxMax.xyz;
            u_xlat12.xyz = u_xlat12.xyz / u_xlat11.xyz;
            u_xlat13.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube1_BoxMin.xyz;
            u_xlat13.xyz = u_xlat13.xyz / u_xlat11.xyz;
            u_xlatb14.xyz = (float3(0.0, 0.0, 0.0)<u_xlat11.xyz);
            {
                float3 hlslcc_movcTemp = u_xlat12;
                hlslcc_movcTemp.x = (u_xlatb14.x) ? u_xlat12.x : u_xlat13.x;
                hlslcc_movcTemp.y = (u_xlatb14.y) ? u_xlat12.y : u_xlat13.y;
                hlslcc_movcTemp.z = (u_xlatb14.z) ? u_xlat12.z : u_xlat13.z;
                u_xlat12 = hlslcc_movcTemp;
            }
            u_xlat49 = min(u_xlat12.y, u_xlat12.x);
            u_xlat49 = min(u_xlat12.z, u_xlat49);
            u_xlat4.xyz = u_xlat4.xyz + (-FGlobals.unity_SpecCube1_ProbePosition.xyz);
            u_xlat6.xyz = fma(u_xlat11.xyz, float3(u_xlat49), u_xlat4.xyz);
        }
        u_xlat4 = unity_SpecCube1.sample(samplerunity_SpecCube0, u_xlat6.xyz, level(u_xlat47));
        u_xlat47 = u_xlat4.w + -1.0;
        u_xlat47 = fma(FGlobals.unity_SpecCube1_HDR.w, u_xlat47, 1.0);
        u_xlat47 = log2(u_xlat47);
        u_xlat47 = u_xlat47 * FGlobals.unity_SpecCube1_HDR.y;
        u_xlat47 = exp2(u_xlat47);
        u_xlat47 = u_xlat47 * FGlobals.unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat4.xyz * float3(u_xlat47);
        u_xlat6.xyz = fma(float3(u_xlat48), u_xlat9.xyz, (-u_xlat4.xyz));
        u_xlat10.xyz = fma(FGlobals.unity_SpecCube0_BoxMin.www, u_xlat6.xyz, u_xlat4.xyz);
    }
    u_xlat4.xyz = u_xlat5.xxx * u_xlat10.xyz;
    u_xlat6.xyz = fma((-input.TEXCOORD1.xyz), float3(u_xlat46), FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat46 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat46 = max(u_xlat46, 0.00100000005);
    u_xlat46 = rsqrt(u_xlat46);
    u_xlat6.xyz = float3(u_xlat46) * u_xlat6.xyz;
    u_xlat46 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat47 = dot(u_xlat2.xyz, FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat47 = clamp(u_xlat47, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat17.x = dot(FGlobals._WorldSpaceLightPos0.xyz, u_xlat6.xyz);
    u_xlat17.x = clamp(u_xlat17.x, 0.0f, 1.0f);
    u_xlat32 = u_xlat17.x * u_xlat17.x;
    u_xlat32 = dot(float2(u_xlat32), u_xlat20.xx);
    u_xlat32 = u_xlat32 + -0.5;
    u_xlat3.x = (-u_xlat47) + 1.0;
    u_xlat18 = u_xlat3.x * u_xlat3.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat3.x = u_xlat3.x * u_xlat18;
    u_xlat3.x = fma(u_xlat32, u_xlat3.x, 1.0);
    u_xlat18 = -abs(u_xlat46) + 1.0;
    u_xlat33 = u_xlat18 * u_xlat18;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat18 = u_xlat18 * u_xlat33;
    u_xlat32 = fma(u_xlat32, u_xlat18, 1.0);
    u_xlat32 = u_xlat32 * u_xlat3.x;
    u_xlat32 = u_xlat47 * u_xlat32;
    u_xlat3.x = u_xlat20.x * u_xlat20.x;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat33 = (-u_xlat3.x) + 1.0;
    u_xlat48 = fma(abs(u_xlat46), u_xlat33, u_xlat3.x);
    u_xlat33 = fma(u_xlat47, u_xlat33, u_xlat3.x);
    u_xlat46 = abs(u_xlat46) * u_xlat33;
    u_xlat46 = fma(u_xlat47, u_xlat48, u_xlat46);
    u_xlat46 = u_xlat46 + 9.99999975e-06;
    u_xlat46 = 0.5 / u_xlat46;
    u_xlat33 = u_xlat3.x * u_xlat3.x;
    u_xlat48 = fma(u_xlat2.x, u_xlat33, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat48, u_xlat2.x, 1.0);
    u_xlat33 = u_xlat33 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat2.x = u_xlat33 / u_xlat2.x;
    u_xlat46 = u_xlat46 * u_xlat2.x;
    u_xlat46 = u_xlat47 * u_xlat46;
    u_xlat46 = u_xlat46 * 3.14159274;
    u_xlat46 = max(u_xlat46, 0.0);
    u_xlat2.x = fma(u_xlat3.x, u_xlat3.x, 1.0);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat47 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb47 = u_xlat47!=0.0;
    u_xlat47 = u_xlatb47 ? 1.0 : float(0.0);
    u_xlat46 = u_xlat46 * u_xlat47;
    u_xlat45 = (-u_xlat45) + FGlobals._Glossiness;
    u_xlat45 = u_xlat45 + 1.0;
    u_xlat45 = clamp(u_xlat45, 0.0f, 1.0f);
    u_xlat3.xzw = float3(u_xlat32) * u_xlat7.xyz;
    u_xlat3.xzw = fma(u_xlat8.xyz, u_xlat5.xxx, u_xlat3.xzw);
    u_xlat5.xyz = u_xlat7.xyz * float3(u_xlat46);
    u_xlat46 = (-u_xlat17.x) + 1.0;
    u_xlat17.x = u_xlat46 * u_xlat46;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat46 = u_xlat46 * u_xlat17.x;
    u_xlat17.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat17.xyz = fma(u_xlat17.xyz, float3(u_xlat46), u_xlat0.xyz);
    u_xlat17.xyz = u_xlat17.xyz * u_xlat5.xyz;
    u_xlat1.xyz = fma(u_xlat1.xyz, u_xlat3.xzw, u_xlat17.xyz);
    u_xlat2.xyz = u_xlat4.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + float3(u_xlat45);
    u_xlat0.xyz = fma(float3(u_xlat18), u_xlat3.xzw, u_xlat0.xyz);
    u_xlat0.xyz = fma(u_xlat2.xyz, u_xlat0.xyz, u_xlat1.xyz);
    u_xlat1.xyz = _EmissionMap.sample(sampler_EmissionMap, input.TEXCOORD0.xy).xyz;
    output.SV_Target0.xyz = fma(u_xlat1.xyz, FGlobals._EmissionColor.xyz, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH SHADOWS_SCREEN
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 1 sampler slot 4
Set 2D Texture "_OcclusionMap" to slot 2 sampler slot 3
Set CUBE Texture "unity_SpecCube0" to slot 3 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 4 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 5 sampler slot 1

Constant Buffer "FGlobals" (476 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 128
  Matrix4x4 unity_ProbeVolumeWorldToObject at 336
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_OcclusionMaskSelector at 80
  Vector4 _LightShadowData at 96
  Vector4 unity_ShadowFadeCenterAndType at 112
  Vector4 unity_SpecCube0_BoxMax at 192
  Vector4 unity_SpecCube0_BoxMin at 208
  Vector4 unity_SpecCube0_ProbePosition at 224
  Vector4 unity_SpecCube0_HDR at 240
  Vector4 unity_SpecCube1_BoxMax at 256
  Vector4 unity_SpecCube1_BoxMin at 272
  Vector4 unity_SpecCube1_ProbePosition at 288
  Vector4 unity_SpecCube1_HDR at 304
  Vector4 unity_ProbeVolumeParams at 320
  Vector3 unity_ProbeVolumeSizeInv at 400
  Vector3 unity_ProbeVolumeMin at 416
  Vector4 _LightColor0 at 432
  Vector4 _Color at 448
  Float _Metallic at 464
  Float _Glossiness at 468
  Float _OcclusionStrength at 472
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_SHAr;
    float4 unity_SHAg;
    float4 unity_SHAb;
    float4 unity_OcclusionMaskSelector;
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_SpecCube0_BoxMax;
    float4 unity_SpecCube0_BoxMin;
    float4 unity_SpecCube0_ProbePosition;
    float4 unity_SpecCube0_HDR;
    float4 unity_SpecCube1_BoxMax;
    float4 unity_SpecCube1_BoxMin;
    float4 unity_SpecCube1_ProbePosition;
    float4 unity_SpecCube1_HDR;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float _OcclusionStrength;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_SpecCube0 [[ sampler (0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    sampler sampler_OcclusionMap [[ sampler (3) ]],
    sampler sampler_ShadowMapTexture [[ sampler (4) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _ShadowMapTexture [[ texture(1) ]] ,
    texture2d<float, access::sample > _OcclusionMap [[ texture(2) ]] ,
    texturecube<float, access::sample > unity_SpecCube0 [[ texture(3) ]] ,
    texturecube<float, access::sample > unity_SpecCube1 [[ texture(4) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(5) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float4 u_xlat5;
    bool u_xlatb5;
    float3 u_xlat6;
    float3 u_xlat7;
    float4 u_xlat8;
    float4 u_xlat9;
    float4 u_xlat10;
    float3 u_xlat11;
    float3 u_xlat12;
    bool3 u_xlatb12;
    float3 u_xlat13;
    bool3 u_xlatb14;
    float3 u_xlat17;
    float u_xlat18;
    float3 u_xlat20;
    float u_xlat32;
    float u_xlat33;
    float u_xlat35;
    float u_xlat45;
    float u_xlat46;
    float u_xlat47;
    bool u_xlatb47;
    float u_xlat48;
    bool u_xlatb48;
    float u_xlat49;
    bool u_xlatb49;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat45 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat45) * u_xlat1.xyz;
    u_xlat46 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat46 = rsqrt(u_xlat46);
    u_xlat2.xyz = float3(u_xlat46) * input.TEXCOORD4.xyz;
    u_xlat46 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat46 = rsqrt(u_xlat46);
    u_xlat3.xyz = float3(u_xlat46) * input.TEXCOORD1.xyz;
    u_xlat4.x = input.TEXCOORD2.w;
    u_xlat4.y = input.TEXCOORD3.w;
    u_xlat4.z = input.TEXCOORD4.w;
    u_xlat5.xyz = (-u_xlat4.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat6.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat48 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat4.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = sqrt(u_xlat49);
    u_xlat49 = (-u_xlat48) + u_xlat49;
    u_xlat48 = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat49, u_xlat48);
    u_xlat48 = fma(u_xlat48, FGlobals._LightShadowData.z, FGlobals._LightShadowData.w);
    u_xlat48 = clamp(u_xlat48, 0.0f, 1.0f);
    u_xlatb49 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb49){
        u_xlatb5 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat20.xyz = input.TEXCOORD3.www * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat20.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.www, u_xlat20.xyz);
        u_xlat20.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD4.www, u_xlat20.xyz);
        u_xlat20.xyz = u_xlat20.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb5)) ? u_xlat20.xyz : u_xlat4.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat5.yzw = u_xlat5.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat20.x = fma(u_xlat5.y, 0.25, 0.75);
        u_xlat6.x = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat5.x = max(u_xlat20.x, u_xlat6.x);
        u_xlat5 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat5.x = dot(u_xlat5, FGlobals.unity_OcclusionMaskSelector);
    u_xlat5.x = clamp(u_xlat5.x, 0.0f, 1.0f);
    u_xlat20.xy = input.TEXCOORD7.xy / input.TEXCOORD7.ww;
    u_xlat20.x = _ShadowMapTexture.sample(sampler_ShadowMapTexture, u_xlat20.xy).x;
    u_xlat5.x = (-u_xlat20.x) + u_xlat5.x;
    u_xlat48 = fma(u_xlat48, u_xlat5.x, u_xlat20.x);
    u_xlat5.x = _OcclusionMap.sample(sampler_OcclusionMap, input.TEXCOORD0.xy).y;
    u_xlat20.x = (-FGlobals._OcclusionStrength) + 1.0;
    u_xlat5.x = fma(u_xlat5.x, FGlobals._OcclusionStrength, u_xlat20.x);
    u_xlat20.x = (-FGlobals._Glossiness) + 1.0;
    u_xlat35 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat35 = u_xlat35 + u_xlat35;
    u_xlat6.xyz = fma(u_xlat2.xyz, (-float3(u_xlat35)), u_xlat3.xyz);
    u_xlat7.xyz = float3(u_xlat48) * FGlobals._LightColor0.xyz;
    if(u_xlatb49){
        u_xlatb48 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat8.xyz = input.TEXCOORD3.www * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat8.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.www, u_xlat8.xyz);
        u_xlat8.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD4.www, u_xlat8.xyz);
        u_xlat8.xyz = u_xlat8.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat8.xyz = (bool(u_xlatb48)) ? u_xlat8.xyz : u_xlat4.xyz;
        u_xlat8.xyz = u_xlat8.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat8.yzw = u_xlat8.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat48 = u_xlat8.y * 0.25;
        u_xlat49 = FGlobals.unity_ProbeVolumeParams.z * 0.5;
        u_xlat35 = fma((-FGlobals.unity_ProbeVolumeParams.z), 0.5, 0.25);
        u_xlat48 = max(u_xlat48, u_xlat49);
        u_xlat8.x = min(u_xlat35, u_xlat48);
        u_xlat9 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat8.xzw);
        u_xlat10.xyz = u_xlat8.xzw + float3(0.25, 0.0, 0.0);
        u_xlat10 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat10.xyz);
        u_xlat8.xyz = u_xlat8.xzw + float3(0.5, 0.0, 0.0);
        u_xlat8 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat8.xyz);
        u_xlat2.w = 1.0;
        u_xlat9.x = dot(u_xlat9, u_xlat2);
        u_xlat9.y = dot(u_xlat10, u_xlat2);
        u_xlat9.z = dot(u_xlat8, u_xlat2);
    } else {
        u_xlat2.w = 1.0;
        u_xlat9.x = dot(FGlobals.unity_SHAr, u_xlat2);
        u_xlat9.y = dot(FGlobals.unity_SHAg, u_xlat2);
        u_xlat9.z = dot(FGlobals.unity_SHAb, u_xlat2);
    }
    u_xlat8.xyz = u_xlat9.xyz + input.TEXCOORD5.xyz;
    u_xlat8.xyz = max(u_xlat8.xyz, float3(0.0, 0.0, 0.0));
    u_xlatb47 = 0.0<FGlobals.unity_SpecCube0_ProbePosition.w;
    if(u_xlatb47){
        u_xlat47 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat47 = rsqrt(u_xlat47);
        u_xlat9.xyz = float3(u_xlat47) * u_xlat6.xyz;
        u_xlat10.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube0_BoxMax.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
        u_xlat11.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube0_BoxMin.xyz;
        u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
        u_xlatb12.xyz = (float3(0.0, 0.0, 0.0)<u_xlat9.xyz);
        {
            float4 hlslcc_movcTemp = u_xlat10;
            hlslcc_movcTemp.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
            hlslcc_movcTemp.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
            hlslcc_movcTemp.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
            u_xlat10 = hlslcc_movcTemp;
        }
        u_xlat47 = min(u_xlat10.y, u_xlat10.x);
        u_xlat47 = min(u_xlat10.z, u_xlat47);
        u_xlat10.xyz = u_xlat4.xyz + (-FGlobals.unity_SpecCube0_ProbePosition.xyz);
        u_xlat9.xyz = fma(u_xlat9.xyz, float3(u_xlat47), u_xlat10.xyz);
    } else {
        u_xlat9.xyz = u_xlat6.xyz;
    }
    u_xlat47 = fma((-u_xlat20.x), 0.699999988, 1.70000005);
    u_xlat47 = u_xlat47 * u_xlat20.x;
    u_xlat47 = u_xlat47 * 6.0;
    u_xlat9 = unity_SpecCube0.sample(samplerunity_SpecCube0, u_xlat9.xyz, level(u_xlat47));
    u_xlat48 = u_xlat9.w + -1.0;
    u_xlat48 = fma(FGlobals.unity_SpecCube0_HDR.w, u_xlat48, 1.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * FGlobals.unity_SpecCube0_HDR.y;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * FGlobals.unity_SpecCube0_HDR.x;
    u_xlat10.xyz = u_xlat9.xyz * float3(u_xlat48);
    u_xlatb49 = FGlobals.unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb49){
        u_xlatb49 = 0.0<FGlobals.unity_SpecCube1_ProbePosition.w;
        if(u_xlatb49){
            u_xlat49 = dot(u_xlat6.xyz, u_xlat6.xyz);
            u_xlat49 = rsqrt(u_xlat49);
            u_xlat11.xyz = float3(u_xlat49) * u_xlat6.xyz;
            u_xlat12.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube1_BoxMax.xyz;
            u_xlat12.xyz = u_xlat12.xyz / u_xlat11.xyz;
            u_xlat13.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube1_BoxMin.xyz;
            u_xlat13.xyz = u_xlat13.xyz / u_xlat11.xyz;
            u_xlatb14.xyz = (float3(0.0, 0.0, 0.0)<u_xlat11.xyz);
            {
                float3 hlslcc_movcTemp = u_xlat12;
                hlslcc_movcTemp.x = (u_xlatb14.x) ? u_xlat12.x : u_xlat13.x;
                hlslcc_movcTemp.y = (u_xlatb14.y) ? u_xlat12.y : u_xlat13.y;
                hlslcc_movcTemp.z = (u_xlatb14.z) ? u_xlat12.z : u_xlat13.z;
                u_xlat12 = hlslcc_movcTemp;
            }
            u_xlat49 = min(u_xlat12.y, u_xlat12.x);
            u_xlat49 = min(u_xlat12.z, u_xlat49);
            u_xlat4.xyz = u_xlat4.xyz + (-FGlobals.unity_SpecCube1_ProbePosition.xyz);
            u_xlat6.xyz = fma(u_xlat11.xyz, float3(u_xlat49), u_xlat4.xyz);
        }
        u_xlat4 = unity_SpecCube1.sample(samplerunity_SpecCube0, u_xlat6.xyz, level(u_xlat47));
        u_xlat47 = u_xlat4.w + -1.0;
        u_xlat47 = fma(FGlobals.unity_SpecCube1_HDR.w, u_xlat47, 1.0);
        u_xlat47 = log2(u_xlat47);
        u_xlat47 = u_xlat47 * FGlobals.unity_SpecCube1_HDR.y;
        u_xlat47 = exp2(u_xlat47);
        u_xlat47 = u_xlat47 * FGlobals.unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat4.xyz * float3(u_xlat47);
        u_xlat6.xyz = fma(float3(u_xlat48), u_xlat9.xyz, (-u_xlat4.xyz));
        u_xlat10.xyz = fma(FGlobals.unity_SpecCube0_BoxMin.www, u_xlat6.xyz, u_xlat4.xyz);
    }
    u_xlat4.xyz = u_xlat5.xxx * u_xlat10.xyz;
    u_xlat6.xyz = fma((-input.TEXCOORD1.xyz), float3(u_xlat46), FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat46 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat46 = max(u_xlat46, 0.00100000005);
    u_xlat46 = rsqrt(u_xlat46);
    u_xlat6.xyz = float3(u_xlat46) * u_xlat6.xyz;
    u_xlat46 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat47 = dot(u_xlat2.xyz, FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat47 = clamp(u_xlat47, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat17.x = dot(FGlobals._WorldSpaceLightPos0.xyz, u_xlat6.xyz);
    u_xlat17.x = clamp(u_xlat17.x, 0.0f, 1.0f);
    u_xlat32 = u_xlat17.x * u_xlat17.x;
    u_xlat32 = dot(float2(u_xlat32), u_xlat20.xx);
    u_xlat32 = u_xlat32 + -0.5;
    u_xlat3.x = (-u_xlat47) + 1.0;
    u_xlat18 = u_xlat3.x * u_xlat3.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat3.x = u_xlat3.x * u_xlat18;
    u_xlat3.x = fma(u_xlat32, u_xlat3.x, 1.0);
    u_xlat18 = -abs(u_xlat46) + 1.0;
    u_xlat33 = u_xlat18 * u_xlat18;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat18 = u_xlat18 * u_xlat33;
    u_xlat32 = fma(u_xlat32, u_xlat18, 1.0);
    u_xlat32 = u_xlat32 * u_xlat3.x;
    u_xlat32 = u_xlat47 * u_xlat32;
    u_xlat3.x = u_xlat20.x * u_xlat20.x;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat33 = (-u_xlat3.x) + 1.0;
    u_xlat48 = fma(abs(u_xlat46), u_xlat33, u_xlat3.x);
    u_xlat33 = fma(u_xlat47, u_xlat33, u_xlat3.x);
    u_xlat46 = abs(u_xlat46) * u_xlat33;
    u_xlat46 = fma(u_xlat47, u_xlat48, u_xlat46);
    u_xlat46 = u_xlat46 + 9.99999975e-06;
    u_xlat46 = 0.5 / u_xlat46;
    u_xlat33 = u_xlat3.x * u_xlat3.x;
    u_xlat48 = fma(u_xlat2.x, u_xlat33, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat48, u_xlat2.x, 1.0);
    u_xlat33 = u_xlat33 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat2.x = u_xlat33 / u_xlat2.x;
    u_xlat46 = u_xlat46 * u_xlat2.x;
    u_xlat46 = u_xlat47 * u_xlat46;
    u_xlat46 = u_xlat46 * 3.14159274;
    u_xlat46 = max(u_xlat46, 0.0);
    u_xlat2.x = fma(u_xlat3.x, u_xlat3.x, 1.0);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat47 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb47 = u_xlat47!=0.0;
    u_xlat47 = u_xlatb47 ? 1.0 : float(0.0);
    u_xlat46 = u_xlat46 * u_xlat47;
    u_xlat45 = (-u_xlat45) + FGlobals._Glossiness;
    u_xlat45 = u_xlat45 + 1.0;
    u_xlat45 = clamp(u_xlat45, 0.0f, 1.0f);
    u_xlat3.xzw = float3(u_xlat32) * u_xlat7.xyz;
    u_xlat3.xzw = fma(u_xlat8.xyz, u_xlat5.xxx, u_xlat3.xzw);
    u_xlat5.xyz = u_xlat7.xyz * float3(u_xlat46);
    u_xlat46 = (-u_xlat17.x) + 1.0;
    u_xlat17.x = u_xlat46 * u_xlat46;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat46 = u_xlat46 * u_xlat17.x;
    u_xlat17.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat17.xyz = fma(u_xlat17.xyz, float3(u_xlat46), u_xlat0.xyz);
    u_xlat17.xyz = u_xlat17.xyz * u_xlat5.xyz;
    u_xlat1.xyz = fma(u_xlat1.xyz, u_xlat3.xzw, u_xlat17.xyz);
    u_xlat2.xyz = u_xlat4.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + float3(u_xlat45);
    u_xlat0.xyz = fma(float3(u_xlat18), u_xlat3.xzw, u_xlat0.xyz);
    output.SV_Target0.xyz = fma(u_xlat2.xyz, u_xlat0.xyz, u_xlat1.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL _EMISSION
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_OcclusionMap" to slot 1 sampler slot 3
Set 2D Texture "_EmissionMap" to slot 2 sampler slot 4
Set CUBE Texture "unity_SpecCube0" to slot 3 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 4 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 5 sampler slot 1

Constant Buffer "FGlobals" (336 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 176
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_OcclusionMaskSelector at 16
  Vector4 unity_SpecCube0_BoxMax at 32
  Vector4 unity_SpecCube0_BoxMin at 48
  Vector4 unity_SpecCube0_ProbePosition at 64
  Vector4 unity_SpecCube0_HDR at 80
  Vector4 unity_SpecCube1_BoxMax at 96
  Vector4 unity_SpecCube1_BoxMin at 112
  Vector4 unity_SpecCube1_ProbePosition at 128
  Vector4 unity_SpecCube1_HDR at 144
  Vector4 unity_ProbeVolumeParams at 160
  Vector3 unity_ProbeVolumeSizeInv at 240
  Vector3 unity_ProbeVolumeMin at 256
  Vector4 _LightColor0 at 272
  Vector4 _Color at 288
  Float _Metallic at 304
  Float _Glossiness at 308
  Float _OcclusionStrength at 312
  Vector4 _EmissionColor at 320
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 unity_SpecCube0_BoxMax;
    float4 unity_SpecCube0_BoxMin;
    float4 unity_SpecCube0_ProbePosition;
    float4 unity_SpecCube0_HDR;
    float4 unity_SpecCube1_BoxMax;
    float4 unity_SpecCube1_BoxMin;
    float4 unity_SpecCube1_ProbePosition;
    float4 unity_SpecCube1_HDR;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float _OcclusionStrength;
    float4 _EmissionColor;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_SpecCube0 [[ sampler (0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    sampler sampler_OcclusionMap [[ sampler (3) ]],
    sampler sampler_EmissionMap [[ sampler (4) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _OcclusionMap [[ texture(1) ]] ,
    texture2d<float, access::sample > _EmissionMap [[ texture(2) ]] ,
    texturecube<float, access::sample > unity_SpecCube0 [[ texture(3) ]] ,
    texturecube<float, access::sample > unity_SpecCube1 [[ texture(4) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(5) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float3 u_xlat5;
    float4 u_xlat6;
    float3 u_xlat7;
    float4 u_xlat8;
    float3 u_xlat9;
    float3 u_xlat10;
    bool3 u_xlatb10;
    float3 u_xlat11;
    bool3 u_xlatb12;
    float3 u_xlat15;
    float u_xlat16;
    float3 u_xlat17;
    float3 u_xlat18;
    float u_xlat28;
    float u_xlat29;
    float u_xlat39;
    float u_xlat40;
    float u_xlat41;
    bool u_xlatb41;
    float u_xlat42;
    float u_xlat44;
    float u_xlat45;
    bool u_xlatb45;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat39 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat39) * u_xlat1.xyz;
    u_xlat40 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat40 = rsqrt(u_xlat40);
    u_xlat2.xyz = float3(u_xlat40) * input.TEXCOORD4.xyz;
    u_xlat40 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat40 = rsqrt(u_xlat40);
    u_xlat3.xyz = float3(u_xlat40) * input.TEXCOORD1.xyz;
    u_xlatb41 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb41){
        u_xlatb41 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = input.TEXCOORD3.www * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.www, u_xlat4.xyz);
        u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD4.www, u_xlat4.xyz);
        u_xlat4.xyz = u_xlat4.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat18.x = input.TEXCOORD2.w;
        u_xlat18.y = input.TEXCOORD3.w;
        u_xlat18.z = input.TEXCOORD4.w;
        u_xlat4.xyz = (bool(u_xlatb41)) ? u_xlat4.xyz : u_xlat18.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat4.yzw = u_xlat4.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat41 = fma(u_xlat4.y, 0.25, 0.75);
        u_xlat42 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat4.x = max(u_xlat41, u_xlat42);
        u_xlat4 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat41 = dot(u_xlat4, FGlobals.unity_OcclusionMaskSelector);
    u_xlat41 = clamp(u_xlat41, 0.0f, 1.0f);
    u_xlat42 = _OcclusionMap.sample(sampler_OcclusionMap, input.TEXCOORD0.xy).y;
    u_xlat4.x = (-FGlobals._OcclusionStrength) + 1.0;
    u_xlat42 = fma(u_xlat42, FGlobals._OcclusionStrength, u_xlat4.x);
    u_xlat4.x = (-FGlobals._Glossiness) + 1.0;
    u_xlat17.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat17.x = u_xlat17.x + u_xlat17.x;
    u_xlat17.xyz = fma(u_xlat2.xyz, (-u_xlat17.xxx), u_xlat3.xyz);
    u_xlat5.xyz = float3(u_xlat41) * FGlobals._LightColor0.xyz;
    u_xlatb41 = 0.0<FGlobals.unity_SpecCube0_ProbePosition.w;
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat17.xyz, u_xlat17.xyz);
        u_xlat41 = rsqrt(u_xlat41);
        u_xlat6.xyz = float3(u_xlat41) * u_xlat17.xyz;
        u_xlat7.x = input.TEXCOORD2.w;
        u_xlat7.y = input.TEXCOORD3.w;
        u_xlat7.z = input.TEXCOORD4.w;
        u_xlat8.xyz = (-u_xlat7.xyz) + FGlobals.unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat6.xyz;
        u_xlat9.xyz = (-u_xlat7.xyz) + FGlobals.unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat6.xyz;
        u_xlatb10.xyz = (float3(0.0, 0.0, 0.0)<u_xlat6.xyz);
        {
            float4 hlslcc_movcTemp = u_xlat8;
            hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat8 = hlslcc_movcTemp;
        }
        u_xlat41 = min(u_xlat8.y, u_xlat8.x);
        u_xlat41 = min(u_xlat8.z, u_xlat41);
        u_xlat7.xyz = u_xlat7.xyz + (-FGlobals.unity_SpecCube0_ProbePosition.xyz);
        u_xlat6.xyz = fma(u_xlat6.xyz, float3(u_xlat41), u_xlat7.xyz);
    } else {
        u_xlat6.xyz = u_xlat17.xyz;
    }
    u_xlat41 = fma((-u_xlat4.x), 0.699999988, 1.70000005);
    u_xlat41 = u_xlat41 * u_xlat4.x;
    u_xlat41 = u_xlat41 * 6.0;
    u_xlat6 = unity_SpecCube0.sample(samplerunity_SpecCube0, u_xlat6.xyz, level(u_xlat41));
    u_xlat44 = u_xlat6.w + -1.0;
    u_xlat44 = fma(FGlobals.unity_SpecCube0_HDR.w, u_xlat44, 1.0);
    u_xlat44 = log2(u_xlat44);
    u_xlat44 = u_xlat44 * FGlobals.unity_SpecCube0_HDR.y;
    u_xlat44 = exp2(u_xlat44);
    u_xlat44 = u_xlat44 * FGlobals.unity_SpecCube0_HDR.x;
    u_xlat7.xyz = u_xlat6.xyz * float3(u_xlat44);
    u_xlatb45 = FGlobals.unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb45){
        u_xlatb45 = 0.0<FGlobals.unity_SpecCube1_ProbePosition.w;
        if(u_xlatb45){
            u_xlat45 = dot(u_xlat17.xyz, u_xlat17.xyz);
            u_xlat45 = rsqrt(u_xlat45);
            u_xlat8.xyz = u_xlat17.xyz * float3(u_xlat45);
            u_xlat9.x = input.TEXCOORD2.w;
            u_xlat9.y = input.TEXCOORD3.w;
            u_xlat9.z = input.TEXCOORD4.w;
            u_xlat10.xyz = (-u_xlat9.xyz) + FGlobals.unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat8.xyz;
            u_xlat11.xyz = (-u_xlat9.xyz) + FGlobals.unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat8.xyz;
            u_xlatb12.xyz = (float3(0.0, 0.0, 0.0)<u_xlat8.xyz);
            {
                float3 hlslcc_movcTemp = u_xlat10;
                hlslcc_movcTemp.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
                hlslcc_movcTemp.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
                hlslcc_movcTemp.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
                u_xlat10 = hlslcc_movcTemp;
            }
            u_xlat45 = min(u_xlat10.y, u_xlat10.x);
            u_xlat45 = min(u_xlat10.z, u_xlat45);
            u_xlat9.xyz = u_xlat9.xyz + (-FGlobals.unity_SpecCube1_ProbePosition.xyz);
            u_xlat17.xyz = fma(u_xlat8.xyz, float3(u_xlat45), u_xlat9.xyz);
        }
        u_xlat8 = unity_SpecCube1.sample(samplerunity_SpecCube0, u_xlat17.xyz, level(u_xlat41));
        u_xlat41 = u_xlat8.w + -1.0;
        u_xlat41 = fma(FGlobals.unity_SpecCube1_HDR.w, u_xlat41, 1.0);
        u_xlat41 = log2(u_xlat41);
        u_xlat41 = u_xlat41 * FGlobals.unity_SpecCube1_HDR.y;
        u_xlat41 = exp2(u_xlat41);
        u_xlat41 = u_xlat41 * FGlobals.unity_SpecCube1_HDR.x;
        u_xlat17.xyz = u_xlat8.xyz * float3(u_xlat41);
        u_xlat6.xyz = fma(float3(u_xlat44), u_xlat6.xyz, (-u_xlat17.xyz));
        u_xlat7.xyz = fma(FGlobals.unity_SpecCube0_BoxMin.www, u_xlat6.xyz, u_xlat17.xyz);
    }
    u_xlat17.xyz = float3(u_xlat42) * u_xlat7.xyz;
    u_xlat6.xyz = fma((-input.TEXCOORD1.xyz), float3(u_xlat40), FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat40 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat40 = max(u_xlat40, 0.00100000005);
    u_xlat40 = rsqrt(u_xlat40);
    u_xlat6.xyz = float3(u_xlat40) * u_xlat6.xyz;
    u_xlat40 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat41 = dot(u_xlat2.xyz, FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat41 = clamp(u_xlat41, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat15.x = dot(FGlobals._WorldSpaceLightPos0.xyz, u_xlat6.xyz);
    u_xlat15.x = clamp(u_xlat15.x, 0.0f, 1.0f);
    u_xlat28 = u_xlat15.x * u_xlat15.x;
    u_xlat28 = dot(float2(u_xlat28), u_xlat4.xx);
    u_xlat28 = u_xlat28 + -0.5;
    u_xlat3.x = (-u_xlat41) + 1.0;
    u_xlat16 = u_xlat3.x * u_xlat3.x;
    u_xlat16 = u_xlat16 * u_xlat16;
    u_xlat3.x = u_xlat3.x * u_xlat16;
    u_xlat3.x = fma(u_xlat28, u_xlat3.x, 1.0);
    u_xlat16 = -abs(u_xlat40) + 1.0;
    u_xlat29 = u_xlat16 * u_xlat16;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat16 = u_xlat16 * u_xlat29;
    u_xlat28 = fma(u_xlat28, u_xlat16, 1.0);
    u_xlat28 = u_xlat28 * u_xlat3.x;
    u_xlat28 = u_xlat41 * u_xlat28;
    u_xlat3.x = u_xlat4.x * u_xlat4.x;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat29 = (-u_xlat3.x) + 1.0;
    u_xlat42 = fma(abs(u_xlat40), u_xlat29, u_xlat3.x);
    u_xlat29 = fma(u_xlat41, u_xlat29, u_xlat3.x);
    u_xlat40 = abs(u_xlat40) * u_xlat29;
    u_xlat40 = fma(u_xlat41, u_xlat42, u_xlat40);
    u_xlat40 = u_xlat40 + 9.99999975e-06;
    u_xlat40 = 0.5 / u_xlat40;
    u_xlat29 = u_xlat3.x * u_xlat3.x;
    u_xlat42 = fma(u_xlat2.x, u_xlat29, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat42, u_xlat2.x, 1.0);
    u_xlat29 = u_xlat29 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat2.x = u_xlat29 / u_xlat2.x;
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat40 = u_xlat41 * u_xlat40;
    u_xlat40 = u_xlat40 * 3.14159274;
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat2.x = fma(u_xlat3.x, u_xlat3.x, 1.0);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat41 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb41 = u_xlat41!=0.0;
    u_xlat41 = u_xlatb41 ? 1.0 : float(0.0);
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat39 = (-u_xlat39) + FGlobals._Glossiness;
    u_xlat39 = u_xlat39 + 1.0;
    u_xlat39 = clamp(u_xlat39, 0.0f, 1.0f);
    u_xlat3.xzw = float3(u_xlat28) * u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz * float3(u_xlat40);
    u_xlat40 = (-u_xlat15.x) + 1.0;
    u_xlat15.x = u_xlat40 * u_xlat40;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat15.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat15.xyz = fma(u_xlat15.xyz, float3(u_xlat40), u_xlat0.xyz);
    u_xlat15.xyz = u_xlat15.xyz * u_xlat5.xyz;
    u_xlat1.xyz = fma(u_xlat1.xyz, u_xlat3.xzw, u_xlat15.xyz);
    u_xlat2.xyz = u_xlat17.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + float3(u_xlat39);
    u_xlat0.xyz = fma(float3(u_xlat16), u_xlat3.xzw, u_xlat0.xyz);
    u_xlat0.xyz = fma(u_xlat2.xyz, u_xlat0.xyz, u_xlat1.xyz);
    u_xlat1.xyz = _EmissionMap.sample(sampler_EmissionMap, input.TEXCOORD0.xy).xyz;
    output.SV_Target0.xyz = fma(u_xlat1.xyz, FGlobals._EmissionColor.xyz, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


 }
 Pass {
  Name "FORWARD_DELTA"
  Tags { "LIGHTMODE"="FORWARDADD" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite Off
  Blend [_SrcBlend] One
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords: POINT
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (336 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Matrix4x4 unity_WorldToLight at 272
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 _MainTex_ST at 224
  Vector4 _DetailAlbedoMap_ST at 240
  Float _UVSec at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float3 TEXCOORD6 [[ user(TEXCOORD6) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float4 u_xlat2;
    float u_xlat10;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat0);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    output.TEXCOORD1.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    output.TEXCOORD1.w = 0.0;
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    output.TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.w = 0.0;
    output.TEXCOORD2 = u_xlat2.wwwx;
    output.TEXCOORD3 = u_xlat2.wwwy;
    output.TEXCOORD4.w = u_xlat2.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD4.xyz = float3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * VGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, u_xlat0.xxx, u_xlat1.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, u_xlat0.zzz, u_xlat1.xyz);
    output.TEXCOORD6.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xyz, u_xlat0.www, u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_LightTexture0" to slot 1 sampler slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 2 sampler slot 0

Constant Buffer "FGlobals" (240 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 32
  Matrix4x4 unity_WorldToLight at 176
  Vector4 unity_OcclusionMaskSelector at 0
  Vector4 unity_ProbeVolumeParams at 16
  Vector3 unity_ProbeVolumeSizeInv at 96
  Vector3 unity_ProbeVolumeMin at 112
  Vector4 _LightColor0 at 128
  Vector4 _Color at 144
  Float _Metallic at 160
  Float _Glossiness at 164
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 unity_OcclusionMaskSelector;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    sampler sampler_LightTexture0 [[ sampler (2) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _LightTexture0 [[ texture(1) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(2) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    float3 u_xlat4;
    float4 u_xlat5;
    float3 u_xlat6;
    float u_xlat9;
    float u_xlat10;
    float u_xlat16;
    float u_xlat17;
    float u_xlat21;
    bool u_xlatb21;
    float u_xlat22;
    bool u_xlatb22;
    float u_xlat23;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat21 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat2.xyz = float3(u_xlat21) * input.TEXCOORD4.xyz;
    u_xlat21 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat3.xyz = float3(u_xlat21) * input.TEXCOORD1.xyz;
    u_xlat4.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, input.TEXCOORD5.xxx, u_xlat4.xyz);
    u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, input.TEXCOORD5.zzz, u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz + FGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb21 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb21){
        u_xlatb21 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD5.xxx, u_xlat5.xyz);
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD5.zzz, u_xlat5.xyz);
        u_xlat5.xyz = u_xlat5.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat5.xyz : input.TEXCOORD5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat5.yzw = u_xlat5.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat21 = fma(u_xlat5.y, 0.25, 0.75);
        u_xlat22 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat5.x = max(u_xlat21, u_xlat22);
        u_xlat5 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat21 = dot(u_xlat5, FGlobals.unity_OcclusionMaskSelector);
    u_xlat21 = clamp(u_xlat21, 0.0f, 1.0f);
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = _LightTexture0.sample(sampler_LightTexture0, float2(u_xlat22)).x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.x = input.TEXCOORD2.w;
    u_xlat4.y = input.TEXCOORD3.w;
    u_xlat4.z = input.TEXCOORD4.w;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat5.xyz = float3(u_xlat22) * u_xlat4.xyz;
    u_xlat6.xyz = float3(u_xlat21) * FGlobals._LightColor0.xyz;
    u_xlat21 = (-FGlobals._Glossiness) + 1.0;
    u_xlat4.xyz = fma(u_xlat4.xyz, float3(u_xlat22), (-u_xlat3.xyz));
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = max(u_xlat22, 0.00100000005);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat4.xyz = float3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat23 = clamp(u_xlat23, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat9 = dot(u_xlat5.xyz, u_xlat4.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0f, 1.0f);
    u_xlat16 = u_xlat9 * u_xlat9;
    u_xlat16 = dot(float2(u_xlat16), float2(u_xlat21));
    u_xlat16 = u_xlat16 + -0.5;
    u_xlat3.x = (-u_xlat23) + 1.0;
    u_xlat10 = u_xlat3.x * u_xlat3.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat3.x = u_xlat3.x * u_xlat10;
    u_xlat3.x = fma(u_xlat16, u_xlat3.x, 1.0);
    u_xlat10 = -abs(u_xlat22) + 1.0;
    u_xlat17 = u_xlat10 * u_xlat10;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat10 = u_xlat10 * u_xlat17;
    u_xlat16 = fma(u_xlat16, u_xlat10, 1.0);
    u_xlat16 = u_xlat16 * u_xlat3.x;
    u_xlat16 = u_xlat23 * u_xlat16;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = max(u_xlat21, 0.00200000009);
    u_xlat3.x = (-u_xlat21) + 1.0;
    u_xlat10 = fma(abs(u_xlat22), u_xlat3.x, u_xlat21);
    u_xlat3.x = fma(u_xlat23, u_xlat3.x, u_xlat21);
    u_xlat22 = abs(u_xlat22) * u_xlat3.x;
    u_xlat22 = fma(u_xlat23, u_xlat10, u_xlat22);
    u_xlat22 = u_xlat22 + 9.99999975e-06;
    u_xlat22 = 0.5 / u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat3.x = fma(u_xlat2.x, u_xlat21, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat3.x, u_xlat2.x, 1.0);
    u_xlat21 = u_xlat21 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat21 = u_xlat21 / u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = u_xlat23 * u_xlat21;
    u_xlat21 = u_xlat21 * 3.14159274;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb22 = u_xlat22!=0.0;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat2.xzw = float3(u_xlat16) * u_xlat6.xyz;
    u_xlat3.xyz = u_xlat6.xyz * float3(u_xlat21);
    u_xlat21 = (-u_xlat9) + 1.0;
    u_xlat22 = u_xlat21 * u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat0.xyz = fma(u_xlat4.xyz, float3(u_xlat21), u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    output.SV_Target0.xyz = fma(u_xlat1.xyz, u_xlat2.xzw, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (260 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 _MainTex_ST at 224
  Vector4 _DetailAlbedoMap_ST at 240
  Float _UVSec at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    bool u_xlatb0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    u_xlatb0 = VGlobals._UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat0.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat0.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    output.TEXCOORD1.xyz = u_xlat0.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    output.TEXCOORD1.w = 0.0;
    u_xlat1.xyz = fma((-u_xlat0.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    output.TEXCOORD5.xyz = u_xlat0.xyz;
    u_xlat1.w = 0.0;
    output.TEXCOORD2 = u_xlat1.wwwx;
    output.TEXCOORD3 = u_xlat1.wwwy;
    output.TEXCOORD4.w = u_xlat1.z;
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    output.TEXCOORD4.xyz = float3(u_xlat6) * u_xlat0.xyz;
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 1 sampler slot 0

Constant Buffer "FGlobals" (168 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 32
  Vector4 unity_OcclusionMaskSelector at 0
  Vector4 unity_ProbeVolumeParams at 16
  Vector3 unity_ProbeVolumeSizeInv at 96
  Vector3 unity_ProbeVolumeMin at 112
  Vector4 _LightColor0 at 128
  Vector4 _Color at 144
  Float _Metallic at 160
  Float _Glossiness at 164
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 unity_OcclusionMaskSelector;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(1) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    float3 u_xlat5;
    float3 u_xlat6;
    float u_xlat9;
    float u_xlat10;
    float u_xlat16;
    float u_xlat17;
    float u_xlat21;
    float u_xlat22;
    bool u_xlatb22;
    float u_xlat23;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat21 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat2.xyz = float3(u_xlat21) * input.TEXCOORD4.xyz;
    u_xlat21 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat3.xyz = float3(u_xlat21) * input.TEXCOORD1.xyz;
    u_xlatb22 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD5.xxx, u_xlat4.xyz);
        u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD5.zzz, u_xlat4.xyz);
        u_xlat4.xyz = u_xlat4.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb22)) ? u_xlat4.xyz : input.TEXCOORD5.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat4.yzw = u_xlat4.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat22 = fma(u_xlat4.y, 0.25, 0.75);
        u_xlat23 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat4.x = max(u_xlat22, u_xlat23);
        u_xlat4 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat22 = dot(u_xlat4, FGlobals.unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0f, 1.0f);
    u_xlat4.xyz = float3(u_xlat22) * FGlobals._LightColor0.xyz;
    u_xlat22 = (-FGlobals._Glossiness) + 1.0;
    u_xlat5.x = input.TEXCOORD2.w;
    u_xlat5.y = input.TEXCOORD3.w;
    u_xlat5.z = input.TEXCOORD4.w;
    u_xlat6.xyz = fma((-input.TEXCOORD1.xyz), float3(u_xlat21), u_xlat5.xyz);
    u_xlat21 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat6.xyz = float3(u_xlat21) * u_xlat6.xyz;
    u_xlat21 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat23 = clamp(u_xlat23, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat9 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0f, 1.0f);
    u_xlat16 = u_xlat9 * u_xlat9;
    u_xlat16 = dot(float2(u_xlat16), float2(u_xlat22));
    u_xlat16 = u_xlat16 + -0.5;
    u_xlat3.x = (-u_xlat23) + 1.0;
    u_xlat10 = u_xlat3.x * u_xlat3.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat3.x = u_xlat3.x * u_xlat10;
    u_xlat3.x = fma(u_xlat16, u_xlat3.x, 1.0);
    u_xlat10 = -abs(u_xlat21) + 1.0;
    u_xlat17 = u_xlat10 * u_xlat10;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat10 = u_xlat10 * u_xlat17;
    u_xlat16 = fma(u_xlat16, u_xlat10, 1.0);
    u_xlat16 = u_xlat16 * u_xlat3.x;
    u_xlat16 = u_xlat23 * u_xlat16;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = max(u_xlat22, 0.00200000009);
    u_xlat3.x = (-u_xlat22) + 1.0;
    u_xlat10 = fma(abs(u_xlat21), u_xlat3.x, u_xlat22);
    u_xlat3.x = fma(u_xlat23, u_xlat3.x, u_xlat22);
    u_xlat21 = abs(u_xlat21) * u_xlat3.x;
    u_xlat21 = fma(u_xlat23, u_xlat10, u_xlat21);
    u_xlat21 = u_xlat21 + 9.99999975e-06;
    u_xlat21 = 0.5 / u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat3.x = fma(u_xlat2.x, u_xlat22, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat3.x, u_xlat2.x, 1.0);
    u_xlat22 = u_xlat22 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat22 = u_xlat22 / u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = u_xlat23 * u_xlat21;
    u_xlat21 = u_xlat21 * 3.14159274;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb22 = u_xlat22!=0.0;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat2.xzw = float3(u_xlat16) * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat4.xyz * float3(u_xlat21);
    u_xlat21 = (-u_xlat9) + 1.0;
    u_xlat22 = u_xlat21 * u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat0.xyz = fma(u_xlat4.xyz, float3(u_xlat21), u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    output.SV_Target0.xyz = fma(u_xlat1.xyz, u_xlat2.xzw, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: SPOT
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (336 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Matrix4x4 unity_WorldToLight at 272
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 _MainTex_ST at 224
  Vector4 _DetailAlbedoMap_ST at 240
  Float _UVSec at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD6 [[ user(TEXCOORD6) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float4 u_xlat2;
    float u_xlat10;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat0);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    output.TEXCOORD1.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    output.TEXCOORD1.w = 0.0;
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    output.TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.w = 0.0;
    output.TEXCOORD2 = u_xlat2.wwwx;
    output.TEXCOORD3 = u_xlat2.wwwy;
    output.TEXCOORD4.w = u_xlat2.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD4.xyz = float3(u_xlat10) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[2], u_xlat0.zzzz, u_xlat1);
    output.TEXCOORD6 = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[3], u_xlat0.wwww, u_xlat1);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_LightTexture0" to slot 1 sampler slot 2
Set 2D Texture "_LightTextureB0" to slot 2 sampler slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0

Constant Buffer "FGlobals" (240 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 32
  Matrix4x4 unity_WorldToLight at 176
  Vector4 unity_OcclusionMaskSelector at 0
  Vector4 unity_ProbeVolumeParams at 16
  Vector3 unity_ProbeVolumeSizeInv at 96
  Vector3 unity_ProbeVolumeMin at 112
  Vector4 _LightColor0 at 128
  Vector4 _Color at 144
  Float _Metallic at 160
  Float _Glossiness at 164
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 unity_OcclusionMaskSelector;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    sampler sampler_LightTexture0 [[ sampler (2) ]],
    sampler sampler_LightTextureB0 [[ sampler (3) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _LightTexture0 [[ texture(1) ]] ,
    texture2d<float, access::sample > _LightTextureB0 [[ texture(2) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(3) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    float4 u_xlat5;
    float3 u_xlat6;
    float u_xlat9;
    float u_xlat10;
    float u_xlat16;
    float u_xlat17;
    float u_xlat21;
    bool u_xlatb21;
    float u_xlat22;
    bool u_xlatb22;
    float u_xlat23;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat21 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat2.xyz = float3(u_xlat21) * input.TEXCOORD4.xyz;
    u_xlat21 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat3.xyz = float3(u_xlat21) * input.TEXCOORD1.xyz;
    u_xlat4 = input.TEXCOORD5.yyyy * FGlobals.hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat4 = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[0], input.TEXCOORD5.xxxx, u_xlat4);
    u_xlat4 = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[2], input.TEXCOORD5.zzzz, u_xlat4);
    u_xlat4 = u_xlat4 + FGlobals.hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlatb21 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb21){
        u_xlatb21 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD5.xxx, u_xlat5.xyz);
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD5.zzz, u_xlat5.xyz);
        u_xlat5.xyz = u_xlat5.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat5.xyz : input.TEXCOORD5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat5.yzw = u_xlat5.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat21 = fma(u_xlat5.y, 0.25, 0.75);
        u_xlat22 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat5.x = max(u_xlat21, u_xlat22);
        u_xlat5 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat21 = dot(u_xlat5, FGlobals.unity_OcclusionMaskSelector);
    u_xlat21 = clamp(u_xlat21, 0.0f, 1.0f);
    u_xlatb22 = 0.0<u_xlat4.z;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat5.xy = u_xlat4.xy / u_xlat4.ww;
    u_xlat5.xy = u_xlat5.xy + float2(0.5, 0.5);
    u_xlat23 = _LightTexture0.sample(sampler_LightTexture0, u_xlat5.xy).w;
    u_xlat22 = u_xlat22 * u_xlat23;
    u_xlat23 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat23 = _LightTextureB0.sample(sampler_LightTextureB0, float2(u_xlat23)).x;
    u_xlat22 = u_xlat22 * u_xlat23;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.x = input.TEXCOORD2.w;
    u_xlat4.y = input.TEXCOORD3.w;
    u_xlat4.z = input.TEXCOORD4.w;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat5.xyz = float3(u_xlat22) * u_xlat4.xyz;
    u_xlat6.xyz = float3(u_xlat21) * FGlobals._LightColor0.xyz;
    u_xlat21 = (-FGlobals._Glossiness) + 1.0;
    u_xlat4.xyz = fma(u_xlat4.xyz, float3(u_xlat22), (-u_xlat3.xyz));
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = max(u_xlat22, 0.00100000005);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat4.xyz = float3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat23 = clamp(u_xlat23, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat9 = dot(u_xlat5.xyz, u_xlat4.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0f, 1.0f);
    u_xlat16 = u_xlat9 * u_xlat9;
    u_xlat16 = dot(float2(u_xlat16), float2(u_xlat21));
    u_xlat16 = u_xlat16 + -0.5;
    u_xlat3.x = (-u_xlat23) + 1.0;
    u_xlat10 = u_xlat3.x * u_xlat3.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat3.x = u_xlat3.x * u_xlat10;
    u_xlat3.x = fma(u_xlat16, u_xlat3.x, 1.0);
    u_xlat10 = -abs(u_xlat22) + 1.0;
    u_xlat17 = u_xlat10 * u_xlat10;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat10 = u_xlat10 * u_xlat17;
    u_xlat16 = fma(u_xlat16, u_xlat10, 1.0);
    u_xlat16 = u_xlat16 * u_xlat3.x;
    u_xlat16 = u_xlat23 * u_xlat16;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = max(u_xlat21, 0.00200000009);
    u_xlat3.x = (-u_xlat21) + 1.0;
    u_xlat10 = fma(abs(u_xlat22), u_xlat3.x, u_xlat21);
    u_xlat3.x = fma(u_xlat23, u_xlat3.x, u_xlat21);
    u_xlat22 = abs(u_xlat22) * u_xlat3.x;
    u_xlat22 = fma(u_xlat23, u_xlat10, u_xlat22);
    u_xlat22 = u_xlat22 + 9.99999975e-06;
    u_xlat22 = 0.5 / u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat3.x = fma(u_xlat2.x, u_xlat21, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat3.x, u_xlat2.x, 1.0);
    u_xlat21 = u_xlat21 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat21 = u_xlat21 / u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = u_xlat23 * u_xlat21;
    u_xlat21 = u_xlat21 * 3.14159274;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb22 = u_xlat22!=0.0;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat2.xzw = float3(u_xlat16) * u_xlat6.xyz;
    u_xlat3.xyz = u_xlat6.xyz * float3(u_xlat21);
    u_xlat21 = (-u_xlat9) + 1.0;
    u_xlat22 = u_xlat21 * u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat0.xyz = fma(u_xlat4.xyz, float3(u_xlat21), u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    output.SV_Target0.xyz = fma(u_xlat1.xyz, u_xlat2.xzw, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: POINT_COOKIE
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (336 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Matrix4x4 unity_WorldToLight at 272
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 _MainTex_ST at 224
  Vector4 _DetailAlbedoMap_ST at 240
  Float _UVSec at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float3 TEXCOORD6 [[ user(TEXCOORD6) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float4 u_xlat2;
    float u_xlat10;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat0);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    output.TEXCOORD1.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    output.TEXCOORD1.w = 0.0;
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    output.TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.w = 0.0;
    output.TEXCOORD2 = u_xlat2.wwwx;
    output.TEXCOORD3 = u_xlat2.wwwy;
    output.TEXCOORD4.w = u_xlat2.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD4.xyz = float3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * VGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, u_xlat0.xxx, u_xlat1.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, u_xlat0.zzz, u_xlat1.xyz);
    output.TEXCOORD6.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xyz, u_xlat0.www, u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_LightTextureB0" to slot 1 sampler slot 3
Set CUBE Texture "_LightTexture0" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0

Constant Buffer "FGlobals" (240 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 32
  Matrix4x4 unity_WorldToLight at 176
  Vector4 unity_OcclusionMaskSelector at 0
  Vector4 unity_ProbeVolumeParams at 16
  Vector3 unity_ProbeVolumeSizeInv at 96
  Vector3 unity_ProbeVolumeMin at 112
  Vector4 _LightColor0 at 128
  Vector4 _Color at 144
  Float _Metallic at 160
  Float _Glossiness at 164
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 unity_OcclusionMaskSelector;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    sampler sampler_LightTexture0 [[ sampler (2) ]],
    sampler sampler_LightTextureB0 [[ sampler (3) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _LightTextureB0 [[ texture(1) ]] ,
    texturecube<float, access::sample > _LightTexture0 [[ texture(2) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(3) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    float3 u_xlat4;
    float4 u_xlat5;
    float3 u_xlat6;
    float u_xlat9;
    float u_xlat10;
    float u_xlat16;
    float u_xlat17;
    float u_xlat21;
    bool u_xlatb21;
    float u_xlat22;
    bool u_xlatb22;
    float u_xlat23;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat21 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat2.xyz = float3(u_xlat21) * input.TEXCOORD4.xyz;
    u_xlat21 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat3.xyz = float3(u_xlat21) * input.TEXCOORD1.xyz;
    u_xlat4.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, input.TEXCOORD5.xxx, u_xlat4.xyz);
    u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, input.TEXCOORD5.zzz, u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz + FGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb21 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb21){
        u_xlatb21 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD5.xxx, u_xlat5.xyz);
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD5.zzz, u_xlat5.xyz);
        u_xlat5.xyz = u_xlat5.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat5.xyz : input.TEXCOORD5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat5.yzw = u_xlat5.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat21 = fma(u_xlat5.y, 0.25, 0.75);
        u_xlat22 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat5.x = max(u_xlat21, u_xlat22);
        u_xlat5 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat21 = dot(u_xlat5, FGlobals.unity_OcclusionMaskSelector);
    u_xlat21 = clamp(u_xlat21, 0.0f, 1.0f);
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = _LightTextureB0.sample(sampler_LightTextureB0, float2(u_xlat22)).x;
    u_xlat23 = _LightTexture0.sample(sampler_LightTexture0, u_xlat4.xyz).w;
    u_xlat22 = u_xlat22 * u_xlat23;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.x = input.TEXCOORD2.w;
    u_xlat4.y = input.TEXCOORD3.w;
    u_xlat4.z = input.TEXCOORD4.w;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat5.xyz = float3(u_xlat22) * u_xlat4.xyz;
    u_xlat6.xyz = float3(u_xlat21) * FGlobals._LightColor0.xyz;
    u_xlat21 = (-FGlobals._Glossiness) + 1.0;
    u_xlat4.xyz = fma(u_xlat4.xyz, float3(u_xlat22), (-u_xlat3.xyz));
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = max(u_xlat22, 0.00100000005);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat4.xyz = float3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat23 = clamp(u_xlat23, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat9 = dot(u_xlat5.xyz, u_xlat4.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0f, 1.0f);
    u_xlat16 = u_xlat9 * u_xlat9;
    u_xlat16 = dot(float2(u_xlat16), float2(u_xlat21));
    u_xlat16 = u_xlat16 + -0.5;
    u_xlat3.x = (-u_xlat23) + 1.0;
    u_xlat10 = u_xlat3.x * u_xlat3.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat3.x = u_xlat3.x * u_xlat10;
    u_xlat3.x = fma(u_xlat16, u_xlat3.x, 1.0);
    u_xlat10 = -abs(u_xlat22) + 1.0;
    u_xlat17 = u_xlat10 * u_xlat10;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat10 = u_xlat10 * u_xlat17;
    u_xlat16 = fma(u_xlat16, u_xlat10, 1.0);
    u_xlat16 = u_xlat16 * u_xlat3.x;
    u_xlat16 = u_xlat23 * u_xlat16;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = max(u_xlat21, 0.00200000009);
    u_xlat3.x = (-u_xlat21) + 1.0;
    u_xlat10 = fma(abs(u_xlat22), u_xlat3.x, u_xlat21);
    u_xlat3.x = fma(u_xlat23, u_xlat3.x, u_xlat21);
    u_xlat22 = abs(u_xlat22) * u_xlat3.x;
    u_xlat22 = fma(u_xlat23, u_xlat10, u_xlat22);
    u_xlat22 = u_xlat22 + 9.99999975e-06;
    u_xlat22 = 0.5 / u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat3.x = fma(u_xlat2.x, u_xlat21, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat3.x, u_xlat2.x, 1.0);
    u_xlat21 = u_xlat21 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat21 = u_xlat21 / u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = u_xlat23 * u_xlat21;
    u_xlat21 = u_xlat21 * 3.14159274;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb22 = u_xlat22!=0.0;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat2.xzw = float3(u_xlat16) * u_xlat6.xyz;
    u_xlat3.xyz = u_xlat6.xyz * float3(u_xlat21);
    u_xlat21 = (-u_xlat9) + 1.0;
    u_xlat22 = u_xlat21 * u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat0.xyz = fma(u_xlat4.xyz, float3(u_xlat21), u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    output.SV_Target0.xyz = fma(u_xlat1.xyz, u_xlat2.xzw, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL_COOKIE
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (336 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Matrix4x4 unity_WorldToLight at 272
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 _MainTex_ST at 224
  Vector4 _DetailAlbedoMap_ST at 240
  Float _UVSec at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float2 TEXCOORD6 [[ user(TEXCOORD6) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float4 u_xlat2;
    float u_xlat10;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat0);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    output.TEXCOORD1.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    output.TEXCOORD1.w = 0.0;
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    output.TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.w = 0.0;
    output.TEXCOORD2 = u_xlat2.wwwx;
    output.TEXCOORD3 = u_xlat2.wwwy;
    output.TEXCOORD4.w = u_xlat2.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD4.xyz = float3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xy = u_xlat0.yy * VGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xy, u_xlat0.xx, u_xlat1.xy);
    u_xlat0.xy = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xy, u_xlat0.zz, u_xlat0.xy);
    output.TEXCOORD6.xy = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xy, u_xlat0.ww, u_xlat0.xy);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_LightTexture0" to slot 1 sampler slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 2 sampler slot 0

Constant Buffer "FGlobals" (240 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 32
  Matrix4x4 unity_WorldToLight at 176
  Vector4 unity_OcclusionMaskSelector at 0
  Vector4 unity_ProbeVolumeParams at 16
  Vector3 unity_ProbeVolumeSizeInv at 96
  Vector3 unity_ProbeVolumeMin at 112
  Vector4 _LightColor0 at 128
  Vector4 _Color at 144
  Float _Metallic at 160
  Float _Glossiness at 164
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 unity_OcclusionMaskSelector;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    sampler sampler_LightTexture0 [[ sampler (2) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _LightTexture0 [[ texture(1) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(2) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    float3 u_xlat4;
    float4 u_xlat5;
    float3 u_xlat6;
    float u_xlat9;
    float u_xlat10;
    float u_xlat16;
    float u_xlat17;
    float u_xlat21;
    float u_xlat22;
    bool u_xlatb22;
    float u_xlat23;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat21 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat2.xyz = float3(u_xlat21) * input.TEXCOORD4.xyz;
    u_xlat21 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat3.xyz = float3(u_xlat21) * input.TEXCOORD1.xyz;
    u_xlat4.xy = input.TEXCOORD5.yy * FGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat4.xy = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xy, input.TEXCOORD5.xx, u_xlat4.xy);
    u_xlat4.xy = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xy, input.TEXCOORD5.zz, u_xlat4.xy);
    u_xlat4.xy = u_xlat4.xy + FGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlatb22 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD5.xxx, u_xlat5.xyz);
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD5.zzz, u_xlat5.xyz);
        u_xlat5.xyz = u_xlat5.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb22)) ? u_xlat5.xyz : input.TEXCOORD5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat5.yzw = u_xlat5.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat22 = fma(u_xlat5.y, 0.25, 0.75);
        u_xlat23 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat5.x = max(u_xlat22, u_xlat23);
        u_xlat5 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat22 = dot(u_xlat5, FGlobals.unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0f, 1.0f);
    u_xlat23 = _LightTexture0.sample(sampler_LightTexture0, u_xlat4.xy).w;
    u_xlat22 = u_xlat22 * u_xlat23;
    u_xlat4.xyz = float3(u_xlat22) * FGlobals._LightColor0.xyz;
    u_xlat22 = (-FGlobals._Glossiness) + 1.0;
    u_xlat5.x = input.TEXCOORD2.w;
    u_xlat5.y = input.TEXCOORD3.w;
    u_xlat5.z = input.TEXCOORD4.w;
    u_xlat6.xyz = fma((-input.TEXCOORD1.xyz), float3(u_xlat21), u_xlat5.xyz);
    u_xlat21 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat6.xyz = float3(u_xlat21) * u_xlat6.xyz;
    u_xlat21 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat23 = clamp(u_xlat23, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat9 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0f, 1.0f);
    u_xlat16 = u_xlat9 * u_xlat9;
    u_xlat16 = dot(float2(u_xlat16), float2(u_xlat22));
    u_xlat16 = u_xlat16 + -0.5;
    u_xlat3.x = (-u_xlat23) + 1.0;
    u_xlat10 = u_xlat3.x * u_xlat3.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat3.x = u_xlat3.x * u_xlat10;
    u_xlat3.x = fma(u_xlat16, u_xlat3.x, 1.0);
    u_xlat10 = -abs(u_xlat21) + 1.0;
    u_xlat17 = u_xlat10 * u_xlat10;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat10 = u_xlat10 * u_xlat17;
    u_xlat16 = fma(u_xlat16, u_xlat10, 1.0);
    u_xlat16 = u_xlat16 * u_xlat3.x;
    u_xlat16 = u_xlat23 * u_xlat16;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = max(u_xlat22, 0.00200000009);
    u_xlat3.x = (-u_xlat22) + 1.0;
    u_xlat10 = fma(abs(u_xlat21), u_xlat3.x, u_xlat22);
    u_xlat3.x = fma(u_xlat23, u_xlat3.x, u_xlat22);
    u_xlat21 = abs(u_xlat21) * u_xlat3.x;
    u_xlat21 = fma(u_xlat23, u_xlat10, u_xlat21);
    u_xlat21 = u_xlat21 + 9.99999975e-06;
    u_xlat21 = 0.5 / u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat3.x = fma(u_xlat2.x, u_xlat22, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat3.x, u_xlat2.x, 1.0);
    u_xlat22 = u_xlat22 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat22 = u_xlat22 / u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = u_xlat23 * u_xlat21;
    u_xlat21 = u_xlat21 * 3.14159274;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb22 = u_xlat22!=0.0;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat2.xzw = float3(u_xlat16) * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat4.xyz * float3(u_xlat21);
    u_xlat21 = (-u_xlat9) + 1.0;
    u_xlat22 = u_xlat21 * u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat0.xyz = fma(u_xlat4.xyz, float3(u_xlat21), u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    output.SV_Target0.xyz = fma(u_xlat1.xyz, u_xlat2.xzw, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: SHADOWS_DEPTH SPOT
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (336 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Matrix4x4 unity_WorldToLight at 272
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 _MainTex_ST at 224
  Vector4 _DetailAlbedoMap_ST at 240
  Float _UVSec at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD6 [[ user(TEXCOORD6) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float4 u_xlat2;
    float u_xlat10;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat0);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    output.TEXCOORD1.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    output.TEXCOORD1.w = 0.0;
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    output.TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.w = 0.0;
    output.TEXCOORD2 = u_xlat2.wwwx;
    output.TEXCOORD3 = u_xlat2.wwwy;
    output.TEXCOORD4.w = u_xlat2.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD4.xyz = float3(u_xlat10) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[2], u_xlat0.zzzz, u_xlat1);
    output.TEXCOORD6 = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[3], u_xlat0.wwww, u_xlat1);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTexture0" to slot 1 sampler slot 3
Set 2D Texture "_LightTextureB0" to slot 2 sampler slot 4
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0
Set 2D Texture "_ShadowMapTexture" to slot 4 sampler slot 1

Constant Buffer "FGlobals" (608 bytes) on slot 0 {
  Matrix4x4 unity_WorldToShadow[4] at 32
  Matrix4x4 unity_MatrixV at 320
  Matrix4x4 unity_ProbeVolumeWorldToObject at 400
  Matrix4x4 unity_WorldToLight at 544
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 unity_OcclusionMaskSelector at 16
  Vector4 _LightShadowData at 288
  Vector4 unity_ShadowFadeCenterAndType at 304
  Vector4 unity_ProbeVolumeParams at 384
  Vector3 unity_ProbeVolumeSizeInv at 464
  Vector3 unity_ProbeVolumeMin at 480
  Vector4 _LightColor0 at 496
  Vector4 _Color at 512
  Float _Metallic at 528
  Float _Glossiness at 532
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 unity_OcclusionMaskSelector;
    float4 hlslcc_mtx4x4unity_WorldToShadow[16];
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    sampler sampler_LightTexture0 [[ sampler (3) ]],
    sampler sampler_LightTextureB0 [[ sampler (4) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _LightTexture0 [[ texture(1) ]] ,
    texture2d<float, access::sample > _LightTextureB0 [[ texture(2) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(3) ]] ,
    depth2d<float, access::sample > _ShadowMapTexture [[ texture(4) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    float4 u_xlat5;
    float3 u_xlat6;
    float u_xlat9;
    float u_xlat10;
    float u_xlat16;
    float u_xlat17;
    float u_xlat21;
    float u_xlat22;
    bool u_xlatb22;
    float u_xlat23;
    float u_xlat24;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat21 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat2.xyz = float3(u_xlat21) * input.TEXCOORD4.xyz;
    u_xlat21 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat3.xyz = float3(u_xlat21) * input.TEXCOORD1.xyz;
    u_xlat4 = input.TEXCOORD5.yyyy * FGlobals.hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat4 = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[0], input.TEXCOORD5.xxxx, u_xlat4);
    u_xlat4 = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[2], input.TEXCOORD5.zzzz, u_xlat4);
    u_xlat4 = u_xlat4 + FGlobals.hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat5.xyz = (-input.TEXCOORD5.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat6.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat21 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = input.TEXCOORD5.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat22 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat22 = sqrt(u_xlat22);
    u_xlat22 = (-u_xlat21) + u_xlat22;
    u_xlat21 = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat22, u_xlat21);
    u_xlat21 = fma(u_xlat21, FGlobals._LightShadowData.z, FGlobals._LightShadowData.w);
    u_xlat21 = clamp(u_xlat21, 0.0f, 1.0f);
    u_xlatb22 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD5.xxx, u_xlat5.xyz);
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD5.zzz, u_xlat5.xyz);
        u_xlat5.xyz = u_xlat5.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb22)) ? u_xlat5.xyz : input.TEXCOORD5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat5.yzw = u_xlat5.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat22 = fma(u_xlat5.y, 0.25, 0.75);
        u_xlat23 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat5.x = max(u_xlat22, u_xlat23);
        u_xlat5 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat22 = dot(u_xlat5, FGlobals.unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0f, 1.0f);
    u_xlat5 = input.TEXCOORD5.yyyy * FGlobals.hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat5 = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[0], input.TEXCOORD5.xxxx, u_xlat5);
    u_xlat5 = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[2], input.TEXCOORD5.zzzz, u_xlat5);
    u_xlat5 = u_xlat5 + FGlobals.hlslcc_mtx4x4unity_WorldToShadow[3];
    u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
    u_xlat23 = _ShadowMapTexture.sample_compare(sampler_ShadowMapTexture, u_xlat5.xy, saturate(u_xlat5.z), level(0.0));
    u_xlat24 = (-FGlobals._LightShadowData.x) + 1.0;
    u_xlat23 = fma(u_xlat23, u_xlat24, FGlobals._LightShadowData.x);
    u_xlat22 = u_xlat22 + (-u_xlat23);
    u_xlat21 = fma(u_xlat21, u_xlat22, u_xlat23);
    u_xlatb22 = 0.0<u_xlat4.z;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat5.xy = u_xlat4.xy / u_xlat4.ww;
    u_xlat5.xy = u_xlat5.xy + float2(0.5, 0.5);
    u_xlat23 = _LightTexture0.sample(sampler_LightTexture0, u_xlat5.xy).w;
    u_xlat22 = u_xlat22 * u_xlat23;
    u_xlat23 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat23 = _LightTextureB0.sample(sampler_LightTextureB0, float2(u_xlat23)).x;
    u_xlat22 = u_xlat22 * u_xlat23;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.x = input.TEXCOORD2.w;
    u_xlat4.y = input.TEXCOORD3.w;
    u_xlat4.z = input.TEXCOORD4.w;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat5.xyz = float3(u_xlat22) * u_xlat4.xyz;
    u_xlat6.xyz = float3(u_xlat21) * FGlobals._LightColor0.xyz;
    u_xlat21 = (-FGlobals._Glossiness) + 1.0;
    u_xlat4.xyz = fma(u_xlat4.xyz, float3(u_xlat22), (-u_xlat3.xyz));
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = max(u_xlat22, 0.00100000005);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat4.xyz = float3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat23 = clamp(u_xlat23, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat9 = dot(u_xlat5.xyz, u_xlat4.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0f, 1.0f);
    u_xlat16 = u_xlat9 * u_xlat9;
    u_xlat16 = dot(float2(u_xlat16), float2(u_xlat21));
    u_xlat16 = u_xlat16 + -0.5;
    u_xlat3.x = (-u_xlat23) + 1.0;
    u_xlat10 = u_xlat3.x * u_xlat3.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat3.x = u_xlat3.x * u_xlat10;
    u_xlat3.x = fma(u_xlat16, u_xlat3.x, 1.0);
    u_xlat10 = -abs(u_xlat22) + 1.0;
    u_xlat17 = u_xlat10 * u_xlat10;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat10 = u_xlat10 * u_xlat17;
    u_xlat16 = fma(u_xlat16, u_xlat10, 1.0);
    u_xlat16 = u_xlat16 * u_xlat3.x;
    u_xlat16 = u_xlat23 * u_xlat16;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = max(u_xlat21, 0.00200000009);
    u_xlat3.x = (-u_xlat21) + 1.0;
    u_xlat10 = fma(abs(u_xlat22), u_xlat3.x, u_xlat21);
    u_xlat3.x = fma(u_xlat23, u_xlat3.x, u_xlat21);
    u_xlat22 = abs(u_xlat22) * u_xlat3.x;
    u_xlat22 = fma(u_xlat23, u_xlat10, u_xlat22);
    u_xlat22 = u_xlat22 + 9.99999975e-06;
    u_xlat22 = 0.5 / u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat3.x = fma(u_xlat2.x, u_xlat21, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat3.x, u_xlat2.x, 1.0);
    u_xlat21 = u_xlat21 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat21 = u_xlat21 / u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = u_xlat23 * u_xlat21;
    u_xlat21 = u_xlat21 * 3.14159274;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb22 = u_xlat22!=0.0;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat2.xzw = float3(u_xlat16) * u_xlat6.xyz;
    u_xlat3.xyz = u_xlat6.xyz * float3(u_xlat21);
    u_xlat21 = (-u_xlat9) + 1.0;
    u_xlat22 = u_xlat21 * u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat0.xyz = fma(u_xlat4.xyz, float3(u_xlat21), u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    output.SV_Target0.xyz = fma(u_xlat1.xyz, u_xlat2.xzw, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: SHADOWS_DEPTH SHADOWS_SOFT SPOT
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (336 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Matrix4x4 unity_WorldToLight at 272
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 _MainTex_ST at 224
  Vector4 _DetailAlbedoMap_ST at 240
  Float _UVSec at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD6 [[ user(TEXCOORD6) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float4 u_xlat2;
    float u_xlat10;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat0);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    output.TEXCOORD1.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    output.TEXCOORD1.w = 0.0;
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    output.TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.w = 0.0;
    output.TEXCOORD2 = u_xlat2.wwwx;
    output.TEXCOORD3 = u_xlat2.wwwy;
    output.TEXCOORD4.w = u_xlat2.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD4.xyz = float3(u_xlat10) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[2], u_xlat0.zzzz, u_xlat1);
    output.TEXCOORD6 = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[3], u_xlat0.wwww, u_xlat1);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTexture0" to slot 1 sampler slot 3
Set 2D Texture "_LightTextureB0" to slot 2 sampler slot 4
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0
Set 2D Texture "_ShadowMapTexture" to slot 4 sampler slot 1

Constant Buffer "FGlobals" (624 bytes) on slot 0 {
  Matrix4x4 unity_WorldToShadow[4] at 32
  Matrix4x4 unity_MatrixV at 320
  Matrix4x4 unity_ProbeVolumeWorldToObject at 400
  Matrix4x4 unity_WorldToLight at 560
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 unity_OcclusionMaskSelector at 16
  Vector4 _LightShadowData at 288
  Vector4 unity_ShadowFadeCenterAndType at 304
  Vector4 unity_ProbeVolumeParams at 384
  Vector3 unity_ProbeVolumeSizeInv at 464
  Vector3 unity_ProbeVolumeMin at 480
  Vector4 _LightColor0 at 496
  Vector4 _ShadowMapTexture_TexelSize at 512
  Vector4 _Color at 528
  Float _Metallic at 544
  Float _Glossiness at 548
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 unity_OcclusionMaskSelector;
    float4 hlslcc_mtx4x4unity_WorldToShadow[16];
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _ShadowMapTexture_TexelSize;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    sampler sampler_LightTexture0 [[ sampler (3) ]],
    sampler sampler_LightTextureB0 [[ sampler (4) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _LightTexture0 [[ texture(1) ]] ,
    texture2d<float, access::sample > _LightTextureB0 [[ texture(2) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(3) ]] ,
    depth2d<float, access::sample > _ShadowMapTexture [[ texture(4) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    float4 u_xlat5;
    float4 u_xlat6;
    float4 u_xlat7;
    float4 u_xlat8;
    float4 u_xlat9;
    float4 u_xlat10;
    float u_xlat13;
    float u_xlat14;
    float u_xlat24;
    float u_xlat25;
    float2 u_xlat28;
    float u_xlat33;
    float u_xlat34;
    bool u_xlatb34;
    float u_xlat35;
    bool u_xlatb35;
    float u_xlat36;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat33 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat33 = rsqrt(u_xlat33);
    u_xlat2.xyz = float3(u_xlat33) * input.TEXCOORD4.xyz;
    u_xlat33 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat33 = rsqrt(u_xlat33);
    u_xlat3.xyz = float3(u_xlat33) * input.TEXCOORD1.xyz;
    u_xlat4 = input.TEXCOORD5.yyyy * FGlobals.hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat4 = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[0], input.TEXCOORD5.xxxx, u_xlat4);
    u_xlat4 = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[2], input.TEXCOORD5.zzzz, u_xlat4);
    u_xlat4 = u_xlat4 + FGlobals.hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat5.xyz = (-input.TEXCOORD5.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat6.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat33 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = input.TEXCOORD5.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat34 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat34 = sqrt(u_xlat34);
    u_xlat34 = (-u_xlat33) + u_xlat34;
    u_xlat33 = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat34, u_xlat33);
    u_xlat33 = fma(u_xlat33, FGlobals._LightShadowData.z, FGlobals._LightShadowData.w);
    u_xlat33 = clamp(u_xlat33, 0.0f, 1.0f);
    u_xlatb34 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb34){
        u_xlatb34 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD5.xxx, u_xlat5.xyz);
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD5.zzz, u_xlat5.xyz);
        u_xlat5.xyz = u_xlat5.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb34)) ? u_xlat5.xyz : input.TEXCOORD5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat5.yzw = u_xlat5.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat34 = fma(u_xlat5.y, 0.25, 0.75);
        u_xlat35 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat5.x = max(u_xlat34, u_xlat35);
        u_xlat5 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat34 = dot(u_xlat5, FGlobals.unity_OcclusionMaskSelector);
    u_xlat34 = clamp(u_xlat34, 0.0f, 1.0f);
    u_xlatb35 = u_xlat33<0.99000001;
    if(u_xlatb35){
        u_xlat5 = input.TEXCOORD5.yyyy * FGlobals.hlslcc_mtx4x4unity_WorldToShadow[1];
        u_xlat5 = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[0], input.TEXCOORD5.xxxx, u_xlat5);
        u_xlat5 = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[2], input.TEXCOORD5.zzzz, u_xlat5);
        u_xlat5 = u_xlat5 + FGlobals.hlslcc_mtx4x4unity_WorldToShadow[3];
        u_xlat5.xyz = u_xlat5.xyz / u_xlat5.www;
        u_xlat6.xy = fma(u_xlat5.xy, FGlobals._ShadowMapTexture_TexelSize.zw, float2(0.5, 0.5));
        u_xlat6.xy = floor(u_xlat6.xy);
        u_xlat5.xy = fma(u_xlat5.xy, FGlobals._ShadowMapTexture_TexelSize.zw, (-u_xlat6.xy));
        u_xlat7 = u_xlat5.xxyy + float4(0.5, 1.0, 0.5, 1.0);
        u_xlat8.xw = u_xlat7.xz * u_xlat7.xz;
        u_xlat28.xy = fma(u_xlat8.xw, float2(0.5, 0.5), (-u_xlat5.xy));
        u_xlat7.xz = (-u_xlat5.xy) + float2(1.0, 1.0);
        u_xlat9.xy = min(u_xlat5.xy, float2(0.0, 0.0));
        u_xlat7.xz = fma((-u_xlat9.xy), u_xlat9.xy, u_xlat7.xz);
        u_xlat5.xy = max(u_xlat5.xy, float2(0.0, 0.0));
        u_xlat5.xy = fma((-u_xlat5.xy), u_xlat5.xy, u_xlat7.yw);
        u_xlat9.x = u_xlat28.x;
        u_xlat9.y = u_xlat7.x;
        u_xlat9.z = u_xlat5.x;
        u_xlat9.w = u_xlat8.x;
        u_xlat9 = u_xlat9 * float4(0.444440007, 0.444440007, 0.444440007, 0.222220004);
        u_xlat8.x = u_xlat28.y;
        u_xlat8.y = u_xlat7.z;
        u_xlat8.z = u_xlat5.y;
        u_xlat7 = u_xlat8 * float4(0.444440007, 0.444440007, 0.444440007, 0.222220004);
        u_xlat8 = u_xlat9.ywyw + u_xlat9.xzxz;
        u_xlat10 = u_xlat7.yyww + u_xlat7.xxzz;
        u_xlat5.xy = u_xlat9.yw / u_xlat8.zw;
        u_xlat5.xy = u_xlat5.xy + float2(-1.5, 0.5);
        u_xlat28.xy = u_xlat7.yw / u_xlat10.yw;
        u_xlat28.xy = u_xlat28.xy + float2(-1.5, 0.5);
        u_xlat7.xy = u_xlat5.xy * FGlobals._ShadowMapTexture_TexelSize.xx;
        u_xlat7.zw = u_xlat28.xy * FGlobals._ShadowMapTexture_TexelSize.yy;
        u_xlat8 = u_xlat8 * u_xlat10;
        u_xlat9 = fma(u_xlat6.xyxy, FGlobals._ShadowMapTexture_TexelSize.xyxy, u_xlat7.xzyz);
        u_xlat35 = _ShadowMapTexture.sample_compare(sampler_ShadowMapTexture, u_xlat9.xy, saturate(u_xlat5.z), level(0.0));
        u_xlat36 = _ShadowMapTexture.sample_compare(sampler_ShadowMapTexture, u_xlat9.zw, saturate(u_xlat5.z), level(0.0));
        u_xlat36 = u_xlat36 * u_xlat8.y;
        u_xlat35 = fma(u_xlat8.x, u_xlat35, u_xlat36);
        u_xlat6 = fma(u_xlat6.xyxy, FGlobals._ShadowMapTexture_TexelSize.xyxy, u_xlat7.xwyw);
        u_xlat36 = _ShadowMapTexture.sample_compare(sampler_ShadowMapTexture, u_xlat6.xy, saturate(u_xlat5.z), level(0.0));
        u_xlat35 = fma(u_xlat8.z, u_xlat36, u_xlat35);
        u_xlat36 = _ShadowMapTexture.sample_compare(sampler_ShadowMapTexture, u_xlat6.zw, saturate(u_xlat5.z), level(0.0));
        u_xlat35 = fma(u_xlat8.w, u_xlat36, u_xlat35);
        u_xlat36 = (-FGlobals._LightShadowData.x) + 1.0;
        u_xlat35 = fma(u_xlat35, u_xlat36, FGlobals._LightShadowData.x);
    } else {
        u_xlat35 = 1.0;
    }
    u_xlat34 = u_xlat34 + (-u_xlat35);
    u_xlat33 = fma(u_xlat33, u_xlat34, u_xlat35);
    u_xlatb34 = 0.0<u_xlat4.z;
    u_xlat34 = u_xlatb34 ? 1.0 : float(0.0);
    u_xlat5.xy = u_xlat4.xy / u_xlat4.ww;
    u_xlat5.xy = u_xlat5.xy + float2(0.5, 0.5);
    u_xlat35 = _LightTexture0.sample(sampler_LightTexture0, u_xlat5.xy).w;
    u_xlat34 = u_xlat34 * u_xlat35;
    u_xlat35 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat35 = _LightTextureB0.sample(sampler_LightTextureB0, float2(u_xlat35)).x;
    u_xlat34 = u_xlat34 * u_xlat35;
    u_xlat33 = u_xlat33 * u_xlat34;
    u_xlat4.x = input.TEXCOORD2.w;
    u_xlat4.y = input.TEXCOORD3.w;
    u_xlat4.z = input.TEXCOORD4.w;
    u_xlat34 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat34 = rsqrt(u_xlat34);
    u_xlat5.xyz = float3(u_xlat34) * u_xlat4.xyz;
    u_xlat6.xyz = float3(u_xlat33) * FGlobals._LightColor0.xyz;
    u_xlat33 = (-FGlobals._Glossiness) + 1.0;
    u_xlat4.xyz = fma(u_xlat4.xyz, float3(u_xlat34), (-u_xlat3.xyz));
    u_xlat34 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat34 = max(u_xlat34, 0.00100000005);
    u_xlat34 = rsqrt(u_xlat34);
    u_xlat4.xyz = float3(u_xlat34) * u_xlat4.xyz;
    u_xlat34 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat35 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat35 = clamp(u_xlat35, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat13 = dot(u_xlat5.xyz, u_xlat4.xyz);
    u_xlat13 = clamp(u_xlat13, 0.0f, 1.0f);
    u_xlat24 = u_xlat13 * u_xlat13;
    u_xlat24 = dot(float2(u_xlat24), float2(u_xlat33));
    u_xlat24 = u_xlat24 + -0.5;
    u_xlat3.x = (-u_xlat35) + 1.0;
    u_xlat14 = u_xlat3.x * u_xlat3.x;
    u_xlat14 = u_xlat14 * u_xlat14;
    u_xlat3.x = u_xlat3.x * u_xlat14;
    u_xlat3.x = fma(u_xlat24, u_xlat3.x, 1.0);
    u_xlat14 = -abs(u_xlat34) + 1.0;
    u_xlat25 = u_xlat14 * u_xlat14;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat14 = u_xlat14 * u_xlat25;
    u_xlat24 = fma(u_xlat24, u_xlat14, 1.0);
    u_xlat24 = u_xlat24 * u_xlat3.x;
    u_xlat24 = u_xlat35 * u_xlat24;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat33 = max(u_xlat33, 0.00200000009);
    u_xlat3.x = (-u_xlat33) + 1.0;
    u_xlat14 = fma(abs(u_xlat34), u_xlat3.x, u_xlat33);
    u_xlat3.x = fma(u_xlat35, u_xlat3.x, u_xlat33);
    u_xlat34 = abs(u_xlat34) * u_xlat3.x;
    u_xlat34 = fma(u_xlat35, u_xlat14, u_xlat34);
    u_xlat34 = u_xlat34 + 9.99999975e-06;
    u_xlat34 = 0.5 / u_xlat34;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat3.x = fma(u_xlat2.x, u_xlat33, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat3.x, u_xlat2.x, 1.0);
    u_xlat33 = u_xlat33 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat33 = u_xlat33 / u_xlat2.x;
    u_xlat33 = u_xlat33 * u_xlat34;
    u_xlat33 = u_xlat35 * u_xlat33;
    u_xlat33 = u_xlat33 * 3.14159274;
    u_xlat33 = max(u_xlat33, 0.0);
    u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb34 = u_xlat34!=0.0;
    u_xlat34 = u_xlatb34 ? 1.0 : float(0.0);
    u_xlat33 = u_xlat33 * u_xlat34;
    u_xlat2.xzw = float3(u_xlat24) * u_xlat6.xyz;
    u_xlat3.xyz = u_xlat6.xyz * float3(u_xlat33);
    u_xlat33 = (-u_xlat13) + 1.0;
    u_xlat34 = u_xlat33 * u_xlat33;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat33 = u_xlat33 * u_xlat34;
    u_xlat4.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat0.xyz = fma(u_xlat4.xyz, float3(u_xlat33), u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    output.SV_Target0.xyz = fma(u_xlat1.xyz, u_xlat2.xzw, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL SHADOWS_SCREEN
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (276 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 48
  Matrix4x4 unity_WorldToObject at 112
  Matrix4x4 unity_MatrixVP at 176
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _ProjectionParams at 16
  Vector4 _WorldSpaceLightPos0 at 32
  Vector4 _MainTex_ST at 240
  Vector4 _DetailAlbedoMap_ST at 256
  Float _UVSec at 272
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _ProjectionParams;
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float4 u_xlat2;
    float u_xlat10;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    output.mtl_Position = u_xlat0;
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    output.TEXCOORD1.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    output.TEXCOORD1.w = 0.0;
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    output.TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.w = 0.0;
    output.TEXCOORD2 = u_xlat2.wwwx;
    output.TEXCOORD3 = u_xlat2.wwwy;
    output.TEXCOORD4.w = u_xlat2.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD4.xyz = float3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * VGlobals._ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * float3(0.5, 0.5, 0.5);
    output.TEXCOORD7.zw = u_xlat0.zw;
    output.TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_ShadowMapTexture" to slot 1 sampler slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 2 sampler slot 0

Constant Buffer "FGlobals" (280 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 64
  Matrix4x4 unity_ProbeVolumeWorldToObject at 144
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 unity_OcclusionMaskSelector at 16
  Vector4 _LightShadowData at 32
  Vector4 unity_ShadowFadeCenterAndType at 48
  Vector4 unity_ProbeVolumeParams at 128
  Vector3 unity_ProbeVolumeSizeInv at 208
  Vector3 unity_ProbeVolumeMin at 224
  Vector4 _LightColor0 at 240
  Vector4 _Color at 256
  Float _Metallic at 272
  Float _Glossiness at 276
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 unity_OcclusionMaskSelector;
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    sampler sampler_ShadowMapTexture [[ sampler (2) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _ShadowMapTexture [[ texture(1) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(2) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    float3 u_xlat5;
    float3 u_xlat6;
    float u_xlat9;
    float u_xlat10;
    float u_xlat16;
    float u_xlat17;
    float u_xlat21;
    float u_xlat22;
    bool u_xlatb22;
    float u_xlat23;
    bool u_xlatb23;
    float u_xlat24;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat21 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat2.xyz = float3(u_xlat21) * input.TEXCOORD4.xyz;
    u_xlat21 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat3.xyz = float3(u_xlat21) * input.TEXCOORD1.xyz;
    u_xlat4.xyz = (-input.TEXCOORD5.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat5.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat4.xyz = input.TEXCOORD5.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat23 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat23 = sqrt(u_xlat23);
    u_xlat23 = (-u_xlat22) + u_xlat23;
    u_xlat22 = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat23, u_xlat22);
    u_xlat22 = fma(u_xlat22, FGlobals._LightShadowData.z, FGlobals._LightShadowData.w);
    u_xlat22 = clamp(u_xlat22, 0.0f, 1.0f);
    u_xlatb23 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb23){
        u_xlatb23 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD5.xxx, u_xlat4.xyz);
        u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD5.zzz, u_xlat4.xyz);
        u_xlat4.xyz = u_xlat4.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb23)) ? u_xlat4.xyz : input.TEXCOORD5.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat4.yzw = u_xlat4.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat23 = fma(u_xlat4.y, 0.25, 0.75);
        u_xlat24 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat4.x = max(u_xlat23, u_xlat24);
        u_xlat4 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat23 = dot(u_xlat4, FGlobals.unity_OcclusionMaskSelector);
    u_xlat23 = clamp(u_xlat23, 0.0f, 1.0f);
    u_xlat4.xy = input.TEXCOORD7.xy / input.TEXCOORD7.ww;
    u_xlat24 = _ShadowMapTexture.sample(sampler_ShadowMapTexture, u_xlat4.xy).x;
    u_xlat23 = u_xlat23 + (-u_xlat24);
    u_xlat22 = fma(u_xlat22, u_xlat23, u_xlat24);
    u_xlat4.xyz = float3(u_xlat22) * FGlobals._LightColor0.xyz;
    u_xlat22 = (-FGlobals._Glossiness) + 1.0;
    u_xlat5.x = input.TEXCOORD2.w;
    u_xlat5.y = input.TEXCOORD3.w;
    u_xlat5.z = input.TEXCOORD4.w;
    u_xlat6.xyz = fma((-input.TEXCOORD1.xyz), float3(u_xlat21), u_xlat5.xyz);
    u_xlat21 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat6.xyz = float3(u_xlat21) * u_xlat6.xyz;
    u_xlat21 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat23 = clamp(u_xlat23, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat9 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0f, 1.0f);
    u_xlat16 = u_xlat9 * u_xlat9;
    u_xlat16 = dot(float2(u_xlat16), float2(u_xlat22));
    u_xlat16 = u_xlat16 + -0.5;
    u_xlat3.x = (-u_xlat23) + 1.0;
    u_xlat10 = u_xlat3.x * u_xlat3.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat3.x = u_xlat3.x * u_xlat10;
    u_xlat3.x = fma(u_xlat16, u_xlat3.x, 1.0);
    u_xlat10 = -abs(u_xlat21) + 1.0;
    u_xlat17 = u_xlat10 * u_xlat10;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat10 = u_xlat10 * u_xlat17;
    u_xlat16 = fma(u_xlat16, u_xlat10, 1.0);
    u_xlat16 = u_xlat16 * u_xlat3.x;
    u_xlat16 = u_xlat23 * u_xlat16;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = max(u_xlat22, 0.00200000009);
    u_xlat3.x = (-u_xlat22) + 1.0;
    u_xlat10 = fma(abs(u_xlat21), u_xlat3.x, u_xlat22);
    u_xlat3.x = fma(u_xlat23, u_xlat3.x, u_xlat22);
    u_xlat21 = abs(u_xlat21) * u_xlat3.x;
    u_xlat21 = fma(u_xlat23, u_xlat10, u_xlat21);
    u_xlat21 = u_xlat21 + 9.99999975e-06;
    u_xlat21 = 0.5 / u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat3.x = fma(u_xlat2.x, u_xlat22, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat3.x, u_xlat2.x, 1.0);
    u_xlat22 = u_xlat22 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat22 = u_xlat22 / u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = u_xlat23 * u_xlat21;
    u_xlat21 = u_xlat21 * 3.14159274;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb22 = u_xlat22!=0.0;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat2.xzw = float3(u_xlat16) * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat4.xyz * float3(u_xlat21);
    u_xlat21 = (-u_xlat9) + 1.0;
    u_xlat22 = u_xlat21 * u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat0.xyz = fma(u_xlat4.xyz, float3(u_xlat21), u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    output.SV_Target0.xyz = fma(u_xlat1.xyz, u_xlat2.xzw, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL_COOKIE SHADOWS_SCREEN
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (352 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 48
  Matrix4x4 unity_WorldToObject at 112
  Matrix4x4 unity_MatrixVP at 176
  Matrix4x4 unity_WorldToLight at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _ProjectionParams at 16
  Vector4 _WorldSpaceLightPos0 at 32
  Vector4 _MainTex_ST at 240
  Vector4 _DetailAlbedoMap_ST at 256
  Float _UVSec at 272
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _ProjectionParams;
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float2 TEXCOORD6 [[ user(TEXCOORD6) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    bool u_xlatb2;
    float4 u_xlat3;
    float u_xlat14;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat0);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.mtl_Position = u_xlat1;
    u_xlatb2 = VGlobals._UVSec==0.0;
    u_xlat2.xy = (bool(u_xlatb2)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat2.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat2.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat2.xyz);
    u_xlat2.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat2.xyz);
    u_xlat2.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat2.xyz);
    output.TEXCOORD1.xyz = u_xlat2.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    output.TEXCOORD1.w = 0.0;
    u_xlat3.xyz = fma((-u_xlat2.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    output.TEXCOORD5.xyz = u_xlat2.xyz;
    u_xlat3.w = 0.0;
    output.TEXCOORD2 = u_xlat3.wwwx;
    output.TEXCOORD3 = u_xlat3.wwwy;
    output.TEXCOORD4.w = u_xlat3.z;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat14 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat14 = rsqrt(u_xlat14);
    output.TEXCOORD4.xyz = float3(u_xlat14) * u_xlat2.xyz;
    u_xlat2.xy = u_xlat0.yy * VGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xy, u_xlat0.xx, u_xlat2.xy);
    u_xlat0.xy = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xy, u_xlat0.zz, u_xlat0.xy);
    output.TEXCOORD6.xy = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xy, u_xlat0.ww, u_xlat0.xy);
    u_xlat0.x = u_xlat1.y * VGlobals._ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * float2(0.5, 0.5);
    output.TEXCOORD7.zw = u_xlat1.zw;
    output.TEXCOORD7.xy = u_xlat0.zz + u_xlat0.xw;
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_ShadowMapTexture" to slot 1 sampler slot 2
Set 2D Texture "_LightTexture0" to slot 2 sampler slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0

Constant Buffer "FGlobals" (352 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 64
  Matrix4x4 unity_ProbeVolumeWorldToObject at 144
  Matrix4x4 unity_WorldToLight at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 unity_OcclusionMaskSelector at 16
  Vector4 _LightShadowData at 32
  Vector4 unity_ShadowFadeCenterAndType at 48
  Vector4 unity_ProbeVolumeParams at 128
  Vector3 unity_ProbeVolumeSizeInv at 208
  Vector3 unity_ProbeVolumeMin at 224
  Vector4 _LightColor0 at 240
  Vector4 _Color at 256
  Float _Metallic at 272
  Float _Glossiness at 276
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 unity_OcclusionMaskSelector;
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    sampler sampler_ShadowMapTexture [[ sampler (2) ]],
    sampler sampler_LightTexture0 [[ sampler (3) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _ShadowMapTexture [[ texture(1) ]] ,
    texture2d<float, access::sample > _LightTexture0 [[ texture(2) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(3) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    float3 u_xlat4;
    float4 u_xlat5;
    float3 u_xlat6;
    float u_xlat9;
    float u_xlat10;
    float u_xlat16;
    float u_xlat17;
    float2 u_xlat18;
    float u_xlat21;
    float u_xlat22;
    bool u_xlatb22;
    float u_xlat23;
    bool u_xlatb23;
    float u_xlat24;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat21 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat2.xyz = float3(u_xlat21) * input.TEXCOORD4.xyz;
    u_xlat21 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat3.xyz = float3(u_xlat21) * input.TEXCOORD1.xyz;
    u_xlat4.xy = input.TEXCOORD5.yy * FGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat4.xy = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xy, input.TEXCOORD5.xx, u_xlat4.xy);
    u_xlat4.xy = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xy, input.TEXCOORD5.zz, u_xlat4.xy);
    u_xlat4.xy = u_xlat4.xy + FGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat5.xyz = (-input.TEXCOORD5.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat6.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat22 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = input.TEXCOORD5.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat23 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat23 = sqrt(u_xlat23);
    u_xlat23 = (-u_xlat22) + u_xlat23;
    u_xlat22 = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat23, u_xlat22);
    u_xlat22 = fma(u_xlat22, FGlobals._LightShadowData.z, FGlobals._LightShadowData.w);
    u_xlat22 = clamp(u_xlat22, 0.0f, 1.0f);
    u_xlatb23 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb23){
        u_xlatb23 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD5.xxx, u_xlat5.xyz);
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD5.zzz, u_xlat5.xyz);
        u_xlat5.xyz = u_xlat5.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb23)) ? u_xlat5.xyz : input.TEXCOORD5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat5.yzw = u_xlat5.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat23 = fma(u_xlat5.y, 0.25, 0.75);
        u_xlat24 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat5.x = max(u_xlat23, u_xlat24);
        u_xlat5 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat23 = dot(u_xlat5, FGlobals.unity_OcclusionMaskSelector);
    u_xlat23 = clamp(u_xlat23, 0.0f, 1.0f);
    u_xlat18.xy = input.TEXCOORD7.xy / input.TEXCOORD7.ww;
    u_xlat24 = _ShadowMapTexture.sample(sampler_ShadowMapTexture, u_xlat18.xy).x;
    u_xlat23 = u_xlat23 + (-u_xlat24);
    u_xlat22 = fma(u_xlat22, u_xlat23, u_xlat24);
    u_xlat23 = _LightTexture0.sample(sampler_LightTexture0, u_xlat4.xy).w;
    u_xlat22 = u_xlat22 * u_xlat23;
    u_xlat4.xyz = float3(u_xlat22) * FGlobals._LightColor0.xyz;
    u_xlat22 = (-FGlobals._Glossiness) + 1.0;
    u_xlat5.x = input.TEXCOORD2.w;
    u_xlat5.y = input.TEXCOORD3.w;
    u_xlat5.z = input.TEXCOORD4.w;
    u_xlat6.xyz = fma((-input.TEXCOORD1.xyz), float3(u_xlat21), u_xlat5.xyz);
    u_xlat21 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat6.xyz = float3(u_xlat21) * u_xlat6.xyz;
    u_xlat21 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat23 = clamp(u_xlat23, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat9 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0f, 1.0f);
    u_xlat16 = u_xlat9 * u_xlat9;
    u_xlat16 = dot(float2(u_xlat16), float2(u_xlat22));
    u_xlat16 = u_xlat16 + -0.5;
    u_xlat3.x = (-u_xlat23) + 1.0;
    u_xlat10 = u_xlat3.x * u_xlat3.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat3.x = u_xlat3.x * u_xlat10;
    u_xlat3.x = fma(u_xlat16, u_xlat3.x, 1.0);
    u_xlat10 = -abs(u_xlat21) + 1.0;
    u_xlat17 = u_xlat10 * u_xlat10;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat10 = u_xlat10 * u_xlat17;
    u_xlat16 = fma(u_xlat16, u_xlat10, 1.0);
    u_xlat16 = u_xlat16 * u_xlat3.x;
    u_xlat16 = u_xlat23 * u_xlat16;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = max(u_xlat22, 0.00200000009);
    u_xlat3.x = (-u_xlat22) + 1.0;
    u_xlat10 = fma(abs(u_xlat21), u_xlat3.x, u_xlat22);
    u_xlat3.x = fma(u_xlat23, u_xlat3.x, u_xlat22);
    u_xlat21 = abs(u_xlat21) * u_xlat3.x;
    u_xlat21 = fma(u_xlat23, u_xlat10, u_xlat21);
    u_xlat21 = u_xlat21 + 9.99999975e-06;
    u_xlat21 = 0.5 / u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat3.x = fma(u_xlat2.x, u_xlat22, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat3.x, u_xlat2.x, 1.0);
    u_xlat22 = u_xlat22 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat22 = u_xlat22 / u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = u_xlat23 * u_xlat21;
    u_xlat21 = u_xlat21 * 3.14159274;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb22 = u_xlat22!=0.0;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat2.xzw = float3(u_xlat16) * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat4.xyz * float3(u_xlat21);
    u_xlat21 = (-u_xlat9) + 1.0;
    u_xlat22 = u_xlat21 * u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat0.xyz = fma(u_xlat4.xyz, float3(u_xlat21), u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    output.SV_Target0.xyz = fma(u_xlat1.xyz, u_xlat2.xzw, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: POINT SHADOWS_CUBE
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (336 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Matrix4x4 unity_WorldToLight at 272
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 _MainTex_ST at 224
  Vector4 _DetailAlbedoMap_ST at 240
  Float _UVSec at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float3 TEXCOORD6 [[ user(TEXCOORD6) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float4 u_xlat2;
    float u_xlat10;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat0);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    output.TEXCOORD1.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    output.TEXCOORD1.w = 0.0;
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    output.TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.w = 0.0;
    output.TEXCOORD2 = u_xlat2.wwwx;
    output.TEXCOORD3 = u_xlat2.wwwy;
    output.TEXCOORD4.w = u_xlat2.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD4.xyz = float3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * VGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, u_xlat0.xxx, u_xlat1.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, u_xlat0.zzz, u_xlat1.xyz);
    output.TEXCOORD6.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xyz, u_xlat0.www, u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTexture0" to slot 1 sampler slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 2 sampler slot 0
Set CUBE Texture "_ShadowMapTexture" to slot 3 sampler slot 1

Constant Buffer "FGlobals" (384 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 96
  Matrix4x4 unity_ProbeVolumeWorldToObject at 176
  Matrix4x4 unity_WorldToLight at 320
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _LightPositionRange at 16
  Vector4 _LightProjectionParams at 32
  Vector4 unity_OcclusionMaskSelector at 48
  Vector4 _LightShadowData at 64
  Vector4 unity_ShadowFadeCenterAndType at 80
  Vector4 unity_ProbeVolumeParams at 160
  Vector3 unity_ProbeVolumeSizeInv at 240
  Vector3 unity_ProbeVolumeMin at 256
  Vector4 _LightColor0 at 272
  Vector4 _Color at 288
  Float _Metallic at 304
  Float _Glossiness at 308
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _LightPositionRange;
    float4 _LightProjectionParams;
    float4 unity_OcclusionMaskSelector;
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    sampler sampler_LightTexture0 [[ sampler (3) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _LightTexture0 [[ texture(1) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(2) ]] ,
    depthcube<float, access::sample > _ShadowMapTexture [[ texture(3) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    float3 u_xlat4;
    float4 u_xlat5;
    float3 u_xlat6;
    float u_xlat9;
    float u_xlat10;
    float u_xlat16;
    float u_xlat17;
    float u_xlat21;
    float u_xlat22;
    bool u_xlatb22;
    float u_xlat23;
    float u_xlat24;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat21 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat2.xyz = float3(u_xlat21) * input.TEXCOORD4.xyz;
    u_xlat21 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat3.xyz = float3(u_xlat21) * input.TEXCOORD1.xyz;
    u_xlat4.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, input.TEXCOORD5.xxx, u_xlat4.xyz);
    u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, input.TEXCOORD5.zzz, u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz + FGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat5.xyz = (-input.TEXCOORD5.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat6.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat21 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = input.TEXCOORD5.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat22 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat22 = sqrt(u_xlat22);
    u_xlat22 = (-u_xlat21) + u_xlat22;
    u_xlat21 = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat22, u_xlat21);
    u_xlat21 = fma(u_xlat21, FGlobals._LightShadowData.z, FGlobals._LightShadowData.w);
    u_xlat21 = clamp(u_xlat21, 0.0f, 1.0f);
    u_xlatb22 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD5.xxx, u_xlat5.xyz);
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD5.zzz, u_xlat5.xyz);
        u_xlat5.xyz = u_xlat5.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb22)) ? u_xlat5.xyz : input.TEXCOORD5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat5.yzw = u_xlat5.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat22 = fma(u_xlat5.y, 0.25, 0.75);
        u_xlat23 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat5.x = max(u_xlat22, u_xlat23);
        u_xlat5 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat22 = dot(u_xlat5, FGlobals.unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0f, 1.0f);
    u_xlat5.xyz = input.TEXCOORD5.xyz + (-FGlobals._LightPositionRange.xyz);
    u_xlat23 = max(abs(u_xlat5.y), abs(u_xlat5.x));
    u_xlat23 = max(abs(u_xlat5.z), u_xlat23);
    u_xlat23 = u_xlat23 + (-FGlobals._LightProjectionParams.z);
    u_xlat23 = max(u_xlat23, 9.99999975e-06);
    u_xlat23 = u_xlat23 * FGlobals._LightProjectionParams.w;
    u_xlat23 = FGlobals._LightProjectionParams.y / u_xlat23;
    u_xlat23 = u_xlat23 + (-FGlobals._LightProjectionParams.x);
    u_xlat23 = (-u_xlat23) + 1.0;
    u_xlat23 = _ShadowMapTexture.sample_compare(sampler_ShadowMapTexture, u_xlat5.xyz, saturate(u_xlat23), level(0.0));
    u_xlat24 = (-FGlobals._LightShadowData.x) + 1.0;
    u_xlat23 = fma(u_xlat23, u_xlat24, FGlobals._LightShadowData.x);
    u_xlat22 = u_xlat22 + (-u_xlat23);
    u_xlat21 = fma(u_xlat21, u_xlat22, u_xlat23);
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = _LightTexture0.sample(sampler_LightTexture0, float2(u_xlat22)).x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.x = input.TEXCOORD2.w;
    u_xlat4.y = input.TEXCOORD3.w;
    u_xlat4.z = input.TEXCOORD4.w;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat5.xyz = float3(u_xlat22) * u_xlat4.xyz;
    u_xlat6.xyz = float3(u_xlat21) * FGlobals._LightColor0.xyz;
    u_xlat21 = (-FGlobals._Glossiness) + 1.0;
    u_xlat4.xyz = fma(u_xlat4.xyz, float3(u_xlat22), (-u_xlat3.xyz));
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = max(u_xlat22, 0.00100000005);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat4.xyz = float3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat23 = clamp(u_xlat23, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat9 = dot(u_xlat5.xyz, u_xlat4.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0f, 1.0f);
    u_xlat16 = u_xlat9 * u_xlat9;
    u_xlat16 = dot(float2(u_xlat16), float2(u_xlat21));
    u_xlat16 = u_xlat16 + -0.5;
    u_xlat3.x = (-u_xlat23) + 1.0;
    u_xlat10 = u_xlat3.x * u_xlat3.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat3.x = u_xlat3.x * u_xlat10;
    u_xlat3.x = fma(u_xlat16, u_xlat3.x, 1.0);
    u_xlat10 = -abs(u_xlat22) + 1.0;
    u_xlat17 = u_xlat10 * u_xlat10;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat10 = u_xlat10 * u_xlat17;
    u_xlat16 = fma(u_xlat16, u_xlat10, 1.0);
    u_xlat16 = u_xlat16 * u_xlat3.x;
    u_xlat16 = u_xlat23 * u_xlat16;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = max(u_xlat21, 0.00200000009);
    u_xlat3.x = (-u_xlat21) + 1.0;
    u_xlat10 = fma(abs(u_xlat22), u_xlat3.x, u_xlat21);
    u_xlat3.x = fma(u_xlat23, u_xlat3.x, u_xlat21);
    u_xlat22 = abs(u_xlat22) * u_xlat3.x;
    u_xlat22 = fma(u_xlat23, u_xlat10, u_xlat22);
    u_xlat22 = u_xlat22 + 9.99999975e-06;
    u_xlat22 = 0.5 / u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat3.x = fma(u_xlat2.x, u_xlat21, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat3.x, u_xlat2.x, 1.0);
    u_xlat21 = u_xlat21 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat21 = u_xlat21 / u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = u_xlat23 * u_xlat21;
    u_xlat21 = u_xlat21 * 3.14159274;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb22 = u_xlat22!=0.0;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat2.xzw = float3(u_xlat16) * u_xlat6.xyz;
    u_xlat3.xyz = u_xlat6.xyz * float3(u_xlat21);
    u_xlat21 = (-u_xlat9) + 1.0;
    u_xlat22 = u_xlat21 * u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat0.xyz = fma(u_xlat4.xyz, float3(u_xlat21), u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    output.SV_Target0.xyz = fma(u_xlat1.xyz, u_xlat2.xzw, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: POINT SHADOWS_CUBE SHADOWS_SOFT
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (336 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Matrix4x4 unity_WorldToLight at 272
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 _MainTex_ST at 224
  Vector4 _DetailAlbedoMap_ST at 240
  Float _UVSec at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float3 TEXCOORD6 [[ user(TEXCOORD6) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float4 u_xlat2;
    float u_xlat10;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat0);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    output.TEXCOORD1.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    output.TEXCOORD1.w = 0.0;
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    output.TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.w = 0.0;
    output.TEXCOORD2 = u_xlat2.wwwx;
    output.TEXCOORD3 = u_xlat2.wwwy;
    output.TEXCOORD4.w = u_xlat2.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD4.xyz = float3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * VGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, u_xlat0.xxx, u_xlat1.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, u_xlat0.zzz, u_xlat1.xyz);
    output.TEXCOORD6.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xyz, u_xlat0.www, u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTexture0" to slot 1 sampler slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 2 sampler slot 0
Set CUBE Texture "_ShadowMapTexture" to slot 3 sampler slot 1

Constant Buffer "FGlobals" (384 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 96
  Matrix4x4 unity_ProbeVolumeWorldToObject at 176
  Matrix4x4 unity_WorldToLight at 320
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _LightPositionRange at 16
  Vector4 _LightProjectionParams at 32
  Vector4 unity_OcclusionMaskSelector at 48
  Vector4 _LightShadowData at 64
  Vector4 unity_ShadowFadeCenterAndType at 80
  Vector4 unity_ProbeVolumeParams at 160
  Vector3 unity_ProbeVolumeSizeInv at 240
  Vector3 unity_ProbeVolumeMin at 256
  Vector4 _LightColor0 at 272
  Vector4 _Color at 288
  Float _Metallic at 304
  Float _Glossiness at 308
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _LightPositionRange;
    float4 _LightProjectionParams;
    float4 unity_OcclusionMaskSelector;
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    sampler sampler_LightTexture0 [[ sampler (3) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _LightTexture0 [[ texture(1) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(2) ]] ,
    depthcube<float, access::sample > _ShadowMapTexture [[ texture(3) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    float3 u_xlat4;
    float4 u_xlat5;
    float4 u_xlat6;
    float3 u_xlat7;
    float u_xlat10;
    float u_xlat11;
    float u_xlat18;
    float u_xlat19;
    float u_xlat24;
    float u_xlat25;
    bool u_xlatb25;
    float u_xlat26;
    bool u_xlatb26;
    float u_xlat27;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat24 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat24) * u_xlat1.xyz;
    u_xlat24 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat24 = rsqrt(u_xlat24);
    u_xlat2.xyz = float3(u_xlat24) * input.TEXCOORD4.xyz;
    u_xlat24 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat24 = rsqrt(u_xlat24);
    u_xlat3.xyz = float3(u_xlat24) * input.TEXCOORD1.xyz;
    u_xlat4.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, input.TEXCOORD5.xxx, u_xlat4.xyz);
    u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, input.TEXCOORD5.zzz, u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz + FGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat5.xyz = (-input.TEXCOORD5.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat6.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat24 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = input.TEXCOORD5.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat25 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat25 = sqrt(u_xlat25);
    u_xlat25 = (-u_xlat24) + u_xlat25;
    u_xlat24 = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat25, u_xlat24);
    u_xlat24 = fma(u_xlat24, FGlobals._LightShadowData.z, FGlobals._LightShadowData.w);
    u_xlat24 = clamp(u_xlat24, 0.0f, 1.0f);
    u_xlatb25 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb25){
        u_xlatb25 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD5.xxx, u_xlat5.xyz);
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD5.zzz, u_xlat5.xyz);
        u_xlat5.xyz = u_xlat5.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb25)) ? u_xlat5.xyz : input.TEXCOORD5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat5.yzw = u_xlat5.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat25 = fma(u_xlat5.y, 0.25, 0.75);
        u_xlat26 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat5.x = max(u_xlat25, u_xlat26);
        u_xlat5 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat25 = dot(u_xlat5, FGlobals.unity_OcclusionMaskSelector);
    u_xlat25 = clamp(u_xlat25, 0.0f, 1.0f);
    u_xlatb26 = u_xlat24<0.99000001;
    if(u_xlatb26){
        u_xlat5.xyz = input.TEXCOORD5.xyz + (-FGlobals._LightPositionRange.xyz);
        u_xlat26 = max(abs(u_xlat5.y), abs(u_xlat5.x));
        u_xlat26 = max(abs(u_xlat5.z), u_xlat26);
        u_xlat26 = u_xlat26 + (-FGlobals._LightProjectionParams.z);
        u_xlat26 = max(u_xlat26, 9.99999975e-06);
        u_xlat26 = u_xlat26 * FGlobals._LightProjectionParams.w;
        u_xlat26 = FGlobals._LightProjectionParams.y / u_xlat26;
        u_xlat26 = u_xlat26 + (-FGlobals._LightProjectionParams.x);
        u_xlat26 = (-u_xlat26) + 1.0;
        u_xlat6.xyz = u_xlat5.xyz + float3(0.0078125, 0.0078125, 0.0078125);
        u_xlat6.x = _ShadowMapTexture.sample_compare(sampler_ShadowMapTexture, u_xlat6.xyz, saturate(u_xlat26), level(0.0));
        u_xlat7.xyz = u_xlat5.xyz + float3(-0.0078125, -0.0078125, 0.0078125);
        u_xlat6.y = _ShadowMapTexture.sample_compare(sampler_ShadowMapTexture, u_xlat7.xyz, saturate(u_xlat26), level(0.0));
        u_xlat7.xyz = u_xlat5.xyz + float3(-0.0078125, 0.0078125, -0.0078125);
        u_xlat6.z = _ShadowMapTexture.sample_compare(sampler_ShadowMapTexture, u_xlat7.xyz, saturate(u_xlat26), level(0.0));
        u_xlat5.xyz = u_xlat5.xyz + float3(0.0078125, -0.0078125, -0.0078125);
        u_xlat6.w = _ShadowMapTexture.sample_compare(sampler_ShadowMapTexture, u_xlat5.xyz, saturate(u_xlat26), level(0.0));
        u_xlat26 = dot(u_xlat6, float4(0.25, 0.25, 0.25, 0.25));
        u_xlat27 = (-FGlobals._LightShadowData.x) + 1.0;
        u_xlat26 = fma(u_xlat26, u_xlat27, FGlobals._LightShadowData.x);
    } else {
        u_xlat26 = 1.0;
    }
    u_xlat25 = u_xlat25 + (-u_xlat26);
    u_xlat24 = fma(u_xlat24, u_xlat25, u_xlat26);
    u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat25 = _LightTexture0.sample(sampler_LightTexture0, float2(u_xlat25)).x;
    u_xlat24 = u_xlat24 * u_xlat25;
    u_xlat4.x = input.TEXCOORD2.w;
    u_xlat4.y = input.TEXCOORD3.w;
    u_xlat4.z = input.TEXCOORD4.w;
    u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat25 = rsqrt(u_xlat25);
    u_xlat5.xyz = float3(u_xlat25) * u_xlat4.xyz;
    u_xlat6.xyz = float3(u_xlat24) * FGlobals._LightColor0.xyz;
    u_xlat24 = (-FGlobals._Glossiness) + 1.0;
    u_xlat4.xyz = fma(u_xlat4.xyz, float3(u_xlat25), (-u_xlat3.xyz));
    u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat25 = max(u_xlat25, 0.00100000005);
    u_xlat25 = rsqrt(u_xlat25);
    u_xlat4.xyz = float3(u_xlat25) * u_xlat4.xyz;
    u_xlat25 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat26 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat26 = clamp(u_xlat26, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat10 = dot(u_xlat5.xyz, u_xlat4.xyz);
    u_xlat10 = clamp(u_xlat10, 0.0f, 1.0f);
    u_xlat18 = u_xlat10 * u_xlat10;
    u_xlat18 = dot(float2(u_xlat18), float2(u_xlat24));
    u_xlat18 = u_xlat18 + -0.5;
    u_xlat3.x = (-u_xlat26) + 1.0;
    u_xlat11 = u_xlat3.x * u_xlat3.x;
    u_xlat11 = u_xlat11 * u_xlat11;
    u_xlat3.x = u_xlat3.x * u_xlat11;
    u_xlat3.x = fma(u_xlat18, u_xlat3.x, 1.0);
    u_xlat11 = -abs(u_xlat25) + 1.0;
    u_xlat19 = u_xlat11 * u_xlat11;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat11 = u_xlat11 * u_xlat19;
    u_xlat18 = fma(u_xlat18, u_xlat11, 1.0);
    u_xlat18 = u_xlat18 * u_xlat3.x;
    u_xlat18 = u_xlat26 * u_xlat18;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = max(u_xlat24, 0.00200000009);
    u_xlat3.x = (-u_xlat24) + 1.0;
    u_xlat11 = fma(abs(u_xlat25), u_xlat3.x, u_xlat24);
    u_xlat3.x = fma(u_xlat26, u_xlat3.x, u_xlat24);
    u_xlat25 = abs(u_xlat25) * u_xlat3.x;
    u_xlat25 = fma(u_xlat26, u_xlat11, u_xlat25);
    u_xlat25 = u_xlat25 + 9.99999975e-06;
    u_xlat25 = 0.5 / u_xlat25;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat3.x = fma(u_xlat2.x, u_xlat24, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat3.x, u_xlat2.x, 1.0);
    u_xlat24 = u_xlat24 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat24 = u_xlat24 / u_xlat2.x;
    u_xlat24 = u_xlat24 * u_xlat25;
    u_xlat24 = u_xlat26 * u_xlat24;
    u_xlat24 = u_xlat24 * 3.14159274;
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat25 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb25 = u_xlat25!=0.0;
    u_xlat25 = u_xlatb25 ? 1.0 : float(0.0);
    u_xlat24 = u_xlat24 * u_xlat25;
    u_xlat2.xzw = float3(u_xlat18) * u_xlat6.xyz;
    u_xlat3.xyz = u_xlat6.xyz * float3(u_xlat24);
    u_xlat24 = (-u_xlat10) + 1.0;
    u_xlat25 = u_xlat24 * u_xlat24;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat24 = u_xlat24 * u_xlat25;
    u_xlat4.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat0.xyz = fma(u_xlat4.xyz, float3(u_xlat24), u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    output.SV_Target0.xyz = fma(u_xlat1.xyz, u_xlat2.xzw, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: POINT_COOKIE SHADOWS_CUBE
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (336 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Matrix4x4 unity_WorldToLight at 272
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 _MainTex_ST at 224
  Vector4 _DetailAlbedoMap_ST at 240
  Float _UVSec at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float3 TEXCOORD6 [[ user(TEXCOORD6) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float4 u_xlat2;
    float u_xlat10;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat0);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    output.TEXCOORD1.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    output.TEXCOORD1.w = 0.0;
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    output.TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.w = 0.0;
    output.TEXCOORD2 = u_xlat2.wwwx;
    output.TEXCOORD3 = u_xlat2.wwwy;
    output.TEXCOORD4.w = u_xlat2.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD4.xyz = float3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * VGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, u_xlat0.xxx, u_xlat1.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, u_xlat0.zzz, u_xlat1.xyz);
    output.TEXCOORD6.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xyz, u_xlat0.www, u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTextureB0" to slot 1 sampler slot 4
Set CUBE Texture "_LightTexture0" to slot 2 sampler slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0
Set CUBE Texture "_ShadowMapTexture" to slot 4 sampler slot 1

Constant Buffer "FGlobals" (384 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 96
  Matrix4x4 unity_ProbeVolumeWorldToObject at 176
  Matrix4x4 unity_WorldToLight at 320
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _LightPositionRange at 16
  Vector4 _LightProjectionParams at 32
  Vector4 unity_OcclusionMaskSelector at 48
  Vector4 _LightShadowData at 64
  Vector4 unity_ShadowFadeCenterAndType at 80
  Vector4 unity_ProbeVolumeParams at 160
  Vector3 unity_ProbeVolumeSizeInv at 240
  Vector3 unity_ProbeVolumeMin at 256
  Vector4 _LightColor0 at 272
  Vector4 _Color at 288
  Float _Metallic at 304
  Float _Glossiness at 308
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _LightPositionRange;
    float4 _LightProjectionParams;
    float4 unity_OcclusionMaskSelector;
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    sampler sampler_LightTexture0 [[ sampler (3) ]],
    sampler sampler_LightTextureB0 [[ sampler (4) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _LightTextureB0 [[ texture(1) ]] ,
    texturecube<float, access::sample > _LightTexture0 [[ texture(2) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(3) ]] ,
    depthcube<float, access::sample > _ShadowMapTexture [[ texture(4) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    float3 u_xlat4;
    float4 u_xlat5;
    float3 u_xlat6;
    float u_xlat9;
    float u_xlat10;
    float u_xlat16;
    float u_xlat17;
    float u_xlat21;
    float u_xlat22;
    bool u_xlatb22;
    float u_xlat23;
    float u_xlat24;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat21 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat2.xyz = float3(u_xlat21) * input.TEXCOORD4.xyz;
    u_xlat21 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat3.xyz = float3(u_xlat21) * input.TEXCOORD1.xyz;
    u_xlat4.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, input.TEXCOORD5.xxx, u_xlat4.xyz);
    u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, input.TEXCOORD5.zzz, u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz + FGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat5.xyz = (-input.TEXCOORD5.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat6.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat21 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = input.TEXCOORD5.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat22 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat22 = sqrt(u_xlat22);
    u_xlat22 = (-u_xlat21) + u_xlat22;
    u_xlat21 = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat22, u_xlat21);
    u_xlat21 = fma(u_xlat21, FGlobals._LightShadowData.z, FGlobals._LightShadowData.w);
    u_xlat21 = clamp(u_xlat21, 0.0f, 1.0f);
    u_xlatb22 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD5.xxx, u_xlat5.xyz);
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD5.zzz, u_xlat5.xyz);
        u_xlat5.xyz = u_xlat5.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb22)) ? u_xlat5.xyz : input.TEXCOORD5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat5.yzw = u_xlat5.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat22 = fma(u_xlat5.y, 0.25, 0.75);
        u_xlat23 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat5.x = max(u_xlat22, u_xlat23);
        u_xlat5 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat22 = dot(u_xlat5, FGlobals.unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0f, 1.0f);
    u_xlat5.xyz = input.TEXCOORD5.xyz + (-FGlobals._LightPositionRange.xyz);
    u_xlat23 = max(abs(u_xlat5.y), abs(u_xlat5.x));
    u_xlat23 = max(abs(u_xlat5.z), u_xlat23);
    u_xlat23 = u_xlat23 + (-FGlobals._LightProjectionParams.z);
    u_xlat23 = max(u_xlat23, 9.99999975e-06);
    u_xlat23 = u_xlat23 * FGlobals._LightProjectionParams.w;
    u_xlat23 = FGlobals._LightProjectionParams.y / u_xlat23;
    u_xlat23 = u_xlat23 + (-FGlobals._LightProjectionParams.x);
    u_xlat23 = (-u_xlat23) + 1.0;
    u_xlat23 = _ShadowMapTexture.sample_compare(sampler_ShadowMapTexture, u_xlat5.xyz, saturate(u_xlat23), level(0.0));
    u_xlat24 = (-FGlobals._LightShadowData.x) + 1.0;
    u_xlat23 = fma(u_xlat23, u_xlat24, FGlobals._LightShadowData.x);
    u_xlat22 = u_xlat22 + (-u_xlat23);
    u_xlat21 = fma(u_xlat21, u_xlat22, u_xlat23);
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = _LightTextureB0.sample(sampler_LightTextureB0, float2(u_xlat22)).x;
    u_xlat23 = _LightTexture0.sample(sampler_LightTexture0, u_xlat4.xyz).w;
    u_xlat22 = u_xlat22 * u_xlat23;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.x = input.TEXCOORD2.w;
    u_xlat4.y = input.TEXCOORD3.w;
    u_xlat4.z = input.TEXCOORD4.w;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat5.xyz = float3(u_xlat22) * u_xlat4.xyz;
    u_xlat6.xyz = float3(u_xlat21) * FGlobals._LightColor0.xyz;
    u_xlat21 = (-FGlobals._Glossiness) + 1.0;
    u_xlat4.xyz = fma(u_xlat4.xyz, float3(u_xlat22), (-u_xlat3.xyz));
    u_xlat22 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat22 = max(u_xlat22, 0.00100000005);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat4.xyz = float3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat23 = clamp(u_xlat23, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat9 = dot(u_xlat5.xyz, u_xlat4.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0f, 1.0f);
    u_xlat16 = u_xlat9 * u_xlat9;
    u_xlat16 = dot(float2(u_xlat16), float2(u_xlat21));
    u_xlat16 = u_xlat16 + -0.5;
    u_xlat3.x = (-u_xlat23) + 1.0;
    u_xlat10 = u_xlat3.x * u_xlat3.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat3.x = u_xlat3.x * u_xlat10;
    u_xlat3.x = fma(u_xlat16, u_xlat3.x, 1.0);
    u_xlat10 = -abs(u_xlat22) + 1.0;
    u_xlat17 = u_xlat10 * u_xlat10;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat10 = u_xlat10 * u_xlat17;
    u_xlat16 = fma(u_xlat16, u_xlat10, 1.0);
    u_xlat16 = u_xlat16 * u_xlat3.x;
    u_xlat16 = u_xlat23 * u_xlat16;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat21 = max(u_xlat21, 0.00200000009);
    u_xlat3.x = (-u_xlat21) + 1.0;
    u_xlat10 = fma(abs(u_xlat22), u_xlat3.x, u_xlat21);
    u_xlat3.x = fma(u_xlat23, u_xlat3.x, u_xlat21);
    u_xlat22 = abs(u_xlat22) * u_xlat3.x;
    u_xlat22 = fma(u_xlat23, u_xlat10, u_xlat22);
    u_xlat22 = u_xlat22 + 9.99999975e-06;
    u_xlat22 = 0.5 / u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat21;
    u_xlat3.x = fma(u_xlat2.x, u_xlat21, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat3.x, u_xlat2.x, 1.0);
    u_xlat21 = u_xlat21 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat21 = u_xlat21 / u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = u_xlat23 * u_xlat21;
    u_xlat21 = u_xlat21 * 3.14159274;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb22 = u_xlat22!=0.0;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat2.xzw = float3(u_xlat16) * u_xlat6.xyz;
    u_xlat3.xyz = u_xlat6.xyz * float3(u_xlat21);
    u_xlat21 = (-u_xlat9) + 1.0;
    u_xlat22 = u_xlat21 * u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat0.xyz = fma(u_xlat4.xyz, float3(u_xlat21), u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    output.SV_Target0.xyz = fma(u_xlat1.xyz, u_xlat2.xzw, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: POINT_COOKIE SHADOWS_CUBE SHADOWS_SOFT
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (336 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Matrix4x4 unity_WorldToLight at 272
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 _MainTex_ST at 224
  Vector4 _DetailAlbedoMap_ST at 240
  Float _UVSec at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float3 TEXCOORD6 [[ user(TEXCOORD6) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float4 u_xlat2;
    float u_xlat10;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat0);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    output.TEXCOORD1.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    output.TEXCOORD1.w = 0.0;
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    output.TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.w = 0.0;
    output.TEXCOORD2 = u_xlat2.wwwx;
    output.TEXCOORD3 = u_xlat2.wwwy;
    output.TEXCOORD4.w = u_xlat2.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD4.xyz = float3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * VGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, u_xlat0.xxx, u_xlat1.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, u_xlat0.zzz, u_xlat1.xyz);
    output.TEXCOORD6.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xyz, u_xlat0.www, u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTextureB0" to slot 1 sampler slot 4
Set CUBE Texture "_LightTexture0" to slot 2 sampler slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0
Set CUBE Texture "_ShadowMapTexture" to slot 4 sampler slot 1

Constant Buffer "FGlobals" (384 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 96
  Matrix4x4 unity_ProbeVolumeWorldToObject at 176
  Matrix4x4 unity_WorldToLight at 320
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _LightPositionRange at 16
  Vector4 _LightProjectionParams at 32
  Vector4 unity_OcclusionMaskSelector at 48
  Vector4 _LightShadowData at 64
  Vector4 unity_ShadowFadeCenterAndType at 80
  Vector4 unity_ProbeVolumeParams at 160
  Vector3 unity_ProbeVolumeSizeInv at 240
  Vector3 unity_ProbeVolumeMin at 256
  Vector4 _LightColor0 at 272
  Vector4 _Color at 288
  Float _Metallic at 304
  Float _Glossiness at 308
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _LightPositionRange;
    float4 _LightProjectionParams;
    float4 unity_OcclusionMaskSelector;
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    sampler sampler_LightTexture0 [[ sampler (3) ]],
    sampler sampler_LightTextureB0 [[ sampler (4) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _LightTextureB0 [[ texture(1) ]] ,
    texturecube<float, access::sample > _LightTexture0 [[ texture(2) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(3) ]] ,
    depthcube<float, access::sample > _ShadowMapTexture [[ texture(4) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    float3 u_xlat4;
    float4 u_xlat5;
    float4 u_xlat6;
    float3 u_xlat7;
    float u_xlat10;
    float u_xlat11;
    float u_xlat18;
    float u_xlat19;
    float u_xlat24;
    float u_xlat25;
    bool u_xlatb25;
    float u_xlat26;
    bool u_xlatb26;
    float u_xlat27;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat24 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat24) * u_xlat1.xyz;
    u_xlat24 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat24 = rsqrt(u_xlat24);
    u_xlat2.xyz = float3(u_xlat24) * input.TEXCOORD4.xyz;
    u_xlat24 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat24 = rsqrt(u_xlat24);
    u_xlat3.xyz = float3(u_xlat24) * input.TEXCOORD1.xyz;
    u_xlat4.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, input.TEXCOORD5.xxx, u_xlat4.xyz);
    u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, input.TEXCOORD5.zzz, u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz + FGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat5.xyz = (-input.TEXCOORD5.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat6.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat24 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = input.TEXCOORD5.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat25 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat25 = sqrt(u_xlat25);
    u_xlat25 = (-u_xlat24) + u_xlat25;
    u_xlat24 = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat25, u_xlat24);
    u_xlat24 = fma(u_xlat24, FGlobals._LightShadowData.z, FGlobals._LightShadowData.w);
    u_xlat24 = clamp(u_xlat24, 0.0f, 1.0f);
    u_xlatb25 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb25){
        u_xlatb25 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD5.xxx, u_xlat5.xyz);
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD5.zzz, u_xlat5.xyz);
        u_xlat5.xyz = u_xlat5.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb25)) ? u_xlat5.xyz : input.TEXCOORD5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat5.yzw = u_xlat5.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat25 = fma(u_xlat5.y, 0.25, 0.75);
        u_xlat26 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat5.x = max(u_xlat25, u_xlat26);
        u_xlat5 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat25 = dot(u_xlat5, FGlobals.unity_OcclusionMaskSelector);
    u_xlat25 = clamp(u_xlat25, 0.0f, 1.0f);
    u_xlatb26 = u_xlat24<0.99000001;
    if(u_xlatb26){
        u_xlat5.xyz = input.TEXCOORD5.xyz + (-FGlobals._LightPositionRange.xyz);
        u_xlat26 = max(abs(u_xlat5.y), abs(u_xlat5.x));
        u_xlat26 = max(abs(u_xlat5.z), u_xlat26);
        u_xlat26 = u_xlat26 + (-FGlobals._LightProjectionParams.z);
        u_xlat26 = max(u_xlat26, 9.99999975e-06);
        u_xlat26 = u_xlat26 * FGlobals._LightProjectionParams.w;
        u_xlat26 = FGlobals._LightProjectionParams.y / u_xlat26;
        u_xlat26 = u_xlat26 + (-FGlobals._LightProjectionParams.x);
        u_xlat26 = (-u_xlat26) + 1.0;
        u_xlat6.xyz = u_xlat5.xyz + float3(0.0078125, 0.0078125, 0.0078125);
        u_xlat6.x = _ShadowMapTexture.sample_compare(sampler_ShadowMapTexture, u_xlat6.xyz, saturate(u_xlat26), level(0.0));
        u_xlat7.xyz = u_xlat5.xyz + float3(-0.0078125, -0.0078125, 0.0078125);
        u_xlat6.y = _ShadowMapTexture.sample_compare(sampler_ShadowMapTexture, u_xlat7.xyz, saturate(u_xlat26), level(0.0));
        u_xlat7.xyz = u_xlat5.xyz + float3(-0.0078125, 0.0078125, -0.0078125);
        u_xlat6.z = _ShadowMapTexture.sample_compare(sampler_ShadowMapTexture, u_xlat7.xyz, saturate(u_xlat26), level(0.0));
        u_xlat5.xyz = u_xlat5.xyz + float3(0.0078125, -0.0078125, -0.0078125);
        u_xlat6.w = _ShadowMapTexture.sample_compare(sampler_ShadowMapTexture, u_xlat5.xyz, saturate(u_xlat26), level(0.0));
        u_xlat26 = dot(u_xlat6, float4(0.25, 0.25, 0.25, 0.25));
        u_xlat27 = (-FGlobals._LightShadowData.x) + 1.0;
        u_xlat26 = fma(u_xlat26, u_xlat27, FGlobals._LightShadowData.x);
    } else {
        u_xlat26 = 1.0;
    }
    u_xlat25 = u_xlat25 + (-u_xlat26);
    u_xlat24 = fma(u_xlat24, u_xlat25, u_xlat26);
    u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat25 = _LightTextureB0.sample(sampler_LightTextureB0, float2(u_xlat25)).x;
    u_xlat26 = _LightTexture0.sample(sampler_LightTexture0, u_xlat4.xyz).w;
    u_xlat25 = u_xlat25 * u_xlat26;
    u_xlat24 = u_xlat24 * u_xlat25;
    u_xlat4.x = input.TEXCOORD2.w;
    u_xlat4.y = input.TEXCOORD3.w;
    u_xlat4.z = input.TEXCOORD4.w;
    u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat25 = rsqrt(u_xlat25);
    u_xlat5.xyz = float3(u_xlat25) * u_xlat4.xyz;
    u_xlat6.xyz = float3(u_xlat24) * FGlobals._LightColor0.xyz;
    u_xlat24 = (-FGlobals._Glossiness) + 1.0;
    u_xlat4.xyz = fma(u_xlat4.xyz, float3(u_xlat25), (-u_xlat3.xyz));
    u_xlat25 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat25 = max(u_xlat25, 0.00100000005);
    u_xlat25 = rsqrt(u_xlat25);
    u_xlat4.xyz = float3(u_xlat25) * u_xlat4.xyz;
    u_xlat25 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat26 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat26 = clamp(u_xlat26, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat4.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat10 = dot(u_xlat5.xyz, u_xlat4.xyz);
    u_xlat10 = clamp(u_xlat10, 0.0f, 1.0f);
    u_xlat18 = u_xlat10 * u_xlat10;
    u_xlat18 = dot(float2(u_xlat18), float2(u_xlat24));
    u_xlat18 = u_xlat18 + -0.5;
    u_xlat3.x = (-u_xlat26) + 1.0;
    u_xlat11 = u_xlat3.x * u_xlat3.x;
    u_xlat11 = u_xlat11 * u_xlat11;
    u_xlat3.x = u_xlat3.x * u_xlat11;
    u_xlat3.x = fma(u_xlat18, u_xlat3.x, 1.0);
    u_xlat11 = -abs(u_xlat25) + 1.0;
    u_xlat19 = u_xlat11 * u_xlat11;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat11 = u_xlat11 * u_xlat19;
    u_xlat18 = fma(u_xlat18, u_xlat11, 1.0);
    u_xlat18 = u_xlat18 * u_xlat3.x;
    u_xlat18 = u_xlat26 * u_xlat18;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat24 = max(u_xlat24, 0.00200000009);
    u_xlat3.x = (-u_xlat24) + 1.0;
    u_xlat11 = fma(abs(u_xlat25), u_xlat3.x, u_xlat24);
    u_xlat3.x = fma(u_xlat26, u_xlat3.x, u_xlat24);
    u_xlat25 = abs(u_xlat25) * u_xlat3.x;
    u_xlat25 = fma(u_xlat26, u_xlat11, u_xlat25);
    u_xlat25 = u_xlat25 + 9.99999975e-06;
    u_xlat25 = 0.5 / u_xlat25;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat3.x = fma(u_xlat2.x, u_xlat24, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat3.x, u_xlat2.x, 1.0);
    u_xlat24 = u_xlat24 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat24 = u_xlat24 / u_xlat2.x;
    u_xlat24 = u_xlat24 * u_xlat25;
    u_xlat24 = u_xlat26 * u_xlat24;
    u_xlat24 = u_xlat24 * 3.14159274;
    u_xlat24 = max(u_xlat24, 0.0);
    u_xlat25 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb25 = u_xlat25!=0.0;
    u_xlat25 = u_xlatb25 ? 1.0 : float(0.0);
    u_xlat24 = u_xlat24 * u_xlat25;
    u_xlat2.xzw = float3(u_xlat18) * u_xlat6.xyz;
    u_xlat3.xyz = u_xlat6.xyz * float3(u_xlat24);
    u_xlat24 = (-u_xlat10) + 1.0;
    u_xlat25 = u_xlat24 * u_xlat24;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat24 = u_xlat24 * u_xlat25;
    u_xlat4.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat0.xyz = fma(u_xlat4.xyz, float3(u_xlat24), u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    output.SV_Target0.xyz = fma(u_xlat1.xyz, u_xlat2.xzw, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


 }
 Pass {
  Name "ShadowCaster"
  Tags { "LIGHTMODE"="SHADOWCASTER" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords: SHADOWS_DEPTH
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"

Constant Buffer "VGlobals" (224 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_LightShadowBias at 16
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 unity_LightShadowBias;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float u_xlat6;
    float u_xlat9;
    bool u_xlatb9;
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat0.xyz = float3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat1);
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat2.xyz = float3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = fma((-u_xlat9), u_xlat9, 1.0);
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * VGlobals.unity_LightShadowBias.z;
    u_xlat0.xyz = fma((-u_xlat0.xyz), float3(u_xlat9), u_xlat1.xyz);
    u_xlatb9 = VGlobals.unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat2);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat2);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    u_xlat1.x = VGlobals.unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = min(u_xlat1.x, 0.0);
    u_xlat1.x = max(u_xlat1.x, -1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.w, u_xlat6);
    output.mtl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    output.mtl_Position.z = fma(VGlobals.unity_LightShadowBias.y, u_xlat0.x, u_xlat6);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
)
{
    Mtl_FragmentOut output;
    output.SV_Target0 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: SHADOWS_CUBE
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"

Constant Buffer "VGlobals" (224 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_LightShadowBias at 16
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 unity_LightShadowBias;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float u_xlat9;
    bool u_xlatb9;
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat0.xyz = float3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat1);
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat2.xyz = float3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = fma((-u_xlat9), u_xlat9, 1.0);
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * VGlobals.unity_LightShadowBias.z;
    u_xlat0.xyz = fma((-u_xlat0.xyz), float3(u_xlat9), u_xlat1.xyz);
    u_xlatb9 = VGlobals.unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat2);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat2);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    u_xlat1.x = min(u_xlat0.w, u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    output.mtl_Position.z = fma(VGlobals.unity_LightShadowBias.y, u_xlat1.x, u_xlat0.z);
    output.mtl_Position.xyw = u_xlat0.xyw;
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
)
{
    Mtl_FragmentOut output;
    output.SV_Target0 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


 }
 Pass {
  Name "DEFERRED"
  Tags { "LIGHTMODE"="DEFERRED" "RenderType"="Opaque" "PerformanceChecks"="False" }
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (244 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _MainTex_ST at 208
  Vector4 _DetailAlbedoMap_ST at 224
  Float _UVSec at 240
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    bool u_xlatb0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    u_xlatb0 = VGlobals._UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat0.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat0.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    output.TEXCOORD1.xyz = u_xlat0.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat0.w = 0.0;
    output.TEXCOORD2 = u_xlat0.wwwx;
    output.TEXCOORD3 = u_xlat0.wwwy;
    output.TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    output.TEXCOORD4.xyz = float3(u_xlat6) * u_xlat0.xyz;
    output.TEXCOORD5 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_OcclusionMap" to slot 1

Constant Buffer "FGlobals" (28 bytes) on slot 0 {
  Vector4 _Color at 0
  Float _Metallic at 16
  Float _Glossiness at 20
  Float _OcclusionStrength at 24
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
constant const uint rp_output_remap_1 = (rp_output_remap_mask >> 4) & 0xF;
constant const uint rp_output_remap_2 = (rp_output_remap_mask >> 8) & 0xF;
constant const uint rp_output_remap_3 = (rp_output_remap_mask >> 12) & 0xF;
struct FGlobals_Type
{
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float _OcclusionStrength;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
    float4 SV_Target1 [[ color(rp_output_remap_1) ]];
    float4 SV_Target2 [[ color(rp_output_remap_2) ]];
    float4 SV_Target3 [[ color(rp_output_remap_3) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    sampler sampler_OcclusionMap [[ sampler (1) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _OcclusionMap [[ texture(1) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    u_xlat0.x = _OcclusionMap.sample(sampler_OcclusionMap, input.TEXCOORD0.xy).y;
    u_xlat2.x = (-FGlobals._OcclusionStrength) + 1.0;
    output.SV_Target0.w = fma(u_xlat0.x, FGlobals._OcclusionStrength, u_xlat2.x);
    u_xlat0.x = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat2.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat2.xyz * FGlobals._Color.xyz;
    u_xlat2.xyz = fma(FGlobals._Color.xyz, u_xlat2.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    output.SV_Target1.xyz = fma(float3(FGlobals._Metallic), u_xlat2.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    output.SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    output.SV_Target1.w = FGlobals._Glossiness;
    u_xlat0.x = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * input.TEXCOORD4.xyz;
    output.SV_Target2.xyz = fma(u_xlat0.xyz, float3(0.5, 0.5, 0.5), float3(0.5, 0.5, 0.5));
    output.SV_Target2.w = 1.0;
    output.SV_Target3 = float4(1.0, 1.0, 1.0, 1.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: LIGHTPROBE_SH
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (308 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 80
  Matrix4x4 unity_WorldToObject at 144
  Matrix4x4 unity_MatrixVP at 208
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 unity_SHBr at 16
  Vector4 unity_SHBg at 32
  Vector4 unity_SHBb at 48
  Vector4 unity_SHC at 64
  Vector4 _MainTex_ST at 272
  Vector4 _DetailAlbedoMap_ST at 288
  Float _UVSec at 304
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 unity_SHBr;
    float4 unity_SHBg;
    float4 unity_SHBb;
    float4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    bool u_xlatb0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    u_xlatb0 = VGlobals._UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat0.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat0.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    output.TEXCOORD1.xyz = u_xlat0.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat0.w = 0.0;
    output.TEXCOORD2 = u_xlat0.wwwx;
    output.TEXCOORD3 = u_xlat0.wwwy;
    output.TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    u_xlat0.xyz = float3(u_xlat6) * u_xlat0.xyz;
    output.TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat6 = u_xlat0.y * u_xlat0.y;
    u_xlat6 = fma(u_xlat0.x, u_xlat0.x, (-u_xlat6));
    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat0.x = dot(VGlobals.unity_SHBr, u_xlat1);
    u_xlat0.y = dot(VGlobals.unity_SHBg, u_xlat1);
    u_xlat0.z = dot(VGlobals.unity_SHBb, u_xlat1);
    output.TEXCOORD5.xyz = fma(VGlobals.unity_SHC.xyz, float3(u_xlat6), u_xlat0.xyz);
    output.TEXCOORD5.w = 0.0;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: LIGHTPROBE_SH _EMISSION
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_OcclusionMap" to slot 1 sampler slot 2
Set 2D Texture "_EmissionMap" to slot 2 sampler slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0

Constant Buffer "FGlobals" (208 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Vector4 unity_SHAr at 0
  Vector4 unity_SHAg at 16
  Vector4 unity_SHAb at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _Color at 160
  Float _Metallic at 176
  Float _Glossiness at 180
  Float _OcclusionStrength at 184
  Vector4 _EmissionColor at 192
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
constant const uint rp_output_remap_1 = (rp_output_remap_mask >> 4) & 0xF;
constant const uint rp_output_remap_2 = (rp_output_remap_mask >> 8) & 0xF;
constant const uint rp_output_remap_3 = (rp_output_remap_mask >> 12) & 0xF;
struct FGlobals_Type
{
    float4 unity_SHAr;
    float4 unity_SHAg;
    float4 unity_SHAb;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float _OcclusionStrength;
    float4 _EmissionColor;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
    float4 SV_Target1 [[ color(rp_output_remap_1) ]];
    float4 SV_Target2 [[ color(rp_output_remap_2) ]];
    float4 SV_Target3 [[ color(rp_output_remap_3) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    sampler sampler_OcclusionMap [[ sampler (2) ]],
    sampler sampler_EmissionMap [[ sampler (3) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _OcclusionMap [[ texture(1) ]] ,
    texture2d<float, access::sample > _EmissionMap [[ texture(2) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(3) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    bool u_xlatb2;
    float4 u_xlat3;
    float4 u_xlat4;
    float3 u_xlat7;
    float3 u_xlat8;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    output.SV_Target1.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat0.x = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * input.TEXCOORD4.xyz;
    u_xlat2.x = _OcclusionMap.sample(sampler_OcclusionMap, input.TEXCOORD0.xy).y;
    u_xlat7.x = (-FGlobals._OcclusionStrength) + 1.0;
    u_xlat0.w = fma(u_xlat2.x, FGlobals._OcclusionStrength, u_xlat7.x);
    u_xlatb2 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb2 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = input.TEXCOORD3.www * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.www, u_xlat7.xyz);
        u_xlat7.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD4.www, u_xlat7.xyz);
        u_xlat7.xyz = u_xlat7.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat8.x = input.TEXCOORD2.w;
        u_xlat8.y = input.TEXCOORD3.w;
        u_xlat8.z = input.TEXCOORD4.w;
        u_xlat2.xyz = (bool(u_xlatb2)) ? u_xlat7.xyz : u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat2.yzw = u_xlat2.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat7.x = u_xlat2.y * 0.25;
        u_xlat3.x = FGlobals.unity_ProbeVolumeParams.z * 0.5;
        u_xlat8.x = fma((-FGlobals.unity_ProbeVolumeParams.z), 0.5, 0.25);
        u_xlat7.x = max(u_xlat7.x, u_xlat3.x);
        u_xlat2.x = min(u_xlat8.x, u_xlat7.x);
        u_xlat3 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat2.xzw);
        u_xlat4.xyz = u_xlat2.xzw + float3(0.25, 0.0, 0.0);
        u_xlat4 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat4.xyz);
        u_xlat2.xyz = u_xlat2.xzw + float3(0.5, 0.0, 0.0);
        u_xlat2 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat2.xyz);
        u_xlat1.w = 1.0;
        u_xlat3.x = dot(u_xlat3, u_xlat1);
        u_xlat3.y = dot(u_xlat4, u_xlat1);
        u_xlat3.z = dot(u_xlat2, u_xlat1);
    } else {
        u_xlat1.w = 1.0;
        u_xlat3.x = dot(FGlobals.unity_SHAr, u_xlat1);
        u_xlat3.y = dot(FGlobals.unity_SHAg, u_xlat1);
        u_xlat3.z = dot(FGlobals.unity_SHAb, u_xlat1);
    }
    u_xlat2.xyz = u_xlat3.xyz + input.TEXCOORD5.xyz;
    u_xlat2.xyz = max(u_xlat2.xyz, float3(0.0, 0.0, 0.0));
    u_xlat2.xyz = u_xlat0.www * u_xlat2.xyz;
    u_xlat3.xyz = _EmissionMap.sample(sampler_EmissionMap, input.TEXCOORD0.xy).xyz;
    u_xlat3.xyz = u_xlat3.xyz * FGlobals._EmissionColor.xyz;
    u_xlat2.xyz = fma(u_xlat0.xyz, u_xlat2.xyz, u_xlat3.xyz);
    output.SV_Target3.xyz = exp2((-u_xlat2.xyz));
    output.SV_Target2.xyz = fma(u_xlat1.xyz, float3(0.5, 0.5, 0.5), float3(0.5, 0.5, 0.5));
    output.SV_Target0 = u_xlat0;
    output.SV_Target1.w = FGlobals._Glossiness;
    output.SV_Target2.w = 1.0;
    output.SV_Target3.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: LIGHTPROBE_SH
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_OcclusionMap" to slot 1 sampler slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 2 sampler slot 0

Constant Buffer "FGlobals" (188 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Vector4 unity_SHAr at 0
  Vector4 unity_SHAg at 16
  Vector4 unity_SHAb at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _Color at 160
  Float _Metallic at 176
  Float _Glossiness at 180
  Float _OcclusionStrength at 184
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
constant const uint rp_output_remap_1 = (rp_output_remap_mask >> 4) & 0xF;
constant const uint rp_output_remap_2 = (rp_output_remap_mask >> 8) & 0xF;
constant const uint rp_output_remap_3 = (rp_output_remap_mask >> 12) & 0xF;
struct FGlobals_Type
{
    float4 unity_SHAr;
    float4 unity_SHAg;
    float4 unity_SHAb;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float _OcclusionStrength;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
    float4 SV_Target1 [[ color(rp_output_remap_1) ]];
    float4 SV_Target2 [[ color(rp_output_remap_2) ]];
    float4 SV_Target3 [[ color(rp_output_remap_3) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    sampler sampler_OcclusionMap [[ sampler (2) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _OcclusionMap [[ texture(1) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(2) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    bool u_xlatb2;
    float4 u_xlat3;
    float4 u_xlat4;
    float3 u_xlat7;
    float3 u_xlat8;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    output.SV_Target1.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat0.x = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * input.TEXCOORD4.xyz;
    u_xlat2.x = _OcclusionMap.sample(sampler_OcclusionMap, input.TEXCOORD0.xy).y;
    u_xlat7.x = (-FGlobals._OcclusionStrength) + 1.0;
    u_xlat0.w = fma(u_xlat2.x, FGlobals._OcclusionStrength, u_xlat7.x);
    u_xlatb2 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb2 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = input.TEXCOORD3.www * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.www, u_xlat7.xyz);
        u_xlat7.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD4.www, u_xlat7.xyz);
        u_xlat7.xyz = u_xlat7.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat8.x = input.TEXCOORD2.w;
        u_xlat8.y = input.TEXCOORD3.w;
        u_xlat8.z = input.TEXCOORD4.w;
        u_xlat2.xyz = (bool(u_xlatb2)) ? u_xlat7.xyz : u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat2.yzw = u_xlat2.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat7.x = u_xlat2.y * 0.25;
        u_xlat3.x = FGlobals.unity_ProbeVolumeParams.z * 0.5;
        u_xlat8.x = fma((-FGlobals.unity_ProbeVolumeParams.z), 0.5, 0.25);
        u_xlat7.x = max(u_xlat7.x, u_xlat3.x);
        u_xlat2.x = min(u_xlat8.x, u_xlat7.x);
        u_xlat3 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat2.xzw);
        u_xlat4.xyz = u_xlat2.xzw + float3(0.25, 0.0, 0.0);
        u_xlat4 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat4.xyz);
        u_xlat2.xyz = u_xlat2.xzw + float3(0.5, 0.0, 0.0);
        u_xlat2 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat2.xyz);
        u_xlat1.w = 1.0;
        u_xlat3.x = dot(u_xlat3, u_xlat1);
        u_xlat3.y = dot(u_xlat4, u_xlat1);
        u_xlat3.z = dot(u_xlat2, u_xlat1);
    } else {
        u_xlat1.w = 1.0;
        u_xlat3.x = dot(FGlobals.unity_SHAr, u_xlat1);
        u_xlat3.y = dot(FGlobals.unity_SHAg, u_xlat1);
        u_xlat3.z = dot(FGlobals.unity_SHAb, u_xlat1);
    }
    u_xlat2.xyz = u_xlat3.xyz + input.TEXCOORD5.xyz;
    u_xlat2.xyz = max(u_xlat2.xyz, float3(0.0, 0.0, 0.0));
    u_xlat2.xyz = u_xlat0.www * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz;
    output.SV_Target3.xyz = exp2((-u_xlat2.xyz));
    output.SV_Target2.xyz = fma(u_xlat1.xyz, float3(0.5, 0.5, 0.5), float3(0.5, 0.5, 0.5));
    output.SV_Target0 = u_xlat0;
    output.SV_Target1.w = FGlobals._Glossiness;
    output.SV_Target2.w = 1.0;
    output.SV_Target3.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: UNITY_HDR_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (244 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _MainTex_ST at 208
  Vector4 _DetailAlbedoMap_ST at 224
  Float _UVSec at 240
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    bool u_xlatb0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    u_xlatb0 = VGlobals._UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat0.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat0.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    output.TEXCOORD1.xyz = u_xlat0.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat0.w = 0.0;
    output.TEXCOORD2 = u_xlat0.wwwx;
    output.TEXCOORD3 = u_xlat0.wwwy;
    output.TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    output.TEXCOORD4.xyz = float3(u_xlat6) * u_xlat0.xyz;
    output.TEXCOORD5 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: LIGHTPROBE_SH UNITY_HDR_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (308 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 80
  Matrix4x4 unity_WorldToObject at 144
  Matrix4x4 unity_MatrixVP at 208
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 unity_SHBr at 16
  Vector4 unity_SHBg at 32
  Vector4 unity_SHBb at 48
  Vector4 unity_SHC at 64
  Vector4 _MainTex_ST at 272
  Vector4 _DetailAlbedoMap_ST at 288
  Float _UVSec at 304
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 unity_SHBr;
    float4 unity_SHBg;
    float4 unity_SHBb;
    float4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    bool u_xlatb0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    u_xlatb0 = VGlobals._UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat0.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat0.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    output.TEXCOORD1.xyz = u_xlat0.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat0.w = 0.0;
    output.TEXCOORD2 = u_xlat0.wwwx;
    output.TEXCOORD3 = u_xlat0.wwwy;
    output.TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    u_xlat0.xyz = float3(u_xlat6) * u_xlat0.xyz;
    output.TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat6 = u_xlat0.y * u_xlat0.y;
    u_xlat6 = fma(u_xlat0.x, u_xlat0.x, (-u_xlat6));
    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat0.x = dot(VGlobals.unity_SHBr, u_xlat1);
    u_xlat0.y = dot(VGlobals.unity_SHBg, u_xlat1);
    u_xlat0.z = dot(VGlobals.unity_SHBb, u_xlat1);
    output.TEXCOORD5.xyz = fma(VGlobals.unity_SHC.xyz, float3(u_xlat6), u_xlat0.xyz);
    output.TEXCOORD5.w = 0.0;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: UNITY_HDR_ON _EMISSION
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_OcclusionMap" to slot 1
Set 2D Texture "_EmissionMap" to slot 2

Constant Buffer "FGlobals" (48 bytes) on slot 0 {
  Vector4 _Color at 0
  Float _Metallic at 16
  Float _Glossiness at 20
  Float _OcclusionStrength at 24
  Vector4 _EmissionColor at 32
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
constant const uint rp_output_remap_1 = (rp_output_remap_mask >> 4) & 0xF;
constant const uint rp_output_remap_2 = (rp_output_remap_mask >> 8) & 0xF;
constant const uint rp_output_remap_3 = (rp_output_remap_mask >> 12) & 0xF;
struct FGlobals_Type
{
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float _OcclusionStrength;
    float4 _EmissionColor;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
    float4 SV_Target1 [[ color(rp_output_remap_1) ]];
    float4 SV_Target2 [[ color(rp_output_remap_2) ]];
    float4 SV_Target3 [[ color(rp_output_remap_3) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    sampler sampler_OcclusionMap [[ sampler (1) ]],
    sampler sampler_EmissionMap [[ sampler (2) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _OcclusionMap [[ texture(1) ]] ,
    texture2d<float, access::sample > _EmissionMap [[ texture(2) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    u_xlat0.x = _OcclusionMap.sample(sampler_OcclusionMap, input.TEXCOORD0.xy).y;
    u_xlat2.x = (-FGlobals._OcclusionStrength) + 1.0;
    output.SV_Target0.w = fma(u_xlat0.x, FGlobals._OcclusionStrength, u_xlat2.x);
    u_xlat0.x = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat2.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat2.xyz * FGlobals._Color.xyz;
    u_xlat2.xyz = fma(FGlobals._Color.xyz, u_xlat2.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    output.SV_Target1.xyz = fma(float3(FGlobals._Metallic), u_xlat2.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    output.SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    output.SV_Target1.w = FGlobals._Glossiness;
    u_xlat0.x = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * input.TEXCOORD4.xyz;
    output.SV_Target2.xyz = fma(u_xlat0.xyz, float3(0.5, 0.5, 0.5), float3(0.5, 0.5, 0.5));
    output.SV_Target2.w = 1.0;
    u_xlat0.xyz = _EmissionMap.sample(sampler_EmissionMap, input.TEXCOORD0.xy).xyz;
    output.SV_Target3.xyz = u_xlat0.xyz * FGlobals._EmissionColor.xyz;
    output.SV_Target3.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: UNITY_HDR_ON
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_OcclusionMap" to slot 1

Constant Buffer "FGlobals" (28 bytes) on slot 0 {
  Vector4 _Color at 0
  Float _Metallic at 16
  Float _Glossiness at 20
  Float _OcclusionStrength at 24
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
constant const uint rp_output_remap_1 = (rp_output_remap_mask >> 4) & 0xF;
constant const uint rp_output_remap_2 = (rp_output_remap_mask >> 8) & 0xF;
constant const uint rp_output_remap_3 = (rp_output_remap_mask >> 12) & 0xF;
struct FGlobals_Type
{
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float _OcclusionStrength;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
    float4 SV_Target1 [[ color(rp_output_remap_1) ]];
    float4 SV_Target2 [[ color(rp_output_remap_2) ]];
    float4 SV_Target3 [[ color(rp_output_remap_3) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    sampler sampler_OcclusionMap [[ sampler (1) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _OcclusionMap [[ texture(1) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    u_xlat0.x = _OcclusionMap.sample(sampler_OcclusionMap, input.TEXCOORD0.xy).y;
    u_xlat2.x = (-FGlobals._OcclusionStrength) + 1.0;
    output.SV_Target0.w = fma(u_xlat0.x, FGlobals._OcclusionStrength, u_xlat2.x);
    u_xlat0.x = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat2.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat2.xyz * FGlobals._Color.xyz;
    u_xlat2.xyz = fma(FGlobals._Color.xyz, u_xlat2.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    output.SV_Target1.xyz = fma(float3(FGlobals._Metallic), u_xlat2.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    output.SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    output.SV_Target1.w = FGlobals._Glossiness;
    u_xlat0.x = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * input.TEXCOORD4.xyz;
    output.SV_Target2.xyz = fma(u_xlat0.xyz, float3(0.5, 0.5, 0.5), float3(0.5, 0.5, 0.5));
    output.SV_Target2.w = 1.0;
    output.SV_Target3 = float4(0.0, 0.0, 0.0, 1.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: LIGHTPROBE_SH UNITY_HDR_ON _EMISSION
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_OcclusionMap" to slot 1 sampler slot 2
Set 2D Texture "_EmissionMap" to slot 2 sampler slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0

Constant Buffer "FGlobals" (208 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Vector4 unity_SHAr at 0
  Vector4 unity_SHAg at 16
  Vector4 unity_SHAb at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _Color at 160
  Float _Metallic at 176
  Float _Glossiness at 180
  Float _OcclusionStrength at 184
  Vector4 _EmissionColor at 192
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
constant const uint rp_output_remap_1 = (rp_output_remap_mask >> 4) & 0xF;
constant const uint rp_output_remap_2 = (rp_output_remap_mask >> 8) & 0xF;
constant const uint rp_output_remap_3 = (rp_output_remap_mask >> 12) & 0xF;
struct FGlobals_Type
{
    float4 unity_SHAr;
    float4 unity_SHAg;
    float4 unity_SHAb;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float _OcclusionStrength;
    float4 _EmissionColor;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
    float4 SV_Target1 [[ color(rp_output_remap_1) ]];
    float4 SV_Target2 [[ color(rp_output_remap_2) ]];
    float4 SV_Target3 [[ color(rp_output_remap_3) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    sampler sampler_OcclusionMap [[ sampler (2) ]],
    sampler sampler_EmissionMap [[ sampler (3) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _OcclusionMap [[ texture(1) ]] ,
    texture2d<float, access::sample > _EmissionMap [[ texture(2) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(3) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    bool u_xlatb2;
    float4 u_xlat3;
    float4 u_xlat4;
    float3 u_xlat7;
    float3 u_xlat8;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    output.SV_Target1.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat0.x = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * input.TEXCOORD4.xyz;
    u_xlat2.x = _OcclusionMap.sample(sampler_OcclusionMap, input.TEXCOORD0.xy).y;
    u_xlat7.x = (-FGlobals._OcclusionStrength) + 1.0;
    u_xlat0.w = fma(u_xlat2.x, FGlobals._OcclusionStrength, u_xlat7.x);
    u_xlatb2 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb2 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = input.TEXCOORD3.www * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.www, u_xlat7.xyz);
        u_xlat7.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD4.www, u_xlat7.xyz);
        u_xlat7.xyz = u_xlat7.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat8.x = input.TEXCOORD2.w;
        u_xlat8.y = input.TEXCOORD3.w;
        u_xlat8.z = input.TEXCOORD4.w;
        u_xlat2.xyz = (bool(u_xlatb2)) ? u_xlat7.xyz : u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat2.yzw = u_xlat2.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat7.x = u_xlat2.y * 0.25;
        u_xlat3.x = FGlobals.unity_ProbeVolumeParams.z * 0.5;
        u_xlat8.x = fma((-FGlobals.unity_ProbeVolumeParams.z), 0.5, 0.25);
        u_xlat7.x = max(u_xlat7.x, u_xlat3.x);
        u_xlat2.x = min(u_xlat8.x, u_xlat7.x);
        u_xlat3 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat2.xzw);
        u_xlat4.xyz = u_xlat2.xzw + float3(0.25, 0.0, 0.0);
        u_xlat4 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat4.xyz);
        u_xlat2.xyz = u_xlat2.xzw + float3(0.5, 0.0, 0.0);
        u_xlat2 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat2.xyz);
        u_xlat1.w = 1.0;
        u_xlat3.x = dot(u_xlat3, u_xlat1);
        u_xlat3.y = dot(u_xlat4, u_xlat1);
        u_xlat3.z = dot(u_xlat2, u_xlat1);
    } else {
        u_xlat1.w = 1.0;
        u_xlat3.x = dot(FGlobals.unity_SHAr, u_xlat1);
        u_xlat3.y = dot(FGlobals.unity_SHAg, u_xlat1);
        u_xlat3.z = dot(FGlobals.unity_SHAb, u_xlat1);
    }
    u_xlat2.xyz = u_xlat3.xyz + input.TEXCOORD5.xyz;
    u_xlat2.xyz = max(u_xlat2.xyz, float3(0.0, 0.0, 0.0));
    u_xlat2.xyz = u_xlat0.www * u_xlat2.xyz;
    u_xlat3.xyz = _EmissionMap.sample(sampler_EmissionMap, input.TEXCOORD0.xy).xyz;
    u_xlat3.xyz = u_xlat3.xyz * FGlobals._EmissionColor.xyz;
    output.SV_Target3.xyz = fma(u_xlat0.xyz, u_xlat2.xyz, u_xlat3.xyz);
    output.SV_Target2.xyz = fma(u_xlat1.xyz, float3(0.5, 0.5, 0.5), float3(0.5, 0.5, 0.5));
    output.SV_Target0 = u_xlat0;
    output.SV_Target1.w = FGlobals._Glossiness;
    output.SV_Target2.w = 1.0;
    output.SV_Target3.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: LIGHTPROBE_SH UNITY_HDR_ON
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_OcclusionMap" to slot 1 sampler slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 2 sampler slot 0

Constant Buffer "FGlobals" (188 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Vector4 unity_SHAr at 0
  Vector4 unity_SHAg at 16
  Vector4 unity_SHAb at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _Color at 160
  Float _Metallic at 176
  Float _Glossiness at 180
  Float _OcclusionStrength at 184
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
constant const uint rp_output_remap_1 = (rp_output_remap_mask >> 4) & 0xF;
constant const uint rp_output_remap_2 = (rp_output_remap_mask >> 8) & 0xF;
constant const uint rp_output_remap_3 = (rp_output_remap_mask >> 12) & 0xF;
struct FGlobals_Type
{
    float4 unity_SHAr;
    float4 unity_SHAg;
    float4 unity_SHAb;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float _OcclusionStrength;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
    float4 SV_Target1 [[ color(rp_output_remap_1) ]];
    float4 SV_Target2 [[ color(rp_output_remap_2) ]];
    float4 SV_Target3 [[ color(rp_output_remap_3) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    sampler sampler_OcclusionMap [[ sampler (2) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _OcclusionMap [[ texture(1) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(2) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    bool u_xlatb2;
    float4 u_xlat3;
    float4 u_xlat4;
    float3 u_xlat7;
    float3 u_xlat8;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    output.SV_Target1.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat0.x = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.x = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * input.TEXCOORD4.xyz;
    u_xlat2.x = _OcclusionMap.sample(sampler_OcclusionMap, input.TEXCOORD0.xy).y;
    u_xlat7.x = (-FGlobals._OcclusionStrength) + 1.0;
    u_xlat0.w = fma(u_xlat2.x, FGlobals._OcclusionStrength, u_xlat7.x);
    u_xlatb2 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb2 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = input.TEXCOORD3.www * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.www, u_xlat7.xyz);
        u_xlat7.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD4.www, u_xlat7.xyz);
        u_xlat7.xyz = u_xlat7.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat8.x = input.TEXCOORD2.w;
        u_xlat8.y = input.TEXCOORD3.w;
        u_xlat8.z = input.TEXCOORD4.w;
        u_xlat2.xyz = (bool(u_xlatb2)) ? u_xlat7.xyz : u_xlat8.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat2.yzw = u_xlat2.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat7.x = u_xlat2.y * 0.25;
        u_xlat3.x = FGlobals.unity_ProbeVolumeParams.z * 0.5;
        u_xlat8.x = fma((-FGlobals.unity_ProbeVolumeParams.z), 0.5, 0.25);
        u_xlat7.x = max(u_xlat7.x, u_xlat3.x);
        u_xlat2.x = min(u_xlat8.x, u_xlat7.x);
        u_xlat3 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat2.xzw);
        u_xlat4.xyz = u_xlat2.xzw + float3(0.25, 0.0, 0.0);
        u_xlat4 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat4.xyz);
        u_xlat2.xyz = u_xlat2.xzw + float3(0.5, 0.0, 0.0);
        u_xlat2 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat2.xyz);
        u_xlat1.w = 1.0;
        u_xlat3.x = dot(u_xlat3, u_xlat1);
        u_xlat3.y = dot(u_xlat4, u_xlat1);
        u_xlat3.z = dot(u_xlat2, u_xlat1);
    } else {
        u_xlat1.w = 1.0;
        u_xlat3.x = dot(FGlobals.unity_SHAr, u_xlat1);
        u_xlat3.y = dot(FGlobals.unity_SHAg, u_xlat1);
        u_xlat3.z = dot(FGlobals.unity_SHAb, u_xlat1);
    }
    u_xlat2.xyz = u_xlat3.xyz + input.TEXCOORD5.xyz;
    u_xlat2.xyz = max(u_xlat2.xyz, float3(0.0, 0.0, 0.0));
    u_xlat2.xyz = u_xlat0.www * u_xlat2.xyz;
    output.SV_Target3.xyz = u_xlat0.xyz * u_xlat2.xyz;
    output.SV_Target2.xyz = fma(u_xlat1.xyz, float3(0.5, 0.5, 0.5), float3(0.5, 0.5, 0.5));
    output.SV_Target0 = u_xlat0;
    output.SV_Target1.w = FGlobals._Glossiness;
    output.SV_Target2.w = 1.0;
    output.SV_Target3.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: _EMISSION
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0
Set 2D Texture "_OcclusionMap" to slot 1
Set 2D Texture "_EmissionMap" to slot 2

Constant Buffer "FGlobals" (48 bytes) on slot 0 {
  Vector4 _Color at 0
  Float _Metallic at 16
  Float _Glossiness at 20
  Float _OcclusionStrength at 24
  Vector4 _EmissionColor at 32
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
constant const uint rp_output_remap_1 = (rp_output_remap_mask >> 4) & 0xF;
constant const uint rp_output_remap_2 = (rp_output_remap_mask >> 8) & 0xF;
constant const uint rp_output_remap_3 = (rp_output_remap_mask >> 12) & 0xF;
struct FGlobals_Type
{
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float _OcclusionStrength;
    float4 _EmissionColor;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
    float4 SV_Target1 [[ color(rp_output_remap_1) ]];
    float4 SV_Target2 [[ color(rp_output_remap_2) ]];
    float4 SV_Target3 [[ color(rp_output_remap_3) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    sampler sampler_OcclusionMap [[ sampler (1) ]],
    sampler sampler_EmissionMap [[ sampler (2) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _OcclusionMap [[ texture(1) ]] ,
    texture2d<float, access::sample > _EmissionMap [[ texture(2) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    u_xlat0.x = _OcclusionMap.sample(sampler_OcclusionMap, input.TEXCOORD0.xy).y;
    u_xlat2.x = (-FGlobals._OcclusionStrength) + 1.0;
    output.SV_Target0.w = fma(u_xlat0.x, FGlobals._OcclusionStrength, u_xlat2.x);
    u_xlat0.x = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat2.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat2.xyz * FGlobals._Color.xyz;
    u_xlat2.xyz = fma(FGlobals._Color.xyz, u_xlat2.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    output.SV_Target1.xyz = fma(float3(FGlobals._Metallic), u_xlat2.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    output.SV_Target0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    output.SV_Target1.w = FGlobals._Glossiness;
    u_xlat0.x = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat0.x = rsqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * input.TEXCOORD4.xyz;
    output.SV_Target2.xyz = fma(u_xlat0.xyz, float3(0.5, 0.5, 0.5), float3(0.5, 0.5, 0.5));
    output.SV_Target2.w = 1.0;
    u_xlat0.xyz = _EmissionMap.sample(sampler_EmissionMap, input.TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * FGlobals._EmissionColor.xyz;
    output.SV_Target3.xyz = exp2((-u_xlat0.xyz));
    output.SV_Target3.w = 1.0;
    return output;
}


 }
}
SubShader { 
 LOD 150
 Tags { "RenderType"="Opaque" "PerformanceChecks"="False" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="FORWARDBASE" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite [_ZWrite]
  Blend [_SrcBlend] [_DstBlend]
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords: DIRECTIONAL
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (244 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _MainTex_ST at 208
  Vector4 _DetailAlbedoMap_ST at 224
  Float _UVSec at 240
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    bool u_xlatb0;
    float4 u_xlat1;
    float u_xlat6;
    float u_xlat7;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    u_xlatb0 = VGlobals._UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat0.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat0.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat1.xyz = u_xlat0.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = rsqrt(u_xlat7);
    output.TEXCOORD1.xyz = float3(u_xlat7) * u_xlat1.xyz;
    output.TEXCOORD1.w = 0.0;
    u_xlat0.w = 0.0;
    output.TEXCOORD2 = u_xlat0.wwwx;
    output.TEXCOORD3 = u_xlat0.wwwy;
    output.TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    output.TEXCOORD4.xyz = float3(u_xlat6) * u_xlat0.xyz;
    output.TEXCOORD5 = float4(0.0, 0.0, 0.0, 0.0);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 3
Set 2D Texture "_OcclusionMap" to slot 1 sampler slot 4
Set 2D Texture "unity_NHxRoughness" to slot 2
Set CUBE Texture "unity_SpecCube0" to slot 3 sampler slot 0
Set 3D Texture "unity_ProbeVolumeSH" to slot 4 sampler slot 1

Constant Buffer "FGlobals" (200 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_OcclusionMaskSelector at 16
  Vector4 unity_SpecCube0_HDR at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Vector4 _Color at 176
  Float _Metallic at 192
  Float _Glossiness at 196
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 unity_SpecCube0_HDR;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_SpecCube0 [[ sampler (0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (1) ]],
    sampler samplerunity_NHxRoughness [[ sampler (2) ]],
    sampler sampler_MainTex [[ sampler (3) ]],
    sampler sampler_OcclusionMap [[ sampler (4) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _OcclusionMap [[ texture(1) ]] ,
    texture2d<float, access::sample > unity_NHxRoughness [[ texture(2) ]] ,
    texturecube<float, access::sample > unity_SpecCube0 [[ texture(3) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(4) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float3 u_xlat5;
    float3 u_xlat6;
    float3 u_xlat9;
    float3 u_xlat11;
    float u_xlat21;
    float u_xlat22;
    bool u_xlatb22;
    float u_xlat23;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat21 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat22 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat2.xyz = float3(u_xlat22) * input.TEXCOORD4.xyz;
    u_xlatb22 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = input.TEXCOORD3.www * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.www, u_xlat3.xyz);
        u_xlat3.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD4.www, u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat11.x = input.TEXCOORD2.w;
        u_xlat11.y = input.TEXCOORD3.w;
        u_xlat11.z = input.TEXCOORD4.w;
        u_xlat3.xyz = (bool(u_xlatb22)) ? u_xlat3.xyz : u_xlat11.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat3.yzw = u_xlat3.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat22 = fma(u_xlat3.y, 0.25, 0.75);
        u_xlat23 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat3.x = max(u_xlat22, u_xlat23);
        u_xlat3 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    }
    u_xlat22 = dot(u_xlat3, FGlobals.unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0f, 1.0f);
    u_xlat23 = _OcclusionMap.sample(sampler_OcclusionMap, input.TEXCOORD0.xy).y;
    u_xlat3.xw = (-float2(FGlobals._Glossiness)) + float2(1.0, 1.0);
    u_xlat4.x = dot(input.TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat4.x = u_xlat4.x + u_xlat4.x;
    u_xlat4.xyz = fma(u_xlat2.xyz, (-u_xlat4.xxx), input.TEXCOORD1.xyz);
    u_xlat5.xyz = float3(u_xlat22) * FGlobals._LightColor0.xyz;
    u_xlat22 = fma((-u_xlat3.x), 0.699999988, 1.70000005);
    u_xlat22 = u_xlat22 * u_xlat3.x;
    u_xlat22 = u_xlat22 * 6.0;
    u_xlat4 = unity_SpecCube0.sample(samplerunity_SpecCube0, u_xlat4.xyz, level(u_xlat22));
    u_xlat22 = u_xlat4.w + -1.0;
    u_xlat22 = fma(FGlobals.unity_SpecCube0_HDR.w, u_xlat22, 1.0);
    u_xlat22 = log2(u_xlat22);
    u_xlat22 = u_xlat22 * FGlobals.unity_SpecCube0_HDR.y;
    u_xlat22 = exp2(u_xlat22);
    u_xlat22 = u_xlat22 * FGlobals.unity_SpecCube0_HDR.x;
    u_xlat4.xyz = u_xlat4.xyz * float3(u_xlat22);
    u_xlat4.xyz = float3(u_xlat23) * u_xlat4.xyz;
    u_xlat22 = dot((-input.TEXCOORD1.xyz), u_xlat2.xyz);
    u_xlat23 = u_xlat22 + u_xlat22;
    u_xlat6.xyz = fma(u_xlat2.xyz, (-float3(u_xlat23)), (-input.TEXCOORD1.xyz));
    u_xlat2.x = dot(u_xlat2.xyz, FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat22 = u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0f, 1.0f);
    u_xlat6.x = dot(u_xlat6.xyz, FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat6.y = (-u_xlat22) + 1.0;
    u_xlat9.xy = u_xlat6.xy * u_xlat6.xy;
    u_xlat3.yz = u_xlat9.xy * u_xlat9.xy;
    u_xlat22 = (-u_xlat21) + FGlobals._Glossiness;
    u_xlat22 = u_xlat22 + 1.0;
    u_xlat22 = clamp(u_xlat22, 0.0f, 1.0f);
    u_xlat9.x = unity_NHxRoughness.sample(samplerunity_NHxRoughness, u_xlat3.yw).x;
    u_xlat9.x = u_xlat9.x * 16.0;
    u_xlat9.xyz = u_xlat0.xyz * u_xlat9.xxx;
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(u_xlat21), u_xlat9.xyz);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat5.xyz;
    u_xlat3.xyw = (-u_xlat0.xyz) + float3(u_xlat22);
    u_xlat0.xyz = fma(u_xlat3.zzz, u_xlat3.xyw, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xyz;
    output.SV_Target0.xyz = fma(u_xlat1.xyz, u_xlat2.xyz, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (356 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 128
  Matrix4x4 unity_WorldToObject at 192
  Matrix4x4 unity_MatrixVP at 256
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 unity_SHAr at 16
  Vector4 unity_SHAg at 32
  Vector4 unity_SHAb at 48
  Vector4 unity_SHBr at 64
  Vector4 unity_SHBg at 80
  Vector4 unity_SHBb at 96
  Vector4 unity_SHC at 112
  Vector4 _MainTex_ST at 320
  Vector4 _DetailAlbedoMap_ST at 336
  Float _UVSec at 352
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 unity_SHAr;
    float4 unity_SHAg;
    float4 unity_SHAb;
    float4 unity_SHBr;
    float4 unity_SHBg;
    float4 unity_SHBb;
    float4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    bool u_xlatb0;
    float4 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    float u_xlat12;
    float u_xlat13;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    u_xlatb0 = VGlobals._UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat0.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat0.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat1.xyz = u_xlat0.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat13 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat13 = rsqrt(u_xlat13);
    output.TEXCOORD1.xyz = float3(u_xlat13) * u_xlat1.xyz;
    output.TEXCOORD1.w = 0.0;
    u_xlat0.w = 0.0;
    output.TEXCOORD2 = u_xlat0.wwwx;
    output.TEXCOORD3 = u_xlat0.wwwy;
    output.TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = rsqrt(u_xlat12);
    u_xlat0.xyz = float3(u_xlat12) * u_xlat0.xyz;
    output.TEXCOORD4.xyz = u_xlat0.xyz;
    u_xlat1.x = u_xlat0.y * u_xlat0.y;
    u_xlat1.x = fma(u_xlat0.x, u_xlat0.x, (-u_xlat1.x));
    u_xlat2 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat3.x = dot(VGlobals.unity_SHBr, u_xlat2);
    u_xlat3.y = dot(VGlobals.unity_SHBg, u_xlat2);
    u_xlat3.z = dot(VGlobals.unity_SHBb, u_xlat2);
    u_xlat1.xyz = fma(VGlobals.unity_SHC.xyz, u_xlat1.xxx, u_xlat3.xyz);
    u_xlat0.w = 1.0;
    u_xlat2.x = dot(VGlobals.unity_SHAr, u_xlat0);
    u_xlat2.y = dot(VGlobals.unity_SHAg, u_xlat0);
    u_xlat2.z = dot(VGlobals.unity_SHAb, u_xlat0);
    u_xlat0.xyz = u_xlat1.xyz + u_xlat2.xyz;
    output.TEXCOORD5.xyz = max(u_xlat0.xyz, float3(0.0, 0.0, 0.0));
    output.TEXCOORD5.w = 0.0;
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL SHADOWS_SCREEN
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (260 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _ProjectionParams at 16
  Vector4 _MainTex_ST at 224
  Vector4 _DetailAlbedoMap_ST at 240
  Float _UVSec at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _ProjectionParams;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float u_xlat7;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    output.mtl_Position = u_xlat0;
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD1.w = 0.0;
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    output.TEXCOORD1.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat1.w = 0.0;
    output.TEXCOORD2 = u_xlat1.wwwx;
    output.TEXCOORD3 = u_xlat1.wwwy;
    output.TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = rsqrt(u_xlat7);
    output.TEXCOORD4.xyz = float3(u_xlat7) * u_xlat1.xyz;
    output.TEXCOORD5 = float4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.y = u_xlat0.y * VGlobals._ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * float3(0.5, 0.5, 0.5);
    output.TEXCOORD7.zw = u_xlat0.zw;
    output.TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH SHADOWS_SCREEN
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (324 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 96
  Matrix4x4 unity_WorldToObject at 160
  Matrix4x4 unity_MatrixVP at 224
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _ProjectionParams at 16
  Vector4 unity_SHBr at 32
  Vector4 unity_SHBg at 48
  Vector4 unity_SHBb at 64
  Vector4 unity_SHC at 80
  Vector4 _MainTex_ST at 288
  Vector4 _DetailAlbedoMap_ST at 304
  Float _UVSec at 320
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _ProjectionParams;
    float4 unity_SHBr;
    float4 unity_SHBg;
    float4 unity_SHBb;
    float4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float4 u_xlat2;
    float u_xlat10;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    output.mtl_Position = u_xlat0;
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD1.w = 0.0;
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    output.TEXCOORD1.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat1.w = 0.0;
    output.TEXCOORD2 = u_xlat1.wwwx;
    output.TEXCOORD3 = u_xlat1.wwwy;
    output.TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    u_xlat1.xyz = float3(u_xlat10) * u_xlat1.xyz;
    output.TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat10 = u_xlat1.y * u_xlat1.y;
    u_xlat10 = fma(u_xlat1.x, u_xlat1.x, (-u_xlat10));
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat1.x = dot(VGlobals.unity_SHBr, u_xlat2);
    u_xlat1.y = dot(VGlobals.unity_SHBg, u_xlat2);
    u_xlat1.z = dot(VGlobals.unity_SHBb, u_xlat2);
    output.TEXCOORD5.xyz = fma(VGlobals.unity_SHC.xyz, float3(u_xlat10), u_xlat1.xyz);
    output.TEXCOORD5.w = 0.0;
    u_xlat0.y = u_xlat0.y * VGlobals._ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * float3(0.5, 0.5, 0.5);
    output.TEXCOORD7.zw = u_xlat0.zw;
    output.TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (244 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _MainTex_ST at 208
  Vector4 _DetailAlbedoMap_ST at 224
  Float _UVSec at 240
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    bool u_xlatb0;
    float4 u_xlat1;
    float u_xlat6;
    float u_xlat7;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    u_xlatb0 = VGlobals._UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat0.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat0.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat1.xyz = u_xlat0.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = rsqrt(u_xlat7);
    output.TEXCOORD1.xyz = float3(u_xlat7) * u_xlat1.xyz;
    output.TEXCOORD1.w = 0.0;
    u_xlat0.w = 0.0;
    output.TEXCOORD2 = u_xlat0.wwwx;
    output.TEXCOORD3 = u_xlat0.wwwy;
    output.TEXCOORD4.w = u_xlat0.z;
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    output.TEXCOORD4.xyz = float3(u_xlat6) * u_xlat0.xyz;
    output.TEXCOORD5 = float4(0.0, 0.0, 0.0, 0.0);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (548 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 320
  Matrix4x4 unity_WorldToObject at 384
  Matrix4x4 unity_MatrixVP at 448
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 unity_4LightPosX0 at 16
  Vector4 unity_4LightPosY0 at 32
  Vector4 unity_4LightPosZ0 at 48
  Vector4 unity_4LightAtten0 at 64
  Vector4 unity_LightColor[8] at 80
  Vector4 unity_SHAr at 208
  Vector4 unity_SHAg at 224
  Vector4 unity_SHAb at 240
  Vector4 unity_SHBr at 256
  Vector4 unity_SHBg at 272
  Vector4 unity_SHBb at 288
  Vector4 unity_SHC at 304
  Vector4 _MainTex_ST at 512
  Vector4 _DetailAlbedoMap_ST at 528
  Float _UVSec at 544
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    float4 unity_4LightAtten0;
    float4 unity_LightColor[8];
    float4 unity_SHAr;
    float4 unity_SHAg;
    float4 unity_SHAb;
    float4 unity_SHBr;
    float4 unity_SHBg;
    float4 unity_SHBb;
    float4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    bool u_xlatb0;
    float4 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float4 u_xlat5;
    float u_xlat18;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    u_xlatb0 = VGlobals._UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat0.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD1.w = 0.0;
    u_xlat0.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat1.xyz = u_xlat0.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat19 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    output.TEXCOORD1.xyz = float3(u_xlat19) * u_xlat1.xyz;
    u_xlat0.w = 0.0;
    output.TEXCOORD2 = u_xlat0.wwwx;
    output.TEXCOORD3 = u_xlat0.wwwy;
    output.TEXCOORD4.w = u_xlat0.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat1.xyz;
    output.TEXCOORD4.xyz = u_xlat1.xyz;
    u_xlat18 = u_xlat1.y * u_xlat1.y;
    u_xlat18 = fma(u_xlat1.x, u_xlat1.x, (-u_xlat18));
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat3.x = dot(VGlobals.unity_SHBr, u_xlat2);
    u_xlat3.y = dot(VGlobals.unity_SHBg, u_xlat2);
    u_xlat3.z = dot(VGlobals.unity_SHBb, u_xlat2);
    u_xlat2.xyz = fma(VGlobals.unity_SHC.xyz, float3(u_xlat18), u_xlat3.xyz);
    u_xlat1.w = 1.0;
    u_xlat3.x = dot(VGlobals.unity_SHAr, u_xlat1);
    u_xlat3.y = dot(VGlobals.unity_SHAg, u_xlat1);
    u_xlat3.z = dot(VGlobals.unity_SHAb, u_xlat1);
    u_xlat2.xyz = u_xlat2.xyz + u_xlat3.xyz;
    u_xlat2.xyz = max(u_xlat2.xyz, float3(0.0, 0.0, 0.0));
    u_xlat3 = (-u_xlat0.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat5 = (-u_xlat0.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat0 = (-u_xlat0.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat4 = fma(u_xlat5, u_xlat1.xxxx, u_xlat4);
    u_xlat1 = fma(u_xlat0, u_xlat1.zzzz, u_xlat4);
    u_xlat3 = fma(u_xlat5, u_xlat5, u_xlat3);
    u_xlat0 = fma(u_xlat0, u_xlat0, u_xlat3);
    u_xlat0 = max(u_xlat0, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = rsqrt(u_xlat0);
    u_xlat0 = fma(u_xlat0, VGlobals.unity_4LightAtten0, float4(1.0, 1.0, 1.0, 1.0));
    u_xlat0 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat1 = max(u_xlat1, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat1;
    u_xlat1.xyz = u_xlat0.yyy * VGlobals.unity_LightColor[1].xyz;
    u_xlat1.xyz = fma(VGlobals.unity_LightColor[0].xyz, u_xlat0.xxx, u_xlat1.xyz);
    u_xlat0.xyz = fma(VGlobals.unity_LightColor[2].xyz, u_xlat0.zzz, u_xlat1.xyz);
    u_xlat0.xyz = fma(VGlobals.unity_LightColor[3].xyz, u_xlat0.www, u_xlat0.xyz);
    output.TEXCOORD5.xyz = u_xlat2.xyz + u_xlat0.xyz;
    output.TEXCOORD5.w = 0.0;
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL SHADOWS_SCREEN VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (260 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _ProjectionParams at 16
  Vector4 _MainTex_ST at 224
  Vector4 _DetailAlbedoMap_ST at 240
  Float _UVSec at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _ProjectionParams;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float u_xlat7;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    output.mtl_Position = u_xlat0;
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD1.w = 0.0;
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    output.TEXCOORD1.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat1.w = 0.0;
    output.TEXCOORD2 = u_xlat1.wwwx;
    output.TEXCOORD3 = u_xlat1.wwwy;
    output.TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = rsqrt(u_xlat7);
    output.TEXCOORD4.xyz = float3(u_xlat7) * u_xlat1.xyz;
    output.TEXCOORD5 = float4(0.0, 0.0, 0.0, 0.0);
    u_xlat0.y = u_xlat0.y * VGlobals._ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * float3(0.5, 0.5, 0.5);
    output.TEXCOORD7.zw = u_xlat0.zw;
    output.TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH SHADOWS_SCREEN VERTEXLIGHT_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (516 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 288
  Matrix4x4 unity_WorldToObject at 352
  Matrix4x4 unity_MatrixVP at 416
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _ProjectionParams at 16
  Vector4 unity_4LightPosX0 at 32
  Vector4 unity_4LightPosY0 at 48
  Vector4 unity_4LightPosZ0 at 64
  Vector4 unity_4LightAtten0 at 80
  Vector4 unity_LightColor[8] at 96
  Vector4 unity_SHBr at 224
  Vector4 unity_SHBg at 240
  Vector4 unity_SHBb at 256
  Vector4 unity_SHC at 272
  Vector4 _MainTex_ST at 480
  Vector4 _DetailAlbedoMap_ST at 496
  Float _UVSec at 512
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _ProjectionParams;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    float4 unity_4LightAtten0;
    float4 unity_LightColor[8];
    float4 unity_SHBr;
    float4 unity_SHBg;
    float4 unity_SHBb;
    float4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float4 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float4 u_xlat5;
    float u_xlat19;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    output.mtl_Position = u_xlat0;
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD1.w = 0.0;
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    output.TEXCOORD1.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat1.w = 0.0;
    output.TEXCOORD2 = u_xlat1.wwwx;
    output.TEXCOORD3 = u_xlat1.wwwy;
    output.TEXCOORD4.w = u_xlat1.z;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat19 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * u_xlat2.xyz;
    output.TEXCOORD4.xyz = u_xlat2.xyz;
    u_xlat3 = (-u_xlat1.xxxx) + VGlobals.unity_4LightPosX0;
    u_xlat4 = (-u_xlat1.yyyy) + VGlobals.unity_4LightPosY0;
    u_xlat1 = (-u_xlat1.zzzz) + VGlobals.unity_4LightPosZ0;
    u_xlat5 = u_xlat2.yyyy * u_xlat4;
    u_xlat4 = u_xlat4 * u_xlat4;
    u_xlat4 = fma(u_xlat3, u_xlat3, u_xlat4);
    u_xlat3 = fma(u_xlat3, u_xlat2.xxxx, u_xlat5);
    u_xlat3 = fma(u_xlat1, u_xlat2.zzzz, u_xlat3);
    u_xlat1 = fma(u_xlat1, u_xlat1, u_xlat4);
    u_xlat1 = max(u_xlat1, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat4 = rsqrt(u_xlat1);
    u_xlat1 = fma(u_xlat1, VGlobals.unity_4LightAtten0, float4(1.0, 1.0, 1.0, 1.0));
    u_xlat1 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat1;
    u_xlat3 = u_xlat3 * u_xlat4;
    u_xlat3 = max(u_xlat3, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat3.xyz = u_xlat1.yyy * VGlobals.unity_LightColor[1].xyz;
    u_xlat3.xyz = fma(VGlobals.unity_LightColor[0].xyz, u_xlat1.xxx, u_xlat3.xyz);
    u_xlat1.xyz = fma(VGlobals.unity_LightColor[2].xyz, u_xlat1.zzz, u_xlat3.xyz);
    u_xlat1.xyz = fma(VGlobals.unity_LightColor[3].xyz, u_xlat1.www, u_xlat1.xyz);
    u_xlat19 = u_xlat2.y * u_xlat2.y;
    u_xlat19 = fma(u_xlat2.x, u_xlat2.x, (-u_xlat19));
    u_xlat2 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat3.x = dot(VGlobals.unity_SHBr, u_xlat2);
    u_xlat3.y = dot(VGlobals.unity_SHBg, u_xlat2);
    u_xlat3.z = dot(VGlobals.unity_SHBb, u_xlat2);
    u_xlat2.xyz = fma(VGlobals.unity_SHC.xyz, float3(u_xlat19), u_xlat3.xyz);
    output.TEXCOORD5.xyz = u_xlat1.xyz + u_xlat2.xyz;
    output.TEXCOORD5.w = 0.0;
    u_xlat0.y = u_xlat0.y * VGlobals._ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * float3(0.5, 0.5, 0.5);
    output.TEXCOORD7.zw = u_xlat0.zw;
    output.TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH _EMISSION
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 3
Set 2D Texture "_OcclusionMap" to slot 1 sampler slot 4
Set 2D Texture "unity_NHxRoughness" to slot 2
Set 2D Texture "_EmissionMap" to slot 3 sampler slot 5
Set CUBE Texture "unity_SpecCube0" to slot 4 sampler slot 0
Set 3D Texture "unity_ProbeVolumeSH" to slot 5 sampler slot 1

Constant Buffer "FGlobals" (224 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_OcclusionMaskSelector at 16
  Vector4 unity_SpecCube0_HDR at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Vector4 _Color at 176
  Float _Metallic at 192
  Float _Glossiness at 196
  Vector4 _EmissionColor at 208
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 unity_SpecCube0_HDR;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float4 _EmissionColor;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_SpecCube0 [[ sampler (0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (1) ]],
    sampler samplerunity_NHxRoughness [[ sampler (2) ]],
    sampler sampler_MainTex [[ sampler (3) ]],
    sampler sampler_OcclusionMap [[ sampler (4) ]],
    sampler sampler_EmissionMap [[ sampler (5) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _OcclusionMap [[ texture(1) ]] ,
    texture2d<float, access::sample > unity_NHxRoughness [[ texture(2) ]] ,
    texture2d<float, access::sample > _EmissionMap [[ texture(3) ]] ,
    texturecube<float, access::sample > unity_SpecCube0 [[ texture(4) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(5) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float3 u_xlat5;
    float3 u_xlat6;
    float3 u_xlat7;
    float3 u_xlat10;
    float3 u_xlat12;
    float u_xlat24;
    float u_xlat25;
    bool u_xlatb25;
    float u_xlat26;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat24 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat24) * u_xlat1.xyz;
    u_xlat25 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat25 = rsqrt(u_xlat25);
    u_xlat2.xyz = float3(u_xlat25) * input.TEXCOORD4.xyz;
    u_xlatb25 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb25){
        u_xlatb25 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = input.TEXCOORD3.www * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.www, u_xlat3.xyz);
        u_xlat3.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD4.www, u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat12.x = input.TEXCOORD2.w;
        u_xlat12.y = input.TEXCOORD3.w;
        u_xlat12.z = input.TEXCOORD4.w;
        u_xlat3.xyz = (bool(u_xlatb25)) ? u_xlat3.xyz : u_xlat12.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat3.yzw = u_xlat3.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat25 = fma(u_xlat3.y, 0.25, 0.75);
        u_xlat26 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat3.x = max(u_xlat25, u_xlat26);
        u_xlat3 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    }
    u_xlat25 = dot(u_xlat3, FGlobals.unity_OcclusionMaskSelector);
    u_xlat25 = clamp(u_xlat25, 0.0f, 1.0f);
    u_xlat26 = _OcclusionMap.sample(sampler_OcclusionMap, input.TEXCOORD0.xy).y;
    u_xlat3.xw = (-float2(FGlobals._Glossiness)) + float2(1.0, 1.0);
    u_xlat4.x = dot(input.TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat4.x = u_xlat4.x + u_xlat4.x;
    u_xlat4.xyz = fma(u_xlat2.xyz, (-u_xlat4.xxx), input.TEXCOORD1.xyz);
    u_xlat5.xyz = float3(u_xlat25) * FGlobals._LightColor0.xyz;
    u_xlat6.xyz = float3(u_xlat26) * input.TEXCOORD5.xyz;
    u_xlat25 = fma((-u_xlat3.x), 0.699999988, 1.70000005);
    u_xlat25 = u_xlat25 * u_xlat3.x;
    u_xlat25 = u_xlat25 * 6.0;
    u_xlat4 = unity_SpecCube0.sample(samplerunity_SpecCube0, u_xlat4.xyz, level(u_xlat25));
    u_xlat25 = u_xlat4.w + -1.0;
    u_xlat25 = fma(FGlobals.unity_SpecCube0_HDR.w, u_xlat25, 1.0);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * FGlobals.unity_SpecCube0_HDR.y;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * FGlobals.unity_SpecCube0_HDR.x;
    u_xlat4.xyz = u_xlat4.xyz * float3(u_xlat25);
    u_xlat4.xyz = float3(u_xlat26) * u_xlat4.xyz;
    u_xlat25 = dot((-input.TEXCOORD1.xyz), u_xlat2.xyz);
    u_xlat26 = u_xlat25 + u_xlat25;
    u_xlat7.xyz = fma(u_xlat2.xyz, (-float3(u_xlat26)), (-input.TEXCOORD1.xyz));
    u_xlat2.x = dot(u_xlat2.xyz, FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat25 = u_xlat25;
    u_xlat25 = clamp(u_xlat25, 0.0f, 1.0f);
    u_xlat7.x = dot(u_xlat7.xyz, FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat7.y = (-u_xlat25) + 1.0;
    u_xlat10.xy = u_xlat7.xy * u_xlat7.xy;
    u_xlat3.yz = u_xlat10.xy * u_xlat10.xy;
    u_xlat24 = (-u_xlat24) + FGlobals._Glossiness;
    u_xlat24 = u_xlat24 + 1.0;
    u_xlat24 = clamp(u_xlat24, 0.0f, 1.0f);
    u_xlat25 = unity_NHxRoughness.sample(samplerunity_NHxRoughness, u_xlat3.yw).x;
    u_xlat25 = u_xlat25 * 16.0;
    u_xlat10.xyz = fma(float3(u_xlat25), u_xlat0.xyz, u_xlat1.xyz);
    u_xlat3.xyw = u_xlat2.xxx * u_xlat5.xyz;
    u_xlat5.xyz = (-u_xlat0.xyz) + float3(u_xlat24);
    u_xlat0.xyz = fma(u_xlat3.zzz, u_xlat5.xyz, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xyz;
    u_xlat0.xyz = fma(u_xlat6.xyz, u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.xyz = fma(u_xlat10.xyz, u_xlat3.xyw, u_xlat0.xyz);
    u_xlat1.xyz = _EmissionMap.sample(sampler_EmissionMap, input.TEXCOORD0.xy).xyz;
    output.SV_Target0.xyz = fma(u_xlat1.xyz, FGlobals._EmissionColor.xyz, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 3
Set 2D Texture "_OcclusionMap" to slot 1 sampler slot 4
Set 2D Texture "unity_NHxRoughness" to slot 2
Set CUBE Texture "unity_SpecCube0" to slot 3 sampler slot 0
Set 3D Texture "unity_ProbeVolumeSH" to slot 4 sampler slot 1

Constant Buffer "FGlobals" (200 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_OcclusionMaskSelector at 16
  Vector4 unity_SpecCube0_HDR at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Vector4 _Color at 176
  Float _Metallic at 192
  Float _Glossiness at 196
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 unity_SpecCube0_HDR;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_SpecCube0 [[ sampler (0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (1) ]],
    sampler samplerunity_NHxRoughness [[ sampler (2) ]],
    sampler sampler_MainTex [[ sampler (3) ]],
    sampler sampler_OcclusionMap [[ sampler (4) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _OcclusionMap [[ texture(1) ]] ,
    texture2d<float, access::sample > unity_NHxRoughness [[ texture(2) ]] ,
    texturecube<float, access::sample > unity_SpecCube0 [[ texture(3) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(4) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float3 u_xlat5;
    float3 u_xlat6;
    float3 u_xlat7;
    float3 u_xlat10;
    float3 u_xlat12;
    float u_xlat24;
    float u_xlat25;
    bool u_xlatb25;
    float u_xlat26;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat24 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat24) * u_xlat1.xyz;
    u_xlat25 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat25 = rsqrt(u_xlat25);
    u_xlat2.xyz = float3(u_xlat25) * input.TEXCOORD4.xyz;
    u_xlatb25 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb25){
        u_xlatb25 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = input.TEXCOORD3.www * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.www, u_xlat3.xyz);
        u_xlat3.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD4.www, u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat12.x = input.TEXCOORD2.w;
        u_xlat12.y = input.TEXCOORD3.w;
        u_xlat12.z = input.TEXCOORD4.w;
        u_xlat3.xyz = (bool(u_xlatb25)) ? u_xlat3.xyz : u_xlat12.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat3.yzw = u_xlat3.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat25 = fma(u_xlat3.y, 0.25, 0.75);
        u_xlat26 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat3.x = max(u_xlat25, u_xlat26);
        u_xlat3 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    }
    u_xlat25 = dot(u_xlat3, FGlobals.unity_OcclusionMaskSelector);
    u_xlat25 = clamp(u_xlat25, 0.0f, 1.0f);
    u_xlat26 = _OcclusionMap.sample(sampler_OcclusionMap, input.TEXCOORD0.xy).y;
    u_xlat3.xw = (-float2(FGlobals._Glossiness)) + float2(1.0, 1.0);
    u_xlat4.x = dot(input.TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat4.x = u_xlat4.x + u_xlat4.x;
    u_xlat4.xyz = fma(u_xlat2.xyz, (-u_xlat4.xxx), input.TEXCOORD1.xyz);
    u_xlat5.xyz = float3(u_xlat25) * FGlobals._LightColor0.xyz;
    u_xlat6.xyz = float3(u_xlat26) * input.TEXCOORD5.xyz;
    u_xlat25 = fma((-u_xlat3.x), 0.699999988, 1.70000005);
    u_xlat25 = u_xlat25 * u_xlat3.x;
    u_xlat25 = u_xlat25 * 6.0;
    u_xlat4 = unity_SpecCube0.sample(samplerunity_SpecCube0, u_xlat4.xyz, level(u_xlat25));
    u_xlat25 = u_xlat4.w + -1.0;
    u_xlat25 = fma(FGlobals.unity_SpecCube0_HDR.w, u_xlat25, 1.0);
    u_xlat25 = log2(u_xlat25);
    u_xlat25 = u_xlat25 * FGlobals.unity_SpecCube0_HDR.y;
    u_xlat25 = exp2(u_xlat25);
    u_xlat25 = u_xlat25 * FGlobals.unity_SpecCube0_HDR.x;
    u_xlat4.xyz = u_xlat4.xyz * float3(u_xlat25);
    u_xlat4.xyz = float3(u_xlat26) * u_xlat4.xyz;
    u_xlat25 = dot((-input.TEXCOORD1.xyz), u_xlat2.xyz);
    u_xlat26 = u_xlat25 + u_xlat25;
    u_xlat7.xyz = fma(u_xlat2.xyz, (-float3(u_xlat26)), (-input.TEXCOORD1.xyz));
    u_xlat2.x = dot(u_xlat2.xyz, FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat25 = u_xlat25;
    u_xlat25 = clamp(u_xlat25, 0.0f, 1.0f);
    u_xlat7.x = dot(u_xlat7.xyz, FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat7.y = (-u_xlat25) + 1.0;
    u_xlat10.xy = u_xlat7.xy * u_xlat7.xy;
    u_xlat3.yz = u_xlat10.xy * u_xlat10.xy;
    u_xlat24 = (-u_xlat24) + FGlobals._Glossiness;
    u_xlat24 = u_xlat24 + 1.0;
    u_xlat24 = clamp(u_xlat24, 0.0f, 1.0f);
    u_xlat25 = unity_NHxRoughness.sample(samplerunity_NHxRoughness, u_xlat3.yw).x;
    u_xlat25 = u_xlat25 * 16.0;
    u_xlat10.xyz = fma(float3(u_xlat25), u_xlat0.xyz, u_xlat1.xyz);
    u_xlat3.xyw = u_xlat2.xxx * u_xlat5.xyz;
    u_xlat5.xyz = (-u_xlat0.xyz) + float3(u_xlat24);
    u_xlat0.xyz = fma(u_xlat3.zzz, u_xlat5.xyz, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xyz;
    u_xlat0.xyz = fma(u_xlat6.xyz, u_xlat1.xyz, u_xlat0.xyz);
    output.SV_Target0.xyz = fma(u_xlat10.xyz, u_xlat3.xyw, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL SHADOWS_SCREEN _EMISSION
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 1 sampler slot 5
Set 2D Texture "_OcclusionMap" to slot 2 sampler slot 3
Set 2D Texture "_EmissionMap" to slot 3 sampler slot 4
Set CUBE Texture "unity_SpecCube0" to slot 4 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 5 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 6 sampler slot 1

Constant Buffer "FGlobals" (448 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 80
  Matrix4x4 unity_ProbeVolumeWorldToObject at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_SpecCube0_BoxMax at 144
  Vector4 unity_SpecCube0_BoxMin at 160
  Vector4 unity_SpecCube0_ProbePosition at 176
  Vector4 unity_SpecCube0_HDR at 192
  Vector4 unity_SpecCube1_BoxMax at 208
  Vector4 unity_SpecCube1_BoxMin at 224
  Vector4 unity_SpecCube1_ProbePosition at 240
  Vector4 unity_SpecCube1_HDR at 256
  Vector4 unity_ProbeVolumeParams at 272
  Vector3 unity_ProbeVolumeSizeInv at 352
  Vector3 unity_ProbeVolumeMin at 368
  Vector4 _LightColor0 at 384
  Vector4 _Color at 400
  Float _Metallic at 416
  Float _Glossiness at 420
  Float _OcclusionStrength at 424
  Vector4 _EmissionColor at 432
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_SpecCube0_BoxMax;
    float4 unity_SpecCube0_BoxMin;
    float4 unity_SpecCube0_ProbePosition;
    float4 unity_SpecCube0_HDR;
    float4 unity_SpecCube1_BoxMax;
    float4 unity_SpecCube1_BoxMin;
    float4 unity_SpecCube1_ProbePosition;
    float4 unity_SpecCube1_HDR;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float _OcclusionStrength;
    float4 _EmissionColor;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_SpecCube0 [[ sampler (0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    sampler sampler_OcclusionMap [[ sampler (3) ]],
    sampler sampler_EmissionMap [[ sampler (4) ]],
    sampler sampler_ShadowMapTexture [[ sampler (5) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _ShadowMapTexture [[ texture(1) ]] ,
    texture2d<float, access::sample > _OcclusionMap [[ texture(2) ]] ,
    texture2d<float, access::sample > _EmissionMap [[ texture(3) ]] ,
    texturecube<float, access::sample > unity_SpecCube0 [[ texture(4) ]] ,
    texturecube<float, access::sample > unity_SpecCube1 [[ texture(5) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(6) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float4 u_xlat3;
    float3 u_xlat4;
    float4 u_xlat5;
    float3 u_xlat6;
    float4 u_xlat7;
    float3 u_xlat8;
    float4 u_xlat9;
    float3 u_xlat10;
    bool3 u_xlatb10;
    float3 u_xlat11;
    bool3 u_xlatb12;
    float3 u_xlat15;
    float u_xlat16;
    float u_xlat28;
    float u_xlat29;
    float u_xlat39;
    float u_xlat40;
    float u_xlat41;
    bool u_xlatb41;
    float u_xlat42;
    bool u_xlatb42;
    float u_xlat43;
    float u_xlat44;
    float u_xlat45;
    bool u_xlatb45;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat39 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat39) * u_xlat1.xyz;
    u_xlat40 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat40 = rsqrt(u_xlat40);
    u_xlat2.xyz = float3(u_xlat40) * input.TEXCOORD4.xyz;
    u_xlat40 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat40 = rsqrt(u_xlat40);
    u_xlat3.xyz = float3(u_xlat40) * input.TEXCOORD1.xyz;
    u_xlat4.x = input.TEXCOORD2.w;
    u_xlat4.y = input.TEXCOORD3.w;
    u_xlat4.z = input.TEXCOORD4.w;
    u_xlat5.xyz = (-u_xlat4.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat6.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat41 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat4.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat42 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat42 = sqrt(u_xlat42);
    u_xlat42 = (-u_xlat41) + u_xlat42;
    u_xlat41 = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat42, u_xlat41);
    u_xlat41 = fma(u_xlat41, FGlobals._LightShadowData.z, FGlobals._LightShadowData.w);
    u_xlat41 = clamp(u_xlat41, 0.0f, 1.0f);
    u_xlatb42 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb42){
        u_xlatb42 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = input.TEXCOORD3.www * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.www, u_xlat5.xyz);
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD4.www, u_xlat5.xyz);
        u_xlat5.xyz = u_xlat5.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb42)) ? u_xlat5.xyz : u_xlat4.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat5.yzw = u_xlat5.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat42 = fma(u_xlat5.y, 0.25, 0.75);
        u_xlat43 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat5.x = max(u_xlat42, u_xlat43);
        u_xlat5 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat42 = dot(u_xlat5, FGlobals.unity_OcclusionMaskSelector);
    u_xlat42 = clamp(u_xlat42, 0.0f, 1.0f);
    u_xlat5.xy = input.TEXCOORD7.xy / input.TEXCOORD7.ww;
    u_xlat43 = _ShadowMapTexture.sample(sampler_ShadowMapTexture, u_xlat5.xy).x;
    u_xlat42 = u_xlat42 + (-u_xlat43);
    u_xlat41 = fma(u_xlat41, u_xlat42, u_xlat43);
    u_xlat42 = _OcclusionMap.sample(sampler_OcclusionMap, input.TEXCOORD0.xy).y;
    u_xlat43 = (-FGlobals._OcclusionStrength) + 1.0;
    u_xlat42 = fma(u_xlat42, FGlobals._OcclusionStrength, u_xlat43);
    u_xlat43 = (-FGlobals._Glossiness) + 1.0;
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat5.x = u_xlat5.x + u_xlat5.x;
    u_xlat5.xyz = fma(u_xlat2.xyz, (-u_xlat5.xxx), u_xlat3.xyz);
    u_xlat6.xyz = float3(u_xlat41) * FGlobals._LightColor0.xyz;
    u_xlatb41 = 0.0<FGlobals.unity_SpecCube0_ProbePosition.w;
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat41 = rsqrt(u_xlat41);
        u_xlat7.xyz = float3(u_xlat41) * u_xlat5.xyz;
        u_xlat8.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
        u_xlat9.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
        u_xlatb10.xyz = (float3(0.0, 0.0, 0.0)<u_xlat7.xyz);
        {
            float3 hlslcc_movcTemp = u_xlat8;
            hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat8 = hlslcc_movcTemp;
        }
        u_xlat41 = min(u_xlat8.y, u_xlat8.x);
        u_xlat41 = min(u_xlat8.z, u_xlat41);
        u_xlat8.xyz = u_xlat4.xyz + (-FGlobals.unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = fma(u_xlat7.xyz, float3(u_xlat41), u_xlat8.xyz);
    } else {
        u_xlat7.xyz = u_xlat5.xyz;
    }
    u_xlat41 = fma((-u_xlat43), 0.699999988, 1.70000005);
    u_xlat41 = u_xlat41 * u_xlat43;
    u_xlat41 = u_xlat41 * 6.0;
    u_xlat7 = unity_SpecCube0.sample(samplerunity_SpecCube0, u_xlat7.xyz, level(u_xlat41));
    u_xlat44 = u_xlat7.w + -1.0;
    u_xlat44 = fma(FGlobals.unity_SpecCube0_HDR.w, u_xlat44, 1.0);
    u_xlat44 = log2(u_xlat44);
    u_xlat44 = u_xlat44 * FGlobals.unity_SpecCube0_HDR.y;
    u_xlat44 = exp2(u_xlat44);
    u_xlat44 = u_xlat44 * FGlobals.unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat7.xyz * float3(u_xlat44);
    u_xlatb45 = FGlobals.unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb45){
        u_xlatb45 = 0.0<FGlobals.unity_SpecCube1_ProbePosition.w;
        if(u_xlatb45){
            u_xlat45 = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat45 = rsqrt(u_xlat45);
            u_xlat9.xyz = u_xlat5.xyz * float3(u_xlat45);
            u_xlat10.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
            u_xlat11.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
            u_xlatb12.xyz = (float3(0.0, 0.0, 0.0)<u_xlat9.xyz);
            {
                float3 hlslcc_movcTemp = u_xlat10;
                hlslcc_movcTemp.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
                hlslcc_movcTemp.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
                hlslcc_movcTemp.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
                u_xlat10 = hlslcc_movcTemp;
            }
            u_xlat45 = min(u_xlat10.y, u_xlat10.x);
            u_xlat45 = min(u_xlat10.z, u_xlat45);
            u_xlat4.xyz = u_xlat4.xyz + (-FGlobals.unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = fma(u_xlat9.xyz, float3(u_xlat45), u_xlat4.xyz);
        }
        u_xlat9 = unity_SpecCube1.sample(samplerunity_SpecCube0, u_xlat5.xyz, level(u_xlat41));
        u_xlat41 = u_xlat9.w + -1.0;
        u_xlat41 = fma(FGlobals.unity_SpecCube1_HDR.w, u_xlat41, 1.0);
        u_xlat41 = log2(u_xlat41);
        u_xlat41 = u_xlat41 * FGlobals.unity_SpecCube1_HDR.y;
        u_xlat41 = exp2(u_xlat41);
        u_xlat41 = u_xlat41 * FGlobals.unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat9.xyz * float3(u_xlat41);
        u_xlat5.xyz = fma(float3(u_xlat44), u_xlat7.xyz, (-u_xlat4.xyz));
        u_xlat8.xyz = fma(FGlobals.unity_SpecCube0_BoxMin.www, u_xlat5.xyz, u_xlat4.xyz);
    }
    u_xlat4.xyz = float3(u_xlat42) * u_xlat8.xyz;
    u_xlat5.xyz = fma((-input.TEXCOORD1.xyz), float3(u_xlat40), FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat40 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat40 = max(u_xlat40, 0.00100000005);
    u_xlat40 = rsqrt(u_xlat40);
    u_xlat5.xyz = float3(u_xlat40) * u_xlat5.xyz;
    u_xlat40 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat41 = dot(u_xlat2.xyz, FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat41 = clamp(u_xlat41, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat15.x = dot(FGlobals._WorldSpaceLightPos0.xyz, u_xlat5.xyz);
    u_xlat15.x = clamp(u_xlat15.x, 0.0f, 1.0f);
    u_xlat28 = u_xlat15.x * u_xlat15.x;
    u_xlat28 = dot(float2(u_xlat28), float2(u_xlat43));
    u_xlat28 = u_xlat28 + -0.5;
    u_xlat3.x = (-u_xlat41) + 1.0;
    u_xlat16 = u_xlat3.x * u_xlat3.x;
    u_xlat16 = u_xlat16 * u_xlat16;
    u_xlat3.x = u_xlat3.x * u_xlat16;
    u_xlat3.x = fma(u_xlat28, u_xlat3.x, 1.0);
    u_xlat16 = -abs(u_xlat40) + 1.0;
    u_xlat29 = u_xlat16 * u_xlat16;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat16 = u_xlat16 * u_xlat29;
    u_xlat28 = fma(u_xlat28, u_xlat16, 1.0);
    u_xlat28 = u_xlat28 * u_xlat3.x;
    u_xlat28 = u_xlat41 * u_xlat28;
    u_xlat3.x = u_xlat43 * u_xlat43;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat29 = (-u_xlat3.x) + 1.0;
    u_xlat42 = fma(abs(u_xlat40), u_xlat29, u_xlat3.x);
    u_xlat29 = fma(u_xlat41, u_xlat29, u_xlat3.x);
    u_xlat40 = abs(u_xlat40) * u_xlat29;
    u_xlat40 = fma(u_xlat41, u_xlat42, u_xlat40);
    u_xlat40 = u_xlat40 + 9.99999975e-06;
    u_xlat40 = 0.5 / u_xlat40;
    u_xlat29 = u_xlat3.x * u_xlat3.x;
    u_xlat42 = fma(u_xlat2.x, u_xlat29, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat42, u_xlat2.x, 1.0);
    u_xlat29 = u_xlat29 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat2.x = u_xlat29 / u_xlat2.x;
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat40 = u_xlat41 * u_xlat40;
    u_xlat40 = u_xlat40 * 3.14159274;
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat2.x = fma(u_xlat3.x, u_xlat3.x, 1.0);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat41 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb41 = u_xlat41!=0.0;
    u_xlat41 = u_xlatb41 ? 1.0 : float(0.0);
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat39 = (-u_xlat39) + FGlobals._Glossiness;
    u_xlat39 = u_xlat39 + 1.0;
    u_xlat39 = clamp(u_xlat39, 0.0f, 1.0f);
    u_xlat3.xzw = float3(u_xlat28) * u_xlat6.xyz;
    u_xlat5.xyz = u_xlat6.xyz * float3(u_xlat40);
    u_xlat40 = (-u_xlat15.x) + 1.0;
    u_xlat15.x = u_xlat40 * u_xlat40;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat15.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat15.xyz = fma(u_xlat15.xyz, float3(u_xlat40), u_xlat0.xyz);
    u_xlat15.xyz = u_xlat15.xyz * u_xlat5.xyz;
    u_xlat1.xyz = fma(u_xlat1.xyz, u_xlat3.xzw, u_xlat15.xyz);
    u_xlat2.xyz = u_xlat4.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + float3(u_xlat39);
    u_xlat0.xyz = fma(float3(u_xlat16), u_xlat3.xzw, u_xlat0.xyz);
    u_xlat0.xyz = fma(u_xlat2.xyz, u_xlat0.xyz, u_xlat1.xyz);
    u_xlat1.xyz = _EmissionMap.sample(sampler_EmissionMap, input.TEXCOORD0.xy).xyz;
    output.SV_Target0.xyz = fma(u_xlat1.xyz, FGlobals._EmissionColor.xyz, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL SHADOWS_SCREEN
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 1 sampler slot 4
Set 2D Texture "_OcclusionMap" to slot 2 sampler slot 3
Set CUBE Texture "unity_SpecCube0" to slot 3 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 4 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 5 sampler slot 1

Constant Buffer "FGlobals" (428 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 80
  Matrix4x4 unity_ProbeVolumeWorldToObject at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_SpecCube0_BoxMax at 144
  Vector4 unity_SpecCube0_BoxMin at 160
  Vector4 unity_SpecCube0_ProbePosition at 176
  Vector4 unity_SpecCube0_HDR at 192
  Vector4 unity_SpecCube1_BoxMax at 208
  Vector4 unity_SpecCube1_BoxMin at 224
  Vector4 unity_SpecCube1_ProbePosition at 240
  Vector4 unity_SpecCube1_HDR at 256
  Vector4 unity_ProbeVolumeParams at 272
  Vector3 unity_ProbeVolumeSizeInv at 352
  Vector3 unity_ProbeVolumeMin at 368
  Vector4 _LightColor0 at 384
  Vector4 _Color at 400
  Float _Metallic at 416
  Float _Glossiness at 420
  Float _OcclusionStrength at 424
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_SpecCube0_BoxMax;
    float4 unity_SpecCube0_BoxMin;
    float4 unity_SpecCube0_ProbePosition;
    float4 unity_SpecCube0_HDR;
    float4 unity_SpecCube1_BoxMax;
    float4 unity_SpecCube1_BoxMin;
    float4 unity_SpecCube1_ProbePosition;
    float4 unity_SpecCube1_HDR;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float _OcclusionStrength;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_SpecCube0 [[ sampler (0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    sampler sampler_OcclusionMap [[ sampler (3) ]],
    sampler sampler_ShadowMapTexture [[ sampler (4) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _ShadowMapTexture [[ texture(1) ]] ,
    texture2d<float, access::sample > _OcclusionMap [[ texture(2) ]] ,
    texturecube<float, access::sample > unity_SpecCube0 [[ texture(3) ]] ,
    texturecube<float, access::sample > unity_SpecCube1 [[ texture(4) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(5) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float4 u_xlat3;
    float3 u_xlat4;
    float4 u_xlat5;
    float3 u_xlat6;
    float4 u_xlat7;
    float3 u_xlat8;
    float4 u_xlat9;
    float3 u_xlat10;
    bool3 u_xlatb10;
    float3 u_xlat11;
    bool3 u_xlatb12;
    float3 u_xlat15;
    float u_xlat16;
    float u_xlat28;
    float u_xlat29;
    float u_xlat39;
    float u_xlat40;
    float u_xlat41;
    bool u_xlatb41;
    float u_xlat42;
    bool u_xlatb42;
    float u_xlat43;
    float u_xlat44;
    float u_xlat45;
    bool u_xlatb45;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat39 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat39) * u_xlat1.xyz;
    u_xlat40 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat40 = rsqrt(u_xlat40);
    u_xlat2.xyz = float3(u_xlat40) * input.TEXCOORD4.xyz;
    u_xlat40 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat40 = rsqrt(u_xlat40);
    u_xlat3.xyz = float3(u_xlat40) * input.TEXCOORD1.xyz;
    u_xlat4.x = input.TEXCOORD2.w;
    u_xlat4.y = input.TEXCOORD3.w;
    u_xlat4.z = input.TEXCOORD4.w;
    u_xlat5.xyz = (-u_xlat4.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat6.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat41 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat4.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat42 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat42 = sqrt(u_xlat42);
    u_xlat42 = (-u_xlat41) + u_xlat42;
    u_xlat41 = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat42, u_xlat41);
    u_xlat41 = fma(u_xlat41, FGlobals._LightShadowData.z, FGlobals._LightShadowData.w);
    u_xlat41 = clamp(u_xlat41, 0.0f, 1.0f);
    u_xlatb42 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb42){
        u_xlatb42 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = input.TEXCOORD3.www * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.www, u_xlat5.xyz);
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD4.www, u_xlat5.xyz);
        u_xlat5.xyz = u_xlat5.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb42)) ? u_xlat5.xyz : u_xlat4.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat5.yzw = u_xlat5.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat42 = fma(u_xlat5.y, 0.25, 0.75);
        u_xlat43 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat5.x = max(u_xlat42, u_xlat43);
        u_xlat5 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat42 = dot(u_xlat5, FGlobals.unity_OcclusionMaskSelector);
    u_xlat42 = clamp(u_xlat42, 0.0f, 1.0f);
    u_xlat5.xy = input.TEXCOORD7.xy / input.TEXCOORD7.ww;
    u_xlat43 = _ShadowMapTexture.sample(sampler_ShadowMapTexture, u_xlat5.xy).x;
    u_xlat42 = u_xlat42 + (-u_xlat43);
    u_xlat41 = fma(u_xlat41, u_xlat42, u_xlat43);
    u_xlat42 = _OcclusionMap.sample(sampler_OcclusionMap, input.TEXCOORD0.xy).y;
    u_xlat43 = (-FGlobals._OcclusionStrength) + 1.0;
    u_xlat42 = fma(u_xlat42, FGlobals._OcclusionStrength, u_xlat43);
    u_xlat43 = (-FGlobals._Glossiness) + 1.0;
    u_xlat5.x = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat5.x = u_xlat5.x + u_xlat5.x;
    u_xlat5.xyz = fma(u_xlat2.xyz, (-u_xlat5.xxx), u_xlat3.xyz);
    u_xlat6.xyz = float3(u_xlat41) * FGlobals._LightColor0.xyz;
    u_xlatb41 = 0.0<FGlobals.unity_SpecCube0_ProbePosition.w;
    if(u_xlatb41){
        u_xlat41 = dot(u_xlat5.xyz, u_xlat5.xyz);
        u_xlat41 = rsqrt(u_xlat41);
        u_xlat7.xyz = float3(u_xlat41) * u_xlat5.xyz;
        u_xlat8.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
        u_xlat9.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
        u_xlatb10.xyz = (float3(0.0, 0.0, 0.0)<u_xlat7.xyz);
        {
            float3 hlslcc_movcTemp = u_xlat8;
            hlslcc_movcTemp.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
            hlslcc_movcTemp.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
            hlslcc_movcTemp.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
            u_xlat8 = hlslcc_movcTemp;
        }
        u_xlat41 = min(u_xlat8.y, u_xlat8.x);
        u_xlat41 = min(u_xlat8.z, u_xlat41);
        u_xlat8.xyz = u_xlat4.xyz + (-FGlobals.unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = fma(u_xlat7.xyz, float3(u_xlat41), u_xlat8.xyz);
    } else {
        u_xlat7.xyz = u_xlat5.xyz;
    }
    u_xlat41 = fma((-u_xlat43), 0.699999988, 1.70000005);
    u_xlat41 = u_xlat41 * u_xlat43;
    u_xlat41 = u_xlat41 * 6.0;
    u_xlat7 = unity_SpecCube0.sample(samplerunity_SpecCube0, u_xlat7.xyz, level(u_xlat41));
    u_xlat44 = u_xlat7.w + -1.0;
    u_xlat44 = fma(FGlobals.unity_SpecCube0_HDR.w, u_xlat44, 1.0);
    u_xlat44 = log2(u_xlat44);
    u_xlat44 = u_xlat44 * FGlobals.unity_SpecCube0_HDR.y;
    u_xlat44 = exp2(u_xlat44);
    u_xlat44 = u_xlat44 * FGlobals.unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat7.xyz * float3(u_xlat44);
    u_xlatb45 = FGlobals.unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb45){
        u_xlatb45 = 0.0<FGlobals.unity_SpecCube1_ProbePosition.w;
        if(u_xlatb45){
            u_xlat45 = dot(u_xlat5.xyz, u_xlat5.xyz);
            u_xlat45 = rsqrt(u_xlat45);
            u_xlat9.xyz = u_xlat5.xyz * float3(u_xlat45);
            u_xlat10.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
            u_xlat11.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
            u_xlatb12.xyz = (float3(0.0, 0.0, 0.0)<u_xlat9.xyz);
            {
                float3 hlslcc_movcTemp = u_xlat10;
                hlslcc_movcTemp.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
                hlslcc_movcTemp.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
                hlslcc_movcTemp.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
                u_xlat10 = hlslcc_movcTemp;
            }
            u_xlat45 = min(u_xlat10.y, u_xlat10.x);
            u_xlat45 = min(u_xlat10.z, u_xlat45);
            u_xlat4.xyz = u_xlat4.xyz + (-FGlobals.unity_SpecCube1_ProbePosition.xyz);
            u_xlat5.xyz = fma(u_xlat9.xyz, float3(u_xlat45), u_xlat4.xyz);
        }
        u_xlat9 = unity_SpecCube1.sample(samplerunity_SpecCube0, u_xlat5.xyz, level(u_xlat41));
        u_xlat41 = u_xlat9.w + -1.0;
        u_xlat41 = fma(FGlobals.unity_SpecCube1_HDR.w, u_xlat41, 1.0);
        u_xlat41 = log2(u_xlat41);
        u_xlat41 = u_xlat41 * FGlobals.unity_SpecCube1_HDR.y;
        u_xlat41 = exp2(u_xlat41);
        u_xlat41 = u_xlat41 * FGlobals.unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat9.xyz * float3(u_xlat41);
        u_xlat5.xyz = fma(float3(u_xlat44), u_xlat7.xyz, (-u_xlat4.xyz));
        u_xlat8.xyz = fma(FGlobals.unity_SpecCube0_BoxMin.www, u_xlat5.xyz, u_xlat4.xyz);
    }
    u_xlat4.xyz = float3(u_xlat42) * u_xlat8.xyz;
    u_xlat5.xyz = fma((-input.TEXCOORD1.xyz), float3(u_xlat40), FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat40 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat40 = max(u_xlat40, 0.00100000005);
    u_xlat40 = rsqrt(u_xlat40);
    u_xlat5.xyz = float3(u_xlat40) * u_xlat5.xyz;
    u_xlat40 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat41 = dot(u_xlat2.xyz, FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat41 = clamp(u_xlat41, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat15.x = dot(FGlobals._WorldSpaceLightPos0.xyz, u_xlat5.xyz);
    u_xlat15.x = clamp(u_xlat15.x, 0.0f, 1.0f);
    u_xlat28 = u_xlat15.x * u_xlat15.x;
    u_xlat28 = dot(float2(u_xlat28), float2(u_xlat43));
    u_xlat28 = u_xlat28 + -0.5;
    u_xlat3.x = (-u_xlat41) + 1.0;
    u_xlat16 = u_xlat3.x * u_xlat3.x;
    u_xlat16 = u_xlat16 * u_xlat16;
    u_xlat3.x = u_xlat3.x * u_xlat16;
    u_xlat3.x = fma(u_xlat28, u_xlat3.x, 1.0);
    u_xlat16 = -abs(u_xlat40) + 1.0;
    u_xlat29 = u_xlat16 * u_xlat16;
    u_xlat29 = u_xlat29 * u_xlat29;
    u_xlat16 = u_xlat16 * u_xlat29;
    u_xlat28 = fma(u_xlat28, u_xlat16, 1.0);
    u_xlat28 = u_xlat28 * u_xlat3.x;
    u_xlat28 = u_xlat41 * u_xlat28;
    u_xlat3.x = u_xlat43 * u_xlat43;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat29 = (-u_xlat3.x) + 1.0;
    u_xlat42 = fma(abs(u_xlat40), u_xlat29, u_xlat3.x);
    u_xlat29 = fma(u_xlat41, u_xlat29, u_xlat3.x);
    u_xlat40 = abs(u_xlat40) * u_xlat29;
    u_xlat40 = fma(u_xlat41, u_xlat42, u_xlat40);
    u_xlat40 = u_xlat40 + 9.99999975e-06;
    u_xlat40 = 0.5 / u_xlat40;
    u_xlat29 = u_xlat3.x * u_xlat3.x;
    u_xlat42 = fma(u_xlat2.x, u_xlat29, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat42, u_xlat2.x, 1.0);
    u_xlat29 = u_xlat29 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat2.x = u_xlat29 / u_xlat2.x;
    u_xlat40 = u_xlat40 * u_xlat2.x;
    u_xlat40 = u_xlat41 * u_xlat40;
    u_xlat40 = u_xlat40 * 3.14159274;
    u_xlat40 = max(u_xlat40, 0.0);
    u_xlat2.x = fma(u_xlat3.x, u_xlat3.x, 1.0);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat41 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb41 = u_xlat41!=0.0;
    u_xlat41 = u_xlatb41 ? 1.0 : float(0.0);
    u_xlat40 = u_xlat40 * u_xlat41;
    u_xlat39 = (-u_xlat39) + FGlobals._Glossiness;
    u_xlat39 = u_xlat39 + 1.0;
    u_xlat39 = clamp(u_xlat39, 0.0f, 1.0f);
    u_xlat3.xzw = float3(u_xlat28) * u_xlat6.xyz;
    u_xlat5.xyz = u_xlat6.xyz * float3(u_xlat40);
    u_xlat40 = (-u_xlat15.x) + 1.0;
    u_xlat15.x = u_xlat40 * u_xlat40;
    u_xlat15.x = u_xlat15.x * u_xlat15.x;
    u_xlat40 = u_xlat40 * u_xlat15.x;
    u_xlat15.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat15.xyz = fma(u_xlat15.xyz, float3(u_xlat40), u_xlat0.xyz);
    u_xlat15.xyz = u_xlat15.xyz * u_xlat5.xyz;
    u_xlat1.xyz = fma(u_xlat1.xyz, u_xlat3.xzw, u_xlat15.xyz);
    u_xlat2.xyz = u_xlat4.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + float3(u_xlat39);
    u_xlat0.xyz = fma(float3(u_xlat16), u_xlat3.xzw, u_xlat0.xyz);
    output.SV_Target0.xyz = fma(u_xlat2.xyz, u_xlat0.xyz, u_xlat1.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH SHADOWS_SCREEN _EMISSION
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 1 sampler slot 5
Set 2D Texture "_OcclusionMap" to slot 2 sampler slot 3
Set 2D Texture "_EmissionMap" to slot 3 sampler slot 4
Set CUBE Texture "unity_SpecCube0" to slot 4 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 5 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 6 sampler slot 1

Constant Buffer "FGlobals" (496 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 128
  Matrix4x4 unity_ProbeVolumeWorldToObject at 336
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_OcclusionMaskSelector at 80
  Vector4 _LightShadowData at 96
  Vector4 unity_ShadowFadeCenterAndType at 112
  Vector4 unity_SpecCube0_BoxMax at 192
  Vector4 unity_SpecCube0_BoxMin at 208
  Vector4 unity_SpecCube0_ProbePosition at 224
  Vector4 unity_SpecCube0_HDR at 240
  Vector4 unity_SpecCube1_BoxMax at 256
  Vector4 unity_SpecCube1_BoxMin at 272
  Vector4 unity_SpecCube1_ProbePosition at 288
  Vector4 unity_SpecCube1_HDR at 304
  Vector4 unity_ProbeVolumeParams at 320
  Vector3 unity_ProbeVolumeSizeInv at 400
  Vector3 unity_ProbeVolumeMin at 416
  Vector4 _LightColor0 at 432
  Vector4 _Color at 448
  Float _Metallic at 464
  Float _Glossiness at 468
  Float _OcclusionStrength at 472
  Vector4 _EmissionColor at 480
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_SHAr;
    float4 unity_SHAg;
    float4 unity_SHAb;
    float4 unity_OcclusionMaskSelector;
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_SpecCube0_BoxMax;
    float4 unity_SpecCube0_BoxMin;
    float4 unity_SpecCube0_ProbePosition;
    float4 unity_SpecCube0_HDR;
    float4 unity_SpecCube1_BoxMax;
    float4 unity_SpecCube1_BoxMin;
    float4 unity_SpecCube1_ProbePosition;
    float4 unity_SpecCube1_HDR;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float _OcclusionStrength;
    float4 _EmissionColor;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_SpecCube0 [[ sampler (0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    sampler sampler_OcclusionMap [[ sampler (3) ]],
    sampler sampler_EmissionMap [[ sampler (4) ]],
    sampler sampler_ShadowMapTexture [[ sampler (5) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _ShadowMapTexture [[ texture(1) ]] ,
    texture2d<float, access::sample > _OcclusionMap [[ texture(2) ]] ,
    texture2d<float, access::sample > _EmissionMap [[ texture(3) ]] ,
    texturecube<float, access::sample > unity_SpecCube0 [[ texture(4) ]] ,
    texturecube<float, access::sample > unity_SpecCube1 [[ texture(5) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(6) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float4 u_xlat5;
    bool u_xlatb5;
    float3 u_xlat6;
    float3 u_xlat7;
    float4 u_xlat8;
    float4 u_xlat9;
    float4 u_xlat10;
    float3 u_xlat11;
    float3 u_xlat12;
    bool3 u_xlatb12;
    float3 u_xlat13;
    bool3 u_xlatb14;
    float3 u_xlat17;
    float u_xlat18;
    float3 u_xlat20;
    float u_xlat32;
    float u_xlat33;
    float u_xlat35;
    float u_xlat45;
    float u_xlat46;
    float u_xlat47;
    bool u_xlatb47;
    float u_xlat48;
    bool u_xlatb48;
    float u_xlat49;
    bool u_xlatb49;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat45 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat45) * u_xlat1.xyz;
    u_xlat46 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat46 = rsqrt(u_xlat46);
    u_xlat2.xyz = float3(u_xlat46) * input.TEXCOORD4.xyz;
    u_xlat46 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat46 = rsqrt(u_xlat46);
    u_xlat3.xyz = float3(u_xlat46) * input.TEXCOORD1.xyz;
    u_xlat4.x = input.TEXCOORD2.w;
    u_xlat4.y = input.TEXCOORD3.w;
    u_xlat4.z = input.TEXCOORD4.w;
    u_xlat5.xyz = (-u_xlat4.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat6.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat48 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat4.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = sqrt(u_xlat49);
    u_xlat49 = (-u_xlat48) + u_xlat49;
    u_xlat48 = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat49, u_xlat48);
    u_xlat48 = fma(u_xlat48, FGlobals._LightShadowData.z, FGlobals._LightShadowData.w);
    u_xlat48 = clamp(u_xlat48, 0.0f, 1.0f);
    u_xlatb49 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb49){
        u_xlatb5 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat20.xyz = input.TEXCOORD3.www * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat20.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.www, u_xlat20.xyz);
        u_xlat20.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD4.www, u_xlat20.xyz);
        u_xlat20.xyz = u_xlat20.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb5)) ? u_xlat20.xyz : u_xlat4.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat5.yzw = u_xlat5.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat20.x = fma(u_xlat5.y, 0.25, 0.75);
        u_xlat6.x = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat5.x = max(u_xlat20.x, u_xlat6.x);
        u_xlat5 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat5.x = dot(u_xlat5, FGlobals.unity_OcclusionMaskSelector);
    u_xlat5.x = clamp(u_xlat5.x, 0.0f, 1.0f);
    u_xlat20.xy = input.TEXCOORD7.xy / input.TEXCOORD7.ww;
    u_xlat20.x = _ShadowMapTexture.sample(sampler_ShadowMapTexture, u_xlat20.xy).x;
    u_xlat5.x = (-u_xlat20.x) + u_xlat5.x;
    u_xlat48 = fma(u_xlat48, u_xlat5.x, u_xlat20.x);
    u_xlat5.x = _OcclusionMap.sample(sampler_OcclusionMap, input.TEXCOORD0.xy).y;
    u_xlat20.x = (-FGlobals._OcclusionStrength) + 1.0;
    u_xlat5.x = fma(u_xlat5.x, FGlobals._OcclusionStrength, u_xlat20.x);
    u_xlat20.x = (-FGlobals._Glossiness) + 1.0;
    u_xlat35 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat35 = u_xlat35 + u_xlat35;
    u_xlat6.xyz = fma(u_xlat2.xyz, (-float3(u_xlat35)), u_xlat3.xyz);
    u_xlat7.xyz = float3(u_xlat48) * FGlobals._LightColor0.xyz;
    if(u_xlatb49){
        u_xlatb48 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat8.xyz = input.TEXCOORD3.www * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat8.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.www, u_xlat8.xyz);
        u_xlat8.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD4.www, u_xlat8.xyz);
        u_xlat8.xyz = u_xlat8.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat8.xyz = (bool(u_xlatb48)) ? u_xlat8.xyz : u_xlat4.xyz;
        u_xlat8.xyz = u_xlat8.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat8.yzw = u_xlat8.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat48 = u_xlat8.y * 0.25;
        u_xlat49 = FGlobals.unity_ProbeVolumeParams.z * 0.5;
        u_xlat35 = fma((-FGlobals.unity_ProbeVolumeParams.z), 0.5, 0.25);
        u_xlat48 = max(u_xlat48, u_xlat49);
        u_xlat8.x = min(u_xlat35, u_xlat48);
        u_xlat9 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat8.xzw);
        u_xlat10.xyz = u_xlat8.xzw + float3(0.25, 0.0, 0.0);
        u_xlat10 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat10.xyz);
        u_xlat8.xyz = u_xlat8.xzw + float3(0.5, 0.0, 0.0);
        u_xlat8 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat8.xyz);
        u_xlat2.w = 1.0;
        u_xlat9.x = dot(u_xlat9, u_xlat2);
        u_xlat9.y = dot(u_xlat10, u_xlat2);
        u_xlat9.z = dot(u_xlat8, u_xlat2);
    } else {
        u_xlat2.w = 1.0;
        u_xlat9.x = dot(FGlobals.unity_SHAr, u_xlat2);
        u_xlat9.y = dot(FGlobals.unity_SHAg, u_xlat2);
        u_xlat9.z = dot(FGlobals.unity_SHAb, u_xlat2);
    }
    u_xlat8.xyz = u_xlat9.xyz + input.TEXCOORD5.xyz;
    u_xlat8.xyz = max(u_xlat8.xyz, float3(0.0, 0.0, 0.0));
    u_xlatb47 = 0.0<FGlobals.unity_SpecCube0_ProbePosition.w;
    if(u_xlatb47){
        u_xlat47 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat47 = rsqrt(u_xlat47);
        u_xlat9.xyz = float3(u_xlat47) * u_xlat6.xyz;
        u_xlat10.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube0_BoxMax.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
        u_xlat11.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube0_BoxMin.xyz;
        u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
        u_xlatb12.xyz = (float3(0.0, 0.0, 0.0)<u_xlat9.xyz);
        {
            float4 hlslcc_movcTemp = u_xlat10;
            hlslcc_movcTemp.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
            hlslcc_movcTemp.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
            hlslcc_movcTemp.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
            u_xlat10 = hlslcc_movcTemp;
        }
        u_xlat47 = min(u_xlat10.y, u_xlat10.x);
        u_xlat47 = min(u_xlat10.z, u_xlat47);
        u_xlat10.xyz = u_xlat4.xyz + (-FGlobals.unity_SpecCube0_ProbePosition.xyz);
        u_xlat9.xyz = fma(u_xlat9.xyz, float3(u_xlat47), u_xlat10.xyz);
    } else {
        u_xlat9.xyz = u_xlat6.xyz;
    }
    u_xlat47 = fma((-u_xlat20.x), 0.699999988, 1.70000005);
    u_xlat47 = u_xlat47 * u_xlat20.x;
    u_xlat47 = u_xlat47 * 6.0;
    u_xlat9 = unity_SpecCube0.sample(samplerunity_SpecCube0, u_xlat9.xyz, level(u_xlat47));
    u_xlat48 = u_xlat9.w + -1.0;
    u_xlat48 = fma(FGlobals.unity_SpecCube0_HDR.w, u_xlat48, 1.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * FGlobals.unity_SpecCube0_HDR.y;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * FGlobals.unity_SpecCube0_HDR.x;
    u_xlat10.xyz = u_xlat9.xyz * float3(u_xlat48);
    u_xlatb49 = FGlobals.unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb49){
        u_xlatb49 = 0.0<FGlobals.unity_SpecCube1_ProbePosition.w;
        if(u_xlatb49){
            u_xlat49 = dot(u_xlat6.xyz, u_xlat6.xyz);
            u_xlat49 = rsqrt(u_xlat49);
            u_xlat11.xyz = float3(u_xlat49) * u_xlat6.xyz;
            u_xlat12.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube1_BoxMax.xyz;
            u_xlat12.xyz = u_xlat12.xyz / u_xlat11.xyz;
            u_xlat13.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube1_BoxMin.xyz;
            u_xlat13.xyz = u_xlat13.xyz / u_xlat11.xyz;
            u_xlatb14.xyz = (float3(0.0, 0.0, 0.0)<u_xlat11.xyz);
            {
                float3 hlslcc_movcTemp = u_xlat12;
                hlslcc_movcTemp.x = (u_xlatb14.x) ? u_xlat12.x : u_xlat13.x;
                hlslcc_movcTemp.y = (u_xlatb14.y) ? u_xlat12.y : u_xlat13.y;
                hlslcc_movcTemp.z = (u_xlatb14.z) ? u_xlat12.z : u_xlat13.z;
                u_xlat12 = hlslcc_movcTemp;
            }
            u_xlat49 = min(u_xlat12.y, u_xlat12.x);
            u_xlat49 = min(u_xlat12.z, u_xlat49);
            u_xlat4.xyz = u_xlat4.xyz + (-FGlobals.unity_SpecCube1_ProbePosition.xyz);
            u_xlat6.xyz = fma(u_xlat11.xyz, float3(u_xlat49), u_xlat4.xyz);
        }
        u_xlat4 = unity_SpecCube1.sample(samplerunity_SpecCube0, u_xlat6.xyz, level(u_xlat47));
        u_xlat47 = u_xlat4.w + -1.0;
        u_xlat47 = fma(FGlobals.unity_SpecCube1_HDR.w, u_xlat47, 1.0);
        u_xlat47 = log2(u_xlat47);
        u_xlat47 = u_xlat47 * FGlobals.unity_SpecCube1_HDR.y;
        u_xlat47 = exp2(u_xlat47);
        u_xlat47 = u_xlat47 * FGlobals.unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat4.xyz * float3(u_xlat47);
        u_xlat6.xyz = fma(float3(u_xlat48), u_xlat9.xyz, (-u_xlat4.xyz));
        u_xlat10.xyz = fma(FGlobals.unity_SpecCube0_BoxMin.www, u_xlat6.xyz, u_xlat4.xyz);
    }
    u_xlat4.xyz = u_xlat5.xxx * u_xlat10.xyz;
    u_xlat6.xyz = fma((-input.TEXCOORD1.xyz), float3(u_xlat46), FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat46 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat46 = max(u_xlat46, 0.00100000005);
    u_xlat46 = rsqrt(u_xlat46);
    u_xlat6.xyz = float3(u_xlat46) * u_xlat6.xyz;
    u_xlat46 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat47 = dot(u_xlat2.xyz, FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat47 = clamp(u_xlat47, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat17.x = dot(FGlobals._WorldSpaceLightPos0.xyz, u_xlat6.xyz);
    u_xlat17.x = clamp(u_xlat17.x, 0.0f, 1.0f);
    u_xlat32 = u_xlat17.x * u_xlat17.x;
    u_xlat32 = dot(float2(u_xlat32), u_xlat20.xx);
    u_xlat32 = u_xlat32 + -0.5;
    u_xlat3.x = (-u_xlat47) + 1.0;
    u_xlat18 = u_xlat3.x * u_xlat3.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat3.x = u_xlat3.x * u_xlat18;
    u_xlat3.x = fma(u_xlat32, u_xlat3.x, 1.0);
    u_xlat18 = -abs(u_xlat46) + 1.0;
    u_xlat33 = u_xlat18 * u_xlat18;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat18 = u_xlat18 * u_xlat33;
    u_xlat32 = fma(u_xlat32, u_xlat18, 1.0);
    u_xlat32 = u_xlat32 * u_xlat3.x;
    u_xlat32 = u_xlat47 * u_xlat32;
    u_xlat3.x = u_xlat20.x * u_xlat20.x;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat33 = (-u_xlat3.x) + 1.0;
    u_xlat48 = fma(abs(u_xlat46), u_xlat33, u_xlat3.x);
    u_xlat33 = fma(u_xlat47, u_xlat33, u_xlat3.x);
    u_xlat46 = abs(u_xlat46) * u_xlat33;
    u_xlat46 = fma(u_xlat47, u_xlat48, u_xlat46);
    u_xlat46 = u_xlat46 + 9.99999975e-06;
    u_xlat46 = 0.5 / u_xlat46;
    u_xlat33 = u_xlat3.x * u_xlat3.x;
    u_xlat48 = fma(u_xlat2.x, u_xlat33, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat48, u_xlat2.x, 1.0);
    u_xlat33 = u_xlat33 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat2.x = u_xlat33 / u_xlat2.x;
    u_xlat46 = u_xlat46 * u_xlat2.x;
    u_xlat46 = u_xlat47 * u_xlat46;
    u_xlat46 = u_xlat46 * 3.14159274;
    u_xlat46 = max(u_xlat46, 0.0);
    u_xlat2.x = fma(u_xlat3.x, u_xlat3.x, 1.0);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat47 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb47 = u_xlat47!=0.0;
    u_xlat47 = u_xlatb47 ? 1.0 : float(0.0);
    u_xlat46 = u_xlat46 * u_xlat47;
    u_xlat45 = (-u_xlat45) + FGlobals._Glossiness;
    u_xlat45 = u_xlat45 + 1.0;
    u_xlat45 = clamp(u_xlat45, 0.0f, 1.0f);
    u_xlat3.xzw = float3(u_xlat32) * u_xlat7.xyz;
    u_xlat3.xzw = fma(u_xlat8.xyz, u_xlat5.xxx, u_xlat3.xzw);
    u_xlat5.xyz = u_xlat7.xyz * float3(u_xlat46);
    u_xlat46 = (-u_xlat17.x) + 1.0;
    u_xlat17.x = u_xlat46 * u_xlat46;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat46 = u_xlat46 * u_xlat17.x;
    u_xlat17.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat17.xyz = fma(u_xlat17.xyz, float3(u_xlat46), u_xlat0.xyz);
    u_xlat17.xyz = u_xlat17.xyz * u_xlat5.xyz;
    u_xlat1.xyz = fma(u_xlat1.xyz, u_xlat3.xzw, u_xlat17.xyz);
    u_xlat2.xyz = u_xlat4.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + float3(u_xlat45);
    u_xlat0.xyz = fma(float3(u_xlat18), u_xlat3.xzw, u_xlat0.xyz);
    u_xlat0.xyz = fma(u_xlat2.xyz, u_xlat0.xyz, u_xlat1.xyz);
    u_xlat1.xyz = _EmissionMap.sample(sampler_EmissionMap, input.TEXCOORD0.xy).xyz;
    output.SV_Target0.xyz = fma(u_xlat1.xyz, FGlobals._EmissionColor.xyz, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL LIGHTPROBE_SH SHADOWS_SCREEN
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 1 sampler slot 4
Set 2D Texture "_OcclusionMap" to slot 2 sampler slot 3
Set CUBE Texture "unity_SpecCube0" to slot 3 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 4 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 5 sampler slot 1

Constant Buffer "FGlobals" (476 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 128
  Matrix4x4 unity_ProbeVolumeWorldToObject at 336
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_OcclusionMaskSelector at 80
  Vector4 _LightShadowData at 96
  Vector4 unity_ShadowFadeCenterAndType at 112
  Vector4 unity_SpecCube0_BoxMax at 192
  Vector4 unity_SpecCube0_BoxMin at 208
  Vector4 unity_SpecCube0_ProbePosition at 224
  Vector4 unity_SpecCube0_HDR at 240
  Vector4 unity_SpecCube1_BoxMax at 256
  Vector4 unity_SpecCube1_BoxMin at 272
  Vector4 unity_SpecCube1_ProbePosition at 288
  Vector4 unity_SpecCube1_HDR at 304
  Vector4 unity_ProbeVolumeParams at 320
  Vector3 unity_ProbeVolumeSizeInv at 400
  Vector3 unity_ProbeVolumeMin at 416
  Vector4 _LightColor0 at 432
  Vector4 _Color at 448
  Float _Metallic at 464
  Float _Glossiness at 468
  Float _OcclusionStrength at 472
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_SHAr;
    float4 unity_SHAg;
    float4 unity_SHAb;
    float4 unity_OcclusionMaskSelector;
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_SpecCube0_BoxMax;
    float4 unity_SpecCube0_BoxMin;
    float4 unity_SpecCube0_ProbePosition;
    float4 unity_SpecCube0_HDR;
    float4 unity_SpecCube1_BoxMax;
    float4 unity_SpecCube1_BoxMin;
    float4 unity_SpecCube1_ProbePosition;
    float4 unity_SpecCube1_HDR;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float _OcclusionStrength;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float4 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_SpecCube0 [[ sampler (0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    sampler sampler_OcclusionMap [[ sampler (3) ]],
    sampler sampler_ShadowMapTexture [[ sampler (4) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _ShadowMapTexture [[ texture(1) ]] ,
    texture2d<float, access::sample > _OcclusionMap [[ texture(2) ]] ,
    texturecube<float, access::sample > unity_SpecCube0 [[ texture(3) ]] ,
    texturecube<float, access::sample > unity_SpecCube1 [[ texture(4) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(5) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float4 u_xlat5;
    bool u_xlatb5;
    float3 u_xlat6;
    float3 u_xlat7;
    float4 u_xlat8;
    float4 u_xlat9;
    float4 u_xlat10;
    float3 u_xlat11;
    float3 u_xlat12;
    bool3 u_xlatb12;
    float3 u_xlat13;
    bool3 u_xlatb14;
    float3 u_xlat17;
    float u_xlat18;
    float3 u_xlat20;
    float u_xlat32;
    float u_xlat33;
    float u_xlat35;
    float u_xlat45;
    float u_xlat46;
    float u_xlat47;
    bool u_xlatb47;
    float u_xlat48;
    bool u_xlatb48;
    float u_xlat49;
    bool u_xlatb49;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat45 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat45) * u_xlat1.xyz;
    u_xlat46 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat46 = rsqrt(u_xlat46);
    u_xlat2.xyz = float3(u_xlat46) * input.TEXCOORD4.xyz;
    u_xlat46 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat46 = rsqrt(u_xlat46);
    u_xlat3.xyz = float3(u_xlat46) * input.TEXCOORD1.xyz;
    u_xlat4.x = input.TEXCOORD2.w;
    u_xlat4.y = input.TEXCOORD3.w;
    u_xlat4.z = input.TEXCOORD4.w;
    u_xlat5.xyz = (-u_xlat4.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat6.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat48 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat4.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat49 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat49 = sqrt(u_xlat49);
    u_xlat49 = (-u_xlat48) + u_xlat49;
    u_xlat48 = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat49, u_xlat48);
    u_xlat48 = fma(u_xlat48, FGlobals._LightShadowData.z, FGlobals._LightShadowData.w);
    u_xlat48 = clamp(u_xlat48, 0.0f, 1.0f);
    u_xlatb49 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb49){
        u_xlatb5 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat20.xyz = input.TEXCOORD3.www * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat20.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.www, u_xlat20.xyz);
        u_xlat20.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD4.www, u_xlat20.xyz);
        u_xlat20.xyz = u_xlat20.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb5)) ? u_xlat20.xyz : u_xlat4.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat5.yzw = u_xlat5.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat20.x = fma(u_xlat5.y, 0.25, 0.75);
        u_xlat6.x = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat5.x = max(u_xlat20.x, u_xlat6.x);
        u_xlat5 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat5.x = dot(u_xlat5, FGlobals.unity_OcclusionMaskSelector);
    u_xlat5.x = clamp(u_xlat5.x, 0.0f, 1.0f);
    u_xlat20.xy = input.TEXCOORD7.xy / input.TEXCOORD7.ww;
    u_xlat20.x = _ShadowMapTexture.sample(sampler_ShadowMapTexture, u_xlat20.xy).x;
    u_xlat5.x = (-u_xlat20.x) + u_xlat5.x;
    u_xlat48 = fma(u_xlat48, u_xlat5.x, u_xlat20.x);
    u_xlat5.x = _OcclusionMap.sample(sampler_OcclusionMap, input.TEXCOORD0.xy).y;
    u_xlat20.x = (-FGlobals._OcclusionStrength) + 1.0;
    u_xlat5.x = fma(u_xlat5.x, FGlobals._OcclusionStrength, u_xlat20.x);
    u_xlat20.x = (-FGlobals._Glossiness) + 1.0;
    u_xlat35 = dot(u_xlat3.xyz, u_xlat2.xyz);
    u_xlat35 = u_xlat35 + u_xlat35;
    u_xlat6.xyz = fma(u_xlat2.xyz, (-float3(u_xlat35)), u_xlat3.xyz);
    u_xlat7.xyz = float3(u_xlat48) * FGlobals._LightColor0.xyz;
    if(u_xlatb49){
        u_xlatb48 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat8.xyz = input.TEXCOORD3.www * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat8.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.www, u_xlat8.xyz);
        u_xlat8.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD4.www, u_xlat8.xyz);
        u_xlat8.xyz = u_xlat8.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat8.xyz = (bool(u_xlatb48)) ? u_xlat8.xyz : u_xlat4.xyz;
        u_xlat8.xyz = u_xlat8.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat8.yzw = u_xlat8.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat48 = u_xlat8.y * 0.25;
        u_xlat49 = FGlobals.unity_ProbeVolumeParams.z * 0.5;
        u_xlat35 = fma((-FGlobals.unity_ProbeVolumeParams.z), 0.5, 0.25);
        u_xlat48 = max(u_xlat48, u_xlat49);
        u_xlat8.x = min(u_xlat35, u_xlat48);
        u_xlat9 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat8.xzw);
        u_xlat10.xyz = u_xlat8.xzw + float3(0.25, 0.0, 0.0);
        u_xlat10 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat10.xyz);
        u_xlat8.xyz = u_xlat8.xzw + float3(0.5, 0.0, 0.0);
        u_xlat8 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat8.xyz);
        u_xlat2.w = 1.0;
        u_xlat9.x = dot(u_xlat9, u_xlat2);
        u_xlat9.y = dot(u_xlat10, u_xlat2);
        u_xlat9.z = dot(u_xlat8, u_xlat2);
    } else {
        u_xlat2.w = 1.0;
        u_xlat9.x = dot(FGlobals.unity_SHAr, u_xlat2);
        u_xlat9.y = dot(FGlobals.unity_SHAg, u_xlat2);
        u_xlat9.z = dot(FGlobals.unity_SHAb, u_xlat2);
    }
    u_xlat8.xyz = u_xlat9.xyz + input.TEXCOORD5.xyz;
    u_xlat8.xyz = max(u_xlat8.xyz, float3(0.0, 0.0, 0.0));
    u_xlatb47 = 0.0<FGlobals.unity_SpecCube0_ProbePosition.w;
    if(u_xlatb47){
        u_xlat47 = dot(u_xlat6.xyz, u_xlat6.xyz);
        u_xlat47 = rsqrt(u_xlat47);
        u_xlat9.xyz = float3(u_xlat47) * u_xlat6.xyz;
        u_xlat10.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube0_BoxMax.xyz;
        u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
        u_xlat11.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube0_BoxMin.xyz;
        u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
        u_xlatb12.xyz = (float3(0.0, 0.0, 0.0)<u_xlat9.xyz);
        {
            float4 hlslcc_movcTemp = u_xlat10;
            hlslcc_movcTemp.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
            hlslcc_movcTemp.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
            hlslcc_movcTemp.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
            u_xlat10 = hlslcc_movcTemp;
        }
        u_xlat47 = min(u_xlat10.y, u_xlat10.x);
        u_xlat47 = min(u_xlat10.z, u_xlat47);
        u_xlat10.xyz = u_xlat4.xyz + (-FGlobals.unity_SpecCube0_ProbePosition.xyz);
        u_xlat9.xyz = fma(u_xlat9.xyz, float3(u_xlat47), u_xlat10.xyz);
    } else {
        u_xlat9.xyz = u_xlat6.xyz;
    }
    u_xlat47 = fma((-u_xlat20.x), 0.699999988, 1.70000005);
    u_xlat47 = u_xlat47 * u_xlat20.x;
    u_xlat47 = u_xlat47 * 6.0;
    u_xlat9 = unity_SpecCube0.sample(samplerunity_SpecCube0, u_xlat9.xyz, level(u_xlat47));
    u_xlat48 = u_xlat9.w + -1.0;
    u_xlat48 = fma(FGlobals.unity_SpecCube0_HDR.w, u_xlat48, 1.0);
    u_xlat48 = log2(u_xlat48);
    u_xlat48 = u_xlat48 * FGlobals.unity_SpecCube0_HDR.y;
    u_xlat48 = exp2(u_xlat48);
    u_xlat48 = u_xlat48 * FGlobals.unity_SpecCube0_HDR.x;
    u_xlat10.xyz = u_xlat9.xyz * float3(u_xlat48);
    u_xlatb49 = FGlobals.unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb49){
        u_xlatb49 = 0.0<FGlobals.unity_SpecCube1_ProbePosition.w;
        if(u_xlatb49){
            u_xlat49 = dot(u_xlat6.xyz, u_xlat6.xyz);
            u_xlat49 = rsqrt(u_xlat49);
            u_xlat11.xyz = float3(u_xlat49) * u_xlat6.xyz;
            u_xlat12.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube1_BoxMax.xyz;
            u_xlat12.xyz = u_xlat12.xyz / u_xlat11.xyz;
            u_xlat13.xyz = (-u_xlat4.xyz) + FGlobals.unity_SpecCube1_BoxMin.xyz;
            u_xlat13.xyz = u_xlat13.xyz / u_xlat11.xyz;
            u_xlatb14.xyz = (float3(0.0, 0.0, 0.0)<u_xlat11.xyz);
            {
                float3 hlslcc_movcTemp = u_xlat12;
                hlslcc_movcTemp.x = (u_xlatb14.x) ? u_xlat12.x : u_xlat13.x;
                hlslcc_movcTemp.y = (u_xlatb14.y) ? u_xlat12.y : u_xlat13.y;
                hlslcc_movcTemp.z = (u_xlatb14.z) ? u_xlat12.z : u_xlat13.z;
                u_xlat12 = hlslcc_movcTemp;
            }
            u_xlat49 = min(u_xlat12.y, u_xlat12.x);
            u_xlat49 = min(u_xlat12.z, u_xlat49);
            u_xlat4.xyz = u_xlat4.xyz + (-FGlobals.unity_SpecCube1_ProbePosition.xyz);
            u_xlat6.xyz = fma(u_xlat11.xyz, float3(u_xlat49), u_xlat4.xyz);
        }
        u_xlat4 = unity_SpecCube1.sample(samplerunity_SpecCube0, u_xlat6.xyz, level(u_xlat47));
        u_xlat47 = u_xlat4.w + -1.0;
        u_xlat47 = fma(FGlobals.unity_SpecCube1_HDR.w, u_xlat47, 1.0);
        u_xlat47 = log2(u_xlat47);
        u_xlat47 = u_xlat47 * FGlobals.unity_SpecCube1_HDR.y;
        u_xlat47 = exp2(u_xlat47);
        u_xlat47 = u_xlat47 * FGlobals.unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat4.xyz * float3(u_xlat47);
        u_xlat6.xyz = fma(float3(u_xlat48), u_xlat9.xyz, (-u_xlat4.xyz));
        u_xlat10.xyz = fma(FGlobals.unity_SpecCube0_BoxMin.www, u_xlat6.xyz, u_xlat4.xyz);
    }
    u_xlat4.xyz = u_xlat5.xxx * u_xlat10.xyz;
    u_xlat6.xyz = fma((-input.TEXCOORD1.xyz), float3(u_xlat46), FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat46 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat46 = max(u_xlat46, 0.00100000005);
    u_xlat46 = rsqrt(u_xlat46);
    u_xlat6.xyz = float3(u_xlat46) * u_xlat6.xyz;
    u_xlat46 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat47 = dot(u_xlat2.xyz, FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat47 = clamp(u_xlat47, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat17.x = dot(FGlobals._WorldSpaceLightPos0.xyz, u_xlat6.xyz);
    u_xlat17.x = clamp(u_xlat17.x, 0.0f, 1.0f);
    u_xlat32 = u_xlat17.x * u_xlat17.x;
    u_xlat32 = dot(float2(u_xlat32), u_xlat20.xx);
    u_xlat32 = u_xlat32 + -0.5;
    u_xlat3.x = (-u_xlat47) + 1.0;
    u_xlat18 = u_xlat3.x * u_xlat3.x;
    u_xlat18 = u_xlat18 * u_xlat18;
    u_xlat3.x = u_xlat3.x * u_xlat18;
    u_xlat3.x = fma(u_xlat32, u_xlat3.x, 1.0);
    u_xlat18 = -abs(u_xlat46) + 1.0;
    u_xlat33 = u_xlat18 * u_xlat18;
    u_xlat33 = u_xlat33 * u_xlat33;
    u_xlat18 = u_xlat18 * u_xlat33;
    u_xlat32 = fma(u_xlat32, u_xlat18, 1.0);
    u_xlat32 = u_xlat32 * u_xlat3.x;
    u_xlat32 = u_xlat47 * u_xlat32;
    u_xlat3.x = u_xlat20.x * u_xlat20.x;
    u_xlat3.x = max(u_xlat3.x, 0.00200000009);
    u_xlat33 = (-u_xlat3.x) + 1.0;
    u_xlat48 = fma(abs(u_xlat46), u_xlat33, u_xlat3.x);
    u_xlat33 = fma(u_xlat47, u_xlat33, u_xlat3.x);
    u_xlat46 = abs(u_xlat46) * u_xlat33;
    u_xlat46 = fma(u_xlat47, u_xlat48, u_xlat46);
    u_xlat46 = u_xlat46 + 9.99999975e-06;
    u_xlat46 = 0.5 / u_xlat46;
    u_xlat33 = u_xlat3.x * u_xlat3.x;
    u_xlat48 = fma(u_xlat2.x, u_xlat33, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat48, u_xlat2.x, 1.0);
    u_xlat33 = u_xlat33 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat2.x = u_xlat33 / u_xlat2.x;
    u_xlat46 = u_xlat46 * u_xlat2.x;
    u_xlat46 = u_xlat47 * u_xlat46;
    u_xlat46 = u_xlat46 * 3.14159274;
    u_xlat46 = max(u_xlat46, 0.0);
    u_xlat2.x = fma(u_xlat3.x, u_xlat3.x, 1.0);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat47 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb47 = u_xlat47!=0.0;
    u_xlat47 = u_xlatb47 ? 1.0 : float(0.0);
    u_xlat46 = u_xlat46 * u_xlat47;
    u_xlat45 = (-u_xlat45) + FGlobals._Glossiness;
    u_xlat45 = u_xlat45 + 1.0;
    u_xlat45 = clamp(u_xlat45, 0.0f, 1.0f);
    u_xlat3.xzw = float3(u_xlat32) * u_xlat7.xyz;
    u_xlat3.xzw = fma(u_xlat8.xyz, u_xlat5.xxx, u_xlat3.xzw);
    u_xlat5.xyz = u_xlat7.xyz * float3(u_xlat46);
    u_xlat46 = (-u_xlat17.x) + 1.0;
    u_xlat17.x = u_xlat46 * u_xlat46;
    u_xlat17.x = u_xlat17.x * u_xlat17.x;
    u_xlat46 = u_xlat46 * u_xlat17.x;
    u_xlat17.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat17.xyz = fma(u_xlat17.xyz, float3(u_xlat46), u_xlat0.xyz);
    u_xlat17.xyz = u_xlat17.xyz * u_xlat5.xyz;
    u_xlat1.xyz = fma(u_xlat1.xyz, u_xlat3.xzw, u_xlat17.xyz);
    u_xlat2.xyz = u_xlat4.xyz * u_xlat2.xxx;
    u_xlat3.xzw = (-u_xlat0.xyz) + float3(u_xlat45);
    u_xlat0.xyz = fma(float3(u_xlat18), u_xlat3.xzw, u_xlat0.xyz);
    output.SV_Target0.xyz = fma(u_xlat2.xyz, u_xlat0.xyz, u_xlat1.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL _EMISSION
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 3
Set 2D Texture "_OcclusionMap" to slot 1 sampler slot 4
Set 2D Texture "unity_NHxRoughness" to slot 2
Set 2D Texture "_EmissionMap" to slot 3 sampler slot 5
Set CUBE Texture "unity_SpecCube0" to slot 4 sampler slot 0
Set 3D Texture "unity_ProbeVolumeSH" to slot 5 sampler slot 1

Constant Buffer "FGlobals" (224 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_OcclusionMaskSelector at 16
  Vector4 unity_SpecCube0_HDR at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Vector4 _Color at 176
  Float _Metallic at 192
  Float _Glossiness at 196
  Vector4 _EmissionColor at 208
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 unity_SpecCube0_HDR;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float4 _EmissionColor;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_SpecCube0 [[ sampler (0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (1) ]],
    sampler samplerunity_NHxRoughness [[ sampler (2) ]],
    sampler sampler_MainTex [[ sampler (3) ]],
    sampler sampler_OcclusionMap [[ sampler (4) ]],
    sampler sampler_EmissionMap [[ sampler (5) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _OcclusionMap [[ texture(1) ]] ,
    texture2d<float, access::sample > unity_NHxRoughness [[ texture(2) ]] ,
    texture2d<float, access::sample > _EmissionMap [[ texture(3) ]] ,
    texturecube<float, access::sample > unity_SpecCube0 [[ texture(4) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(5) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float3 u_xlat5;
    float3 u_xlat6;
    float3 u_xlat9;
    float3 u_xlat11;
    float u_xlat21;
    float u_xlat22;
    bool u_xlatb22;
    float u_xlat23;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat21 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat22 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat2.xyz = float3(u_xlat22) * input.TEXCOORD4.xyz;
    u_xlatb22 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = input.TEXCOORD3.www * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.www, u_xlat3.xyz);
        u_xlat3.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD4.www, u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat11.x = input.TEXCOORD2.w;
        u_xlat11.y = input.TEXCOORD3.w;
        u_xlat11.z = input.TEXCOORD4.w;
        u_xlat3.xyz = (bool(u_xlatb22)) ? u_xlat3.xyz : u_xlat11.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat3.yzw = u_xlat3.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat22 = fma(u_xlat3.y, 0.25, 0.75);
        u_xlat23 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat3.x = max(u_xlat22, u_xlat23);
        u_xlat3 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    }
    u_xlat22 = dot(u_xlat3, FGlobals.unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0f, 1.0f);
    u_xlat23 = _OcclusionMap.sample(sampler_OcclusionMap, input.TEXCOORD0.xy).y;
    u_xlat3.xw = (-float2(FGlobals._Glossiness)) + float2(1.0, 1.0);
    u_xlat4.x = dot(input.TEXCOORD1.xyz, u_xlat2.xyz);
    u_xlat4.x = u_xlat4.x + u_xlat4.x;
    u_xlat4.xyz = fma(u_xlat2.xyz, (-u_xlat4.xxx), input.TEXCOORD1.xyz);
    u_xlat5.xyz = float3(u_xlat22) * FGlobals._LightColor0.xyz;
    u_xlat22 = fma((-u_xlat3.x), 0.699999988, 1.70000005);
    u_xlat22 = u_xlat22 * u_xlat3.x;
    u_xlat22 = u_xlat22 * 6.0;
    u_xlat4 = unity_SpecCube0.sample(samplerunity_SpecCube0, u_xlat4.xyz, level(u_xlat22));
    u_xlat22 = u_xlat4.w + -1.0;
    u_xlat22 = fma(FGlobals.unity_SpecCube0_HDR.w, u_xlat22, 1.0);
    u_xlat22 = log2(u_xlat22);
    u_xlat22 = u_xlat22 * FGlobals.unity_SpecCube0_HDR.y;
    u_xlat22 = exp2(u_xlat22);
    u_xlat22 = u_xlat22 * FGlobals.unity_SpecCube0_HDR.x;
    u_xlat4.xyz = u_xlat4.xyz * float3(u_xlat22);
    u_xlat4.xyz = float3(u_xlat23) * u_xlat4.xyz;
    u_xlat22 = dot((-input.TEXCOORD1.xyz), u_xlat2.xyz);
    u_xlat23 = u_xlat22 + u_xlat22;
    u_xlat6.xyz = fma(u_xlat2.xyz, (-float3(u_xlat23)), (-input.TEXCOORD1.xyz));
    u_xlat2.x = dot(u_xlat2.xyz, FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat22 = u_xlat22;
    u_xlat22 = clamp(u_xlat22, 0.0f, 1.0f);
    u_xlat6.x = dot(u_xlat6.xyz, FGlobals._WorldSpaceLightPos0.xyz);
    u_xlat6.y = (-u_xlat22) + 1.0;
    u_xlat9.xy = u_xlat6.xy * u_xlat6.xy;
    u_xlat3.yz = u_xlat9.xy * u_xlat9.xy;
    u_xlat22 = (-u_xlat21) + FGlobals._Glossiness;
    u_xlat22 = u_xlat22 + 1.0;
    u_xlat22 = clamp(u_xlat22, 0.0f, 1.0f);
    u_xlat9.x = unity_NHxRoughness.sample(samplerunity_NHxRoughness, u_xlat3.yw).x;
    u_xlat9.x = u_xlat9.x * 16.0;
    u_xlat9.xyz = u_xlat0.xyz * u_xlat9.xxx;
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(u_xlat21), u_xlat9.xyz);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat5.xyz;
    u_xlat3.xyw = (-u_xlat0.xyz) + float3(u_xlat22);
    u_xlat0.xyz = fma(u_xlat3.zzz, u_xlat3.xyw, u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat4.xyz;
    u_xlat0.xyz = fma(u_xlat1.xyz, u_xlat2.xyz, u_xlat0.xyz);
    u_xlat1.xyz = _EmissionMap.sample(sampler_EmissionMap, input.TEXCOORD0.xy).xyz;
    output.SV_Target0.xyz = fma(u_xlat1.xyz, FGlobals._EmissionColor.xyz, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


 }
 Pass {
  Name "FORWARD_DELTA"
  Tags { "LIGHTMODE"="FORWARDADD" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  ZWrite Off
  Blend [_SrcBlend] One
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords: POINT
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (336 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Matrix4x4 unity_WorldToLight at 272
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 _MainTex_ST at 224
  Vector4 _DetailAlbedoMap_ST at 240
  Float _UVSec at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float3 TEXCOORD6 [[ user(TEXCOORD6) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float4 u_xlat2;
    float u_xlat10;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat0);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat2.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD1.xyz = float3(u_xlat10) * u_xlat2.xyz;
    output.TEXCOORD1.w = 0.0;
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    output.TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.w = 0.0;
    output.TEXCOORD2 = u_xlat1.wwwx;
    output.TEXCOORD3 = u_xlat1.wwwy;
    output.TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD4.xyz = float3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * VGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, u_xlat0.xxx, u_xlat1.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, u_xlat0.zzz, u_xlat1.xyz);
    output.TEXCOORD6.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xyz, u_xlat0.www, u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTexture0" to slot 1 sampler slot 3
Set 2D Texture "unity_NHxRoughness" to slot 2 sampler slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0

Constant Buffer "FGlobals" (240 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 32
  Matrix4x4 unity_WorldToLight at 176
  Vector4 unity_OcclusionMaskSelector at 0
  Vector4 unity_ProbeVolumeParams at 16
  Vector3 unity_ProbeVolumeSizeInv at 96
  Vector3 unity_ProbeVolumeMin at 112
  Vector4 _LightColor0 at 128
  Vector4 _Color at 144
  Float _Metallic at 160
  Float _Glossiness at 164
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 unity_OcclusionMaskSelector;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler samplerunity_NHxRoughness [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    sampler sampler_LightTexture0 [[ sampler (3) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _LightTexture0 [[ texture(1) ]] ,
    texture2d<float, access::sample > unity_NHxRoughness [[ texture(2) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(3) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    float3 u_xlat5;
    float u_xlat18;
    float u_xlat19;
    bool u_xlatb19;
    float u_xlat20;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat18 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat19 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * input.TEXCOORD4.xyz;
    u_xlat3.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat3.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, input.TEXCOORD5.xxx, u_xlat3.xyz);
    u_xlat3.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, input.TEXCOORD5.zzz, u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz + FGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb19 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD5.xxx, u_xlat4.xyz);
        u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD5.zzz, u_xlat4.xyz);
        u_xlat4.xyz = u_xlat4.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb19)) ? u_xlat4.xyz : input.TEXCOORD5.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat4.yzw = u_xlat4.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat19 = fma(u_xlat4.y, 0.25, 0.75);
        u_xlat20 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat4.x = max(u_xlat19, u_xlat20);
        u_xlat4 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat19 = dot(u_xlat4, FGlobals.unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0f, 1.0f);
    u_xlat20 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat20 = _LightTexture0.sample(sampler_LightTexture0, float2(u_xlat20)).x;
    u_xlat19 = u_xlat19 * u_xlat20;
    u_xlat3.xyz = float3(u_xlat19) * FGlobals._LightColor0.xyz;
    u_xlat19 = dot((-input.TEXCOORD1.xyz), u_xlat2.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat4.xyz = fma(u_xlat2.xyz, (-float3(u_xlat19)), (-input.TEXCOORD1.xyz));
    u_xlat5.x = input.TEXCOORD2.w;
    u_xlat5.y = input.TEXCOORD3.w;
    u_xlat5.z = input.TEXCOORD4.w;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.y = (-FGlobals._Glossiness) + 1.0;
    u_xlat2.x = unity_NHxRoughness.sample(samplerunity_NHxRoughness, u_xlat2.xy).x;
    u_xlat2.x = u_xlat2.x * 16.0;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xxx;
    u_xlat0.xyz = fma(u_xlat1.xyz, float3(u_xlat18), u_xlat0.xyz);
    u_xlat1.xyz = float3(u_xlat19) * u_xlat3.xyz;
    output.SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (260 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 _MainTex_ST at 224
  Vector4 _DetailAlbedoMap_ST at 240
  Float _UVSec at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    bool u_xlatb0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    u_xlatb0 = VGlobals._UVSec==0.0;
    u_xlat0.xy = (bool(u_xlatb0)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat0.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat0.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat0.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat1.xyz = u_xlat0.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat6 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    output.TEXCOORD1.xyz = float3(u_xlat6) * u_xlat1.xyz;
    output.TEXCOORD1.w = 0.0;
    u_xlat1.xyz = fma((-u_xlat0.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    output.TEXCOORD5.xyz = u_xlat0.xyz;
    u_xlat1.w = 0.0;
    output.TEXCOORD2 = u_xlat1.wwwx;
    output.TEXCOORD3 = u_xlat1.wwwy;
    output.TEXCOORD4.w = u_xlat1.z;
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    output.TEXCOORD4.xyz = float3(u_xlat6) * u_xlat0.xyz;
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "unity_NHxRoughness" to slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 2 sampler slot 0

Constant Buffer "FGlobals" (168 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 32
  Vector4 unity_OcclusionMaskSelector at 0
  Vector4 unity_ProbeVolumeParams at 16
  Vector3 unity_ProbeVolumeSizeInv at 96
  Vector3 unity_ProbeVolumeMin at 112
  Vector4 _LightColor0 at 128
  Vector4 _Color at 144
  Float _Metallic at 160
  Float _Glossiness at 164
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 unity_OcclusionMaskSelector;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler samplerunity_NHxRoughness [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > unity_NHxRoughness [[ texture(1) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(2) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float4 u_xlat3;
    float3 u_xlat4;
    float3 u_xlat5;
    float u_xlat18;
    float u_xlat19;
    bool u_xlatb19;
    float u_xlat20;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat18 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat19 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * input.TEXCOORD4.xyz;
    u_xlatb19 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat3.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat3.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD5.xxx, u_xlat3.xyz);
        u_xlat3.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD5.zzz, u_xlat3.xyz);
        u_xlat3.xyz = u_xlat3.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat3.xyz = (bool(u_xlatb19)) ? u_xlat3.xyz : input.TEXCOORD5.xyz;
        u_xlat3.xyz = u_xlat3.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat3.yzw = u_xlat3.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat19 = fma(u_xlat3.y, 0.25, 0.75);
        u_xlat20 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat3.x = max(u_xlat19, u_xlat20);
        u_xlat3 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat3.xzw);
    } else {
        u_xlat3.x = float(1.0);
        u_xlat3.y = float(1.0);
        u_xlat3.z = float(1.0);
        u_xlat3.w = float(1.0);
    }
    u_xlat19 = dot(u_xlat3, FGlobals.unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0f, 1.0f);
    u_xlat3.xyz = float3(u_xlat19) * FGlobals._LightColor0.xyz;
    u_xlat19 = dot((-input.TEXCOORD1.xyz), u_xlat2.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat4.xyz = fma(u_xlat2.xyz, (-float3(u_xlat19)), (-input.TEXCOORD1.xyz));
    u_xlat5.x = input.TEXCOORD2.w;
    u_xlat5.y = input.TEXCOORD3.w;
    u_xlat5.z = input.TEXCOORD4.w;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.y = (-FGlobals._Glossiness) + 1.0;
    u_xlat2.x = unity_NHxRoughness.sample(samplerunity_NHxRoughness, u_xlat2.xy).x;
    u_xlat2.x = u_xlat2.x * 16.0;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xxx;
    u_xlat0.xyz = fma(u_xlat1.xyz, float3(u_xlat18), u_xlat0.xyz);
    u_xlat1.xyz = float3(u_xlat19) * u_xlat3.xyz;
    output.SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: SPOT
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (336 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Matrix4x4 unity_WorldToLight at 272
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 _MainTex_ST at 224
  Vector4 _DetailAlbedoMap_ST at 240
  Float _UVSec at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD6 [[ user(TEXCOORD6) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float4 u_xlat2;
    float u_xlat10;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat0);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat2.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD1.xyz = float3(u_xlat10) * u_xlat2.xyz;
    output.TEXCOORD1.w = 0.0;
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    output.TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.w = 0.0;
    output.TEXCOORD2 = u_xlat1.wwwx;
    output.TEXCOORD3 = u_xlat1.wwwy;
    output.TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD4.xyz = float3(u_xlat10) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[2], u_xlat0.zzzz, u_xlat1);
    output.TEXCOORD6 = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[3], u_xlat0.wwww, u_xlat1);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTexture0" to slot 1 sampler slot 3
Set 2D Texture "_LightTextureB0" to slot 2 sampler slot 4
Set 2D Texture "unity_NHxRoughness" to slot 3 sampler slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 4 sampler slot 0

Constant Buffer "FGlobals" (240 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 32
  Matrix4x4 unity_WorldToLight at 176
  Vector4 unity_OcclusionMaskSelector at 0
  Vector4 unity_ProbeVolumeParams at 16
  Vector3 unity_ProbeVolumeSizeInv at 96
  Vector3 unity_ProbeVolumeMin at 112
  Vector4 _LightColor0 at 128
  Vector4 _Color at 144
  Float _Metallic at 160
  Float _Glossiness at 164
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 unity_OcclusionMaskSelector;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler samplerunity_NHxRoughness [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    sampler sampler_LightTexture0 [[ sampler (3) ]],
    sampler sampler_LightTextureB0 [[ sampler (4) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _LightTexture0 [[ texture(1) ]] ,
    texture2d<float, access::sample > _LightTextureB0 [[ texture(2) ]] ,
    texture2d<float, access::sample > unity_NHxRoughness [[ texture(3) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(4) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float3 u_xlat5;
    float u_xlat18;
    float u_xlat19;
    bool u_xlatb19;
    float u_xlat20;
    bool u_xlatb20;
    float u_xlat21;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat18 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat19 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * input.TEXCOORD4.xyz;
    u_xlat3 = input.TEXCOORD5.yyyy * FGlobals.hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat3 = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[0], input.TEXCOORD5.xxxx, u_xlat3);
    u_xlat3 = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[2], input.TEXCOORD5.zzzz, u_xlat3);
    u_xlat3 = u_xlat3 + FGlobals.hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlatb19 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD5.xxx, u_xlat4.xyz);
        u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD5.zzz, u_xlat4.xyz);
        u_xlat4.xyz = u_xlat4.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb19)) ? u_xlat4.xyz : input.TEXCOORD5.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat4.yzw = u_xlat4.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat19 = fma(u_xlat4.y, 0.25, 0.75);
        u_xlat20 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat4.x = max(u_xlat19, u_xlat20);
        u_xlat4 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat19 = dot(u_xlat4, FGlobals.unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0f, 1.0f);
    u_xlatb20 = 0.0<u_xlat3.z;
    u_xlat20 = u_xlatb20 ? 1.0 : float(0.0);
    u_xlat4.xy = u_xlat3.xy / u_xlat3.ww;
    u_xlat4.xy = u_xlat4.xy + float2(0.5, 0.5);
    u_xlat21 = _LightTexture0.sample(sampler_LightTexture0, u_xlat4.xy).w;
    u_xlat20 = u_xlat20 * u_xlat21;
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat3.x = _LightTextureB0.sample(sampler_LightTextureB0, u_xlat3.xx).x;
    u_xlat20 = u_xlat20 * u_xlat3.x;
    u_xlat19 = u_xlat19 * u_xlat20;
    u_xlat3.xyz = float3(u_xlat19) * FGlobals._LightColor0.xyz;
    u_xlat19 = dot((-input.TEXCOORD1.xyz), u_xlat2.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat4.xyz = fma(u_xlat2.xyz, (-float3(u_xlat19)), (-input.TEXCOORD1.xyz));
    u_xlat5.x = input.TEXCOORD2.w;
    u_xlat5.y = input.TEXCOORD3.w;
    u_xlat5.z = input.TEXCOORD4.w;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.y = (-FGlobals._Glossiness) + 1.0;
    u_xlat2.x = unity_NHxRoughness.sample(samplerunity_NHxRoughness, u_xlat2.xy).x;
    u_xlat2.x = u_xlat2.x * 16.0;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xxx;
    u_xlat0.xyz = fma(u_xlat1.xyz, float3(u_xlat18), u_xlat0.xyz);
    u_xlat1.xyz = float3(u_xlat19) * u_xlat3.xyz;
    output.SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: POINT_COOKIE
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (336 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Matrix4x4 unity_WorldToLight at 272
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 _MainTex_ST at 224
  Vector4 _DetailAlbedoMap_ST at 240
  Float _UVSec at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float3 TEXCOORD6 [[ user(TEXCOORD6) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float4 u_xlat2;
    float u_xlat10;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat0);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat2.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD1.xyz = float3(u_xlat10) * u_xlat2.xyz;
    output.TEXCOORD1.w = 0.0;
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    output.TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.w = 0.0;
    output.TEXCOORD2 = u_xlat1.wwwx;
    output.TEXCOORD3 = u_xlat1.wwwy;
    output.TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD4.xyz = float3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * VGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, u_xlat0.xxx, u_xlat1.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, u_xlat0.zzz, u_xlat1.xyz);
    output.TEXCOORD6.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xyz, u_xlat0.www, u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTextureB0" to slot 1 sampler slot 4
Set CUBE Texture "_LightTexture0" to slot 2 sampler slot 3
Set 2D Texture "unity_NHxRoughness" to slot 3 sampler slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 4 sampler slot 0

Constant Buffer "FGlobals" (240 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 32
  Matrix4x4 unity_WorldToLight at 176
  Vector4 unity_OcclusionMaskSelector at 0
  Vector4 unity_ProbeVolumeParams at 16
  Vector3 unity_ProbeVolumeSizeInv at 96
  Vector3 unity_ProbeVolumeMin at 112
  Vector4 _LightColor0 at 128
  Vector4 _Color at 144
  Float _Metallic at 160
  Float _Glossiness at 164
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 unity_OcclusionMaskSelector;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler samplerunity_NHxRoughness [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    sampler sampler_LightTexture0 [[ sampler (3) ]],
    sampler sampler_LightTextureB0 [[ sampler (4) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _LightTextureB0 [[ texture(1) ]] ,
    texturecube<float, access::sample > _LightTexture0 [[ texture(2) ]] ,
    texture2d<float, access::sample > unity_NHxRoughness [[ texture(3) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(4) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    float3 u_xlat5;
    float u_xlat18;
    float u_xlat19;
    bool u_xlatb19;
    float u_xlat20;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat18 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat19 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * input.TEXCOORD4.xyz;
    u_xlat3.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat3.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, input.TEXCOORD5.xxx, u_xlat3.xyz);
    u_xlat3.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, input.TEXCOORD5.zzz, u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz + FGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb19 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD5.xxx, u_xlat4.xyz);
        u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD5.zzz, u_xlat4.xyz);
        u_xlat4.xyz = u_xlat4.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb19)) ? u_xlat4.xyz : input.TEXCOORD5.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat4.yzw = u_xlat4.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat19 = fma(u_xlat4.y, 0.25, 0.75);
        u_xlat20 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat4.x = max(u_xlat19, u_xlat20);
        u_xlat4 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat19 = dot(u_xlat4, FGlobals.unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0f, 1.0f);
    u_xlat20 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat20 = _LightTextureB0.sample(sampler_LightTextureB0, float2(u_xlat20)).x;
    u_xlat3.x = _LightTexture0.sample(sampler_LightTexture0, u_xlat3.xyz).w;
    u_xlat20 = u_xlat20 * u_xlat3.x;
    u_xlat19 = u_xlat19 * u_xlat20;
    u_xlat3.xyz = float3(u_xlat19) * FGlobals._LightColor0.xyz;
    u_xlat19 = dot((-input.TEXCOORD1.xyz), u_xlat2.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat4.xyz = fma(u_xlat2.xyz, (-float3(u_xlat19)), (-input.TEXCOORD1.xyz));
    u_xlat5.x = input.TEXCOORD2.w;
    u_xlat5.y = input.TEXCOORD3.w;
    u_xlat5.z = input.TEXCOORD4.w;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.y = (-FGlobals._Glossiness) + 1.0;
    u_xlat2.x = unity_NHxRoughness.sample(samplerunity_NHxRoughness, u_xlat2.xy).x;
    u_xlat2.x = u_xlat2.x * 16.0;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xxx;
    u_xlat0.xyz = fma(u_xlat1.xyz, float3(u_xlat18), u_xlat0.xyz);
    u_xlat1.xyz = float3(u_xlat19) * u_xlat3.xyz;
    output.SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL_COOKIE
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (336 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Matrix4x4 unity_WorldToLight at 272
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 _MainTex_ST at 224
  Vector4 _DetailAlbedoMap_ST at 240
  Float _UVSec at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float2 TEXCOORD6 [[ user(TEXCOORD6) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float4 u_xlat2;
    float u_xlat10;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat0);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat2.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD1.xyz = float3(u_xlat10) * u_xlat2.xyz;
    output.TEXCOORD1.w = 0.0;
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    output.TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.w = 0.0;
    output.TEXCOORD2 = u_xlat2.wwwx;
    output.TEXCOORD3 = u_xlat2.wwwy;
    output.TEXCOORD4.w = u_xlat2.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD4.xyz = float3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xy = u_xlat0.yy * VGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xy, u_xlat0.xx, u_xlat1.xy);
    u_xlat0.xy = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xy, u_xlat0.zz, u_xlat0.xy);
    output.TEXCOORD6.xy = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xy, u_xlat0.ww, u_xlat0.xy);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTexture0" to slot 1 sampler slot 3
Set 2D Texture "unity_NHxRoughness" to slot 2 sampler slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0

Constant Buffer "FGlobals" (240 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 32
  Matrix4x4 unity_WorldToLight at 176
  Vector4 unity_OcclusionMaskSelector at 0
  Vector4 unity_ProbeVolumeParams at 16
  Vector3 unity_ProbeVolumeSizeInv at 96
  Vector3 unity_ProbeVolumeMin at 112
  Vector4 _LightColor0 at 128
  Vector4 _Color at 144
  Float _Metallic at 160
  Float _Glossiness at 164
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 unity_OcclusionMaskSelector;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler samplerunity_NHxRoughness [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    sampler sampler_LightTexture0 [[ sampler (3) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _LightTexture0 [[ texture(1) ]] ,
    texture2d<float, access::sample > unity_NHxRoughness [[ texture(2) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(3) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    float3 u_xlat5;
    float u_xlat18;
    float u_xlat19;
    bool u_xlatb19;
    float u_xlat20;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat18 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat19 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat2.xyz = float3(u_xlat19) * input.TEXCOORD4.xyz;
    u_xlat3.xy = input.TEXCOORD5.yy * FGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat3.xy = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xy, input.TEXCOORD5.xx, u_xlat3.xy);
    u_xlat3.xy = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xy, input.TEXCOORD5.zz, u_xlat3.xy);
    u_xlat3.xy = u_xlat3.xy + FGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlatb19 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD5.xxx, u_xlat4.xyz);
        u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD5.zzz, u_xlat4.xyz);
        u_xlat4.xyz = u_xlat4.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb19)) ? u_xlat4.xyz : input.TEXCOORD5.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat4.yzw = u_xlat4.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat19 = fma(u_xlat4.y, 0.25, 0.75);
        u_xlat20 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat4.x = max(u_xlat19, u_xlat20);
        u_xlat4 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat19 = dot(u_xlat4, FGlobals.unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0f, 1.0f);
    u_xlat20 = _LightTexture0.sample(sampler_LightTexture0, u_xlat3.xy).w;
    u_xlat19 = u_xlat19 * u_xlat20;
    u_xlat3.xyz = float3(u_xlat19) * FGlobals._LightColor0.xyz;
    u_xlat19 = dot((-input.TEXCOORD1.xyz), u_xlat2.xyz);
    u_xlat19 = u_xlat19 + u_xlat19;
    u_xlat4.xyz = fma(u_xlat2.xyz, (-float3(u_xlat19)), (-input.TEXCOORD1.xyz));
    u_xlat5.x = input.TEXCOORD2.w;
    u_xlat5.y = input.TEXCOORD3.w;
    u_xlat5.z = input.TEXCOORD4.w;
    u_xlat19 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat19 = clamp(u_xlat19, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.y = (-FGlobals._Glossiness) + 1.0;
    u_xlat2.x = unity_NHxRoughness.sample(samplerunity_NHxRoughness, u_xlat2.xy).x;
    u_xlat2.x = u_xlat2.x * 16.0;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat2.xxx;
    u_xlat0.xyz = fma(u_xlat1.xyz, float3(u_xlat18), u_xlat0.xyz);
    u_xlat1.xyz = float3(u_xlat19) * u_xlat3.xyz;
    output.SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: SHADOWS_DEPTH SPOT
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (336 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Matrix4x4 unity_WorldToLight at 272
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 _MainTex_ST at 224
  Vector4 _DetailAlbedoMap_ST at 240
  Float _UVSec at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD6 [[ user(TEXCOORD6) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float4 u_xlat2;
    float u_xlat10;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat0);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat2.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD1.xyz = float3(u_xlat10) * u_xlat2.xyz;
    output.TEXCOORD1.w = 0.0;
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    output.TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.w = 0.0;
    output.TEXCOORD2 = u_xlat1.wwwx;
    output.TEXCOORD3 = u_xlat1.wwwy;
    output.TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD4.xyz = float3(u_xlat10) * u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[2], u_xlat0.zzzz, u_xlat1);
    output.TEXCOORD6 = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[3], u_xlat0.wwww, u_xlat1);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTexture0" to slot 1 sampler slot 3
Set 2D Texture "_LightTextureB0" to slot 2 sampler slot 4
Set 2D Texture "unity_NHxRoughness" to slot 3 sampler slot 0
Set 2D Texture "_ShadowMapTexture" to slot 4 sampler slot 1

Constant Buffer "FGlobals" (384 bytes) on slot 0 {
  Matrix4x4 unity_WorldToShadow[4] at 0
  Matrix4x4 unity_WorldToLight at 320
  Vector4 _LightShadowData at 256
  Vector4 _LightColor0 at 272
  Vector4 _Color at 288
  Float _Metallic at 304
  Float _Glossiness at 308
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 hlslcc_mtx4x4unity_WorldToShadow[16];
    float4 _LightShadowData;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_NHxRoughness [[ sampler (0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    sampler sampler_LightTexture0 [[ sampler (3) ]],
    sampler sampler_LightTextureB0 [[ sampler (4) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _LightTexture0 [[ texture(1) ]] ,
    texture2d<float, access::sample > _LightTextureB0 [[ texture(2) ]] ,
    texture2d<float, access::sample > unity_NHxRoughness [[ texture(3) ]] ,
    depth2d<float, access::sample > _ShadowMapTexture [[ texture(4) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float3 u_xlat2;
    float3 u_xlat3;
    float u_xlat6;
    float u_xlat9;
    u_xlat0 = input.TEXCOORD5.yyyy * FGlobals.hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat0 = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[0], input.TEXCOORD5.xxxx, u_xlat0);
    u_xlat0 = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[2], input.TEXCOORD5.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + FGlobals.hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat1.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = u_xlat1.xy + float2(0.5, 0.5);
    u_xlat9 = _LightTexture0.sample(sampler_LightTexture0, u_xlat1.xy).w;
    u_xlatb1 = 0.0<u_xlat0.z;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = _LightTextureB0.sample(sampler_LightTextureB0, u_xlat0.xx).x;
    u_xlat3.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat3.x = u_xlat9 * u_xlat3.x;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat1 = input.TEXCOORD5.yyyy * FGlobals.hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat1 = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[0], input.TEXCOORD5.xxxx, u_xlat1);
    u_xlat1 = fma(FGlobals.hlslcc_mtx4x4unity_WorldToShadow[2], input.TEXCOORD5.zzzz, u_xlat1);
    u_xlat1 = u_xlat1 + FGlobals.hlslcc_mtx4x4unity_WorldToShadow[3];
    u_xlat3.xyz = u_xlat1.xyz / u_xlat1.www;
    u_xlat3.x = _ShadowMapTexture.sample_compare(sampler_ShadowMapTexture, u_xlat3.xy, saturate(u_xlat3.z), level(0.0));
    u_xlat6 = (-FGlobals._LightShadowData.x) + 1.0;
    u_xlat3.x = fma(u_xlat3.x, u_xlat6, FGlobals._LightShadowData.x);
    u_xlat0.x = u_xlat3.x * u_xlat0.x;
    u_xlat0.xyz = u_xlat0.xxx * FGlobals._LightColor0.xyz;
    u_xlat9 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat1.xyz = float3(u_xlat9) * input.TEXCOORD4.xyz;
    u_xlat2.x = input.TEXCOORD2.w;
    u_xlat2.y = input.TEXCOORD3.w;
    u_xlat2.z = input.TEXCOORD4.w;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0f, 1.0f);
    u_xlat0.xyz = float3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-input.TEXCOORD1.xyz), u_xlat1.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = fma(u_xlat1.xyz, (-float3(u_xlat9)), (-input.TEXCOORD1.xyz));
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat9 * u_xlat9;
    u_xlat1.y = (-FGlobals._Glossiness) + 1.0;
    u_xlat9 = unity_NHxRoughness.sample(samplerunity_NHxRoughness, u_xlat1.xy).x;
    u_xlat9 = u_xlat9 * 16.0;
    u_xlat1.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat2.xyz = fma(FGlobals._Color.xyz, u_xlat1.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat1.xyz = u_xlat1.xyz * FGlobals._Color.xyz;
    u_xlat2.xyz = fma(float3(FGlobals._Metallic), u_xlat2.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat2.xyz = float3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(u_xlat9), u_xlat2.xyz);
    output.SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL SHADOWS_SCREEN
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (276 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 48
  Matrix4x4 unity_WorldToObject at 112
  Matrix4x4 unity_MatrixVP at 176
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _ProjectionParams at 16
  Vector4 _WorldSpaceLightPos0 at 32
  Vector4 _MainTex_ST at 240
  Vector4 _DetailAlbedoMap_ST at 256
  Float _UVSec at 272
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _ProjectionParams;
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float4 u_xlat2;
    float u_xlat10;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    output.mtl_Position = u_xlat0;
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    output.TEXCOORD1.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    output.TEXCOORD1.w = 0.0;
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    output.TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat2.w = 0.0;
    output.TEXCOORD2 = u_xlat2.wwwx;
    output.TEXCOORD3 = u_xlat2.wwwy;
    output.TEXCOORD4.w = u_xlat2.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD4.xyz = float3(u_xlat10) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * VGlobals._ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * float3(0.5, 0.5, 0.5);
    output.TEXCOORD7.zw = u_xlat0.zw;
    output.TEXCOORD7.xy = u_xlat1.zz + u_xlat1.xw;
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_ShadowMapTexture" to slot 1 sampler slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 2 sampler slot 0

Constant Buffer "FGlobals" (280 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 64
  Matrix4x4 unity_ProbeVolumeWorldToObject at 144
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 unity_OcclusionMaskSelector at 16
  Vector4 _LightShadowData at 32
  Vector4 unity_ShadowFadeCenterAndType at 48
  Vector4 unity_ProbeVolumeParams at 128
  Vector3 unity_ProbeVolumeSizeInv at 208
  Vector3 unity_ProbeVolumeMin at 224
  Vector4 _LightColor0 at 240
  Vector4 _Color at 256
  Float _Metallic at 272
  Float _Glossiness at 276
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 unity_OcclusionMaskSelector;
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    sampler sampler_ShadowMapTexture [[ sampler (2) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _ShadowMapTexture [[ texture(1) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(2) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    float3 u_xlat5;
    float3 u_xlat6;
    float u_xlat9;
    float u_xlat10;
    float u_xlat16;
    float u_xlat17;
    float u_xlat21;
    float u_xlat22;
    bool u_xlatb22;
    float u_xlat23;
    bool u_xlatb23;
    float u_xlat24;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat21 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat2.xyz = float3(u_xlat21) * input.TEXCOORD4.xyz;
    u_xlat21 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat3.xyz = float3(u_xlat21) * input.TEXCOORD1.xyz;
    u_xlat4.xyz = (-input.TEXCOORD5.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat5.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat22 = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat4.xyz = input.TEXCOORD5.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat23 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat23 = sqrt(u_xlat23);
    u_xlat23 = (-u_xlat22) + u_xlat23;
    u_xlat22 = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat23, u_xlat22);
    u_xlat22 = fma(u_xlat22, FGlobals._LightShadowData.z, FGlobals._LightShadowData.w);
    u_xlat22 = clamp(u_xlat22, 0.0f, 1.0f);
    u_xlatb23 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb23){
        u_xlatb23 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD5.xxx, u_xlat4.xyz);
        u_xlat4.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD5.zzz, u_xlat4.xyz);
        u_xlat4.xyz = u_xlat4.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb23)) ? u_xlat4.xyz : input.TEXCOORD5.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat4.yzw = u_xlat4.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat23 = fma(u_xlat4.y, 0.25, 0.75);
        u_xlat24 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat4.x = max(u_xlat23, u_xlat24);
        u_xlat4 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat23 = dot(u_xlat4, FGlobals.unity_OcclusionMaskSelector);
    u_xlat23 = clamp(u_xlat23, 0.0f, 1.0f);
    u_xlat4.xy = input.TEXCOORD7.xy / input.TEXCOORD7.ww;
    u_xlat24 = _ShadowMapTexture.sample(sampler_ShadowMapTexture, u_xlat4.xy).x;
    u_xlat23 = u_xlat23 + (-u_xlat24);
    u_xlat22 = fma(u_xlat22, u_xlat23, u_xlat24);
    u_xlat4.xyz = float3(u_xlat22) * FGlobals._LightColor0.xyz;
    u_xlat22 = (-FGlobals._Glossiness) + 1.0;
    u_xlat5.x = input.TEXCOORD2.w;
    u_xlat5.y = input.TEXCOORD3.w;
    u_xlat5.z = input.TEXCOORD4.w;
    u_xlat6.xyz = fma((-input.TEXCOORD1.xyz), float3(u_xlat21), u_xlat5.xyz);
    u_xlat21 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat6.xyz = float3(u_xlat21) * u_xlat6.xyz;
    u_xlat21 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat23 = clamp(u_xlat23, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat9 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0f, 1.0f);
    u_xlat16 = u_xlat9 * u_xlat9;
    u_xlat16 = dot(float2(u_xlat16), float2(u_xlat22));
    u_xlat16 = u_xlat16 + -0.5;
    u_xlat3.x = (-u_xlat23) + 1.0;
    u_xlat10 = u_xlat3.x * u_xlat3.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat3.x = u_xlat3.x * u_xlat10;
    u_xlat3.x = fma(u_xlat16, u_xlat3.x, 1.0);
    u_xlat10 = -abs(u_xlat21) + 1.0;
    u_xlat17 = u_xlat10 * u_xlat10;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat10 = u_xlat10 * u_xlat17;
    u_xlat16 = fma(u_xlat16, u_xlat10, 1.0);
    u_xlat16 = u_xlat16 * u_xlat3.x;
    u_xlat16 = u_xlat23 * u_xlat16;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = max(u_xlat22, 0.00200000009);
    u_xlat3.x = (-u_xlat22) + 1.0;
    u_xlat10 = fma(abs(u_xlat21), u_xlat3.x, u_xlat22);
    u_xlat3.x = fma(u_xlat23, u_xlat3.x, u_xlat22);
    u_xlat21 = abs(u_xlat21) * u_xlat3.x;
    u_xlat21 = fma(u_xlat23, u_xlat10, u_xlat21);
    u_xlat21 = u_xlat21 + 9.99999975e-06;
    u_xlat21 = 0.5 / u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat3.x = fma(u_xlat2.x, u_xlat22, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat3.x, u_xlat2.x, 1.0);
    u_xlat22 = u_xlat22 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat22 = u_xlat22 / u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = u_xlat23 * u_xlat21;
    u_xlat21 = u_xlat21 * 3.14159274;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb22 = u_xlat22!=0.0;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat2.xzw = float3(u_xlat16) * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat4.xyz * float3(u_xlat21);
    u_xlat21 = (-u_xlat9) + 1.0;
    u_xlat22 = u_xlat21 * u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat0.xyz = fma(u_xlat4.xyz, float3(u_xlat21), u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    output.SV_Target0.xyz = fma(u_xlat1.xyz, u_xlat2.xzw, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: DIRECTIONAL_COOKIE SHADOWS_SCREEN
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (352 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 48
  Matrix4x4 unity_WorldToObject at 112
  Matrix4x4 unity_MatrixVP at 176
  Matrix4x4 unity_WorldToLight at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _ProjectionParams at 16
  Vector4 _WorldSpaceLightPos0 at 32
  Vector4 _MainTex_ST at 240
  Vector4 _DetailAlbedoMap_ST at 256
  Float _UVSec at 272
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _ProjectionParams;
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float2 TEXCOORD6 [[ user(TEXCOORD6) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    bool u_xlatb2;
    float4 u_xlat3;
    float u_xlat14;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat0);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.mtl_Position = u_xlat1;
    u_xlatb2 = VGlobals._UVSec==0.0;
    u_xlat2.xy = (bool(u_xlatb2)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat2.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat2.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat2.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat2.xyz);
    u_xlat2.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat2.xyz);
    u_xlat2.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat2.xyz);
    output.TEXCOORD1.xyz = u_xlat2.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    output.TEXCOORD1.w = 0.0;
    u_xlat3.xyz = fma((-u_xlat2.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    output.TEXCOORD5.xyz = u_xlat2.xyz;
    u_xlat3.w = 0.0;
    output.TEXCOORD2 = u_xlat3.wwwx;
    output.TEXCOORD3 = u_xlat3.wwwy;
    output.TEXCOORD4.w = u_xlat3.z;
    u_xlat2.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat14 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat14 = rsqrt(u_xlat14);
    output.TEXCOORD4.xyz = float3(u_xlat14) * u_xlat2.xyz;
    u_xlat2.xy = u_xlat0.yy * VGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat0.xy = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xy, u_xlat0.xx, u_xlat2.xy);
    u_xlat0.xy = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xy, u_xlat0.zz, u_xlat0.xy);
    output.TEXCOORD6.xy = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xy, u_xlat0.ww, u_xlat0.xy);
    u_xlat0.x = u_xlat1.y * VGlobals._ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * float2(0.5, 0.5);
    output.TEXCOORD7.zw = u_xlat1.zw;
    output.TEXCOORD7.xy = u_xlat0.zz + u_xlat0.xw;
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 2D Texture "_ShadowMapTexture" to slot 1 sampler slot 2
Set 2D Texture "_LightTexture0" to slot 2 sampler slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0

Constant Buffer "FGlobals" (352 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 64
  Matrix4x4 unity_ProbeVolumeWorldToObject at 144
  Matrix4x4 unity_WorldToLight at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 unity_OcclusionMaskSelector at 16
  Vector4 _LightShadowData at 32
  Vector4 unity_ShadowFadeCenterAndType at 48
  Vector4 unity_ProbeVolumeParams at 128
  Vector3 unity_ProbeVolumeSizeInv at 208
  Vector3 unity_ProbeVolumeMin at 224
  Vector4 _LightColor0 at 240
  Vector4 _Color at 256
  Float _Metallic at 272
  Float _Glossiness at 276
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 unity_OcclusionMaskSelector;
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    sampler sampler_ShadowMapTexture [[ sampler (2) ]],
    sampler sampler_LightTexture0 [[ sampler (3) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _ShadowMapTexture [[ texture(1) ]] ,
    texture2d<float, access::sample > _LightTexture0 [[ texture(2) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture(3) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float4 u_xlat2;
    float3 u_xlat3;
    float3 u_xlat4;
    float4 u_xlat5;
    float3 u_xlat6;
    float u_xlat9;
    float u_xlat10;
    float u_xlat16;
    float u_xlat17;
    float2 u_xlat18;
    float u_xlat21;
    float u_xlat22;
    bool u_xlatb22;
    float u_xlat23;
    bool u_xlatb23;
    float u_xlat24;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    u_xlat0.xyz = fma(FGlobals._Color.xyz, u_xlat0.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat0.xyz = fma(float3(FGlobals._Metallic), u_xlat0.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat21 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = float3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat2.xyz = float3(u_xlat21) * input.TEXCOORD4.xyz;
    u_xlat21 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat3.xyz = float3(u_xlat21) * input.TEXCOORD1.xyz;
    u_xlat4.xy = input.TEXCOORD5.yy * FGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat4.xy = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xy, input.TEXCOORD5.xx, u_xlat4.xy);
    u_xlat4.xy = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xy, input.TEXCOORD5.zz, u_xlat4.xy);
    u_xlat4.xy = u_xlat4.xy + FGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat5.xyz = (-input.TEXCOORD5.xyz) + FGlobals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat6.x = FGlobals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat6.y = FGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat6.z = FGlobals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat22 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat5.xyz = input.TEXCOORD5.xyz + (-FGlobals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat23 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat23 = sqrt(u_xlat23);
    u_xlat23 = (-u_xlat22) + u_xlat23;
    u_xlat22 = fma(FGlobals.unity_ShadowFadeCenterAndType.w, u_xlat23, u_xlat22);
    u_xlat22 = fma(u_xlat22, FGlobals._LightShadowData.z, FGlobals._LightShadowData.w);
    u_xlat22 = clamp(u_xlat22, 0.0f, 1.0f);
    u_xlatb23 = FGlobals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb23){
        u_xlatb23 = FGlobals.unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD5.xxx, u_xlat5.xyz);
        u_xlat5.xyz = fma(FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD5.zzz, u_xlat5.xyz);
        u_xlat5.xyz = u_xlat5.xyz + FGlobals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb23)) ? u_xlat5.xyz : input.TEXCOORD5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-FGlobals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat5.yzw = u_xlat5.xyz * FGlobals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat23 = fma(u_xlat5.y, 0.25, 0.75);
        u_xlat24 = fma(FGlobals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat5.x = max(u_xlat23, u_xlat24);
        u_xlat5 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat23 = dot(u_xlat5, FGlobals.unity_OcclusionMaskSelector);
    u_xlat23 = clamp(u_xlat23, 0.0f, 1.0f);
    u_xlat18.xy = input.TEXCOORD7.xy / input.TEXCOORD7.ww;
    u_xlat24 = _ShadowMapTexture.sample(sampler_ShadowMapTexture, u_xlat18.xy).x;
    u_xlat23 = u_xlat23 + (-u_xlat24);
    u_xlat22 = fma(u_xlat22, u_xlat23, u_xlat24);
    u_xlat23 = _LightTexture0.sample(sampler_LightTexture0, u_xlat4.xy).w;
    u_xlat22 = u_xlat22 * u_xlat23;
    u_xlat4.xyz = float3(u_xlat22) * FGlobals._LightColor0.xyz;
    u_xlat22 = (-FGlobals._Glossiness) + 1.0;
    u_xlat5.x = input.TEXCOORD2.w;
    u_xlat5.y = input.TEXCOORD3.w;
    u_xlat5.z = input.TEXCOORD4.w;
    u_xlat6.xyz = fma((-input.TEXCOORD1.xyz), float3(u_xlat21), u_xlat5.xyz);
    u_xlat21 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat6.xyz = float3(u_xlat21) * u_xlat6.xyz;
    u_xlat21 = dot(u_xlat2.xyz, (-u_xlat3.xyz));
    u_xlat23 = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat23 = clamp(u_xlat23, 0.0f, 1.0f);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat6.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat9 = dot(u_xlat5.xyz, u_xlat6.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0f, 1.0f);
    u_xlat16 = u_xlat9 * u_xlat9;
    u_xlat16 = dot(float2(u_xlat16), float2(u_xlat22));
    u_xlat16 = u_xlat16 + -0.5;
    u_xlat3.x = (-u_xlat23) + 1.0;
    u_xlat10 = u_xlat3.x * u_xlat3.x;
    u_xlat10 = u_xlat10 * u_xlat10;
    u_xlat3.x = u_xlat3.x * u_xlat10;
    u_xlat3.x = fma(u_xlat16, u_xlat3.x, 1.0);
    u_xlat10 = -abs(u_xlat21) + 1.0;
    u_xlat17 = u_xlat10 * u_xlat10;
    u_xlat17 = u_xlat17 * u_xlat17;
    u_xlat10 = u_xlat10 * u_xlat17;
    u_xlat16 = fma(u_xlat16, u_xlat10, 1.0);
    u_xlat16 = u_xlat16 * u_xlat3.x;
    u_xlat16 = u_xlat23 * u_xlat16;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat22 = max(u_xlat22, 0.00200000009);
    u_xlat3.x = (-u_xlat22) + 1.0;
    u_xlat10 = fma(abs(u_xlat21), u_xlat3.x, u_xlat22);
    u_xlat3.x = fma(u_xlat23, u_xlat3.x, u_xlat22);
    u_xlat21 = abs(u_xlat21) * u_xlat3.x;
    u_xlat21 = fma(u_xlat23, u_xlat10, u_xlat21);
    u_xlat21 = u_xlat21 + 9.99999975e-06;
    u_xlat21 = 0.5 / u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat3.x = fma(u_xlat2.x, u_xlat22, (-u_xlat2.x));
    u_xlat2.x = fma(u_xlat3.x, u_xlat2.x, 1.0);
    u_xlat22 = u_xlat22 * 0.318309873;
    u_xlat2.x = fma(u_xlat2.x, u_xlat2.x, 1.00000001e-07);
    u_xlat22 = u_xlat22 / u_xlat2.x;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat21 = u_xlat23 * u_xlat21;
    u_xlat21 = u_xlat21 * 3.14159274;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat22 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlatb22 = u_xlat22!=0.0;
    u_xlat22 = u_xlatb22 ? 1.0 : float(0.0);
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat2.xzw = float3(u_xlat16) * u_xlat4.xyz;
    u_xlat3.xyz = u_xlat4.xyz * float3(u_xlat21);
    u_xlat21 = (-u_xlat9) + 1.0;
    u_xlat22 = u_xlat21 * u_xlat21;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat22;
    u_xlat4.xyz = (-u_xlat0.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat0.xyz = fma(u_xlat4.xyz, float3(u_xlat21), u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat3.xyz;
    output.SV_Target0.xyz = fma(u_xlat1.xyz, u_xlat2.xzw, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: POINT SHADOWS_CUBE
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (336 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Matrix4x4 unity_WorldToLight at 272
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 _MainTex_ST at 224
  Vector4 _DetailAlbedoMap_ST at 240
  Float _UVSec at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float3 TEXCOORD6 [[ user(TEXCOORD6) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float4 u_xlat2;
    float u_xlat10;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat0);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat2.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD1.xyz = float3(u_xlat10) * u_xlat2.xyz;
    output.TEXCOORD1.w = 0.0;
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    output.TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.w = 0.0;
    output.TEXCOORD2 = u_xlat1.wwwx;
    output.TEXCOORD3 = u_xlat1.wwwy;
    output.TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD4.xyz = float3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * VGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, u_xlat0.xxx, u_xlat1.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, u_xlat0.zzz, u_xlat1.xyz);
    output.TEXCOORD6.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xyz, u_xlat0.www, u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTexture0" to slot 1 sampler slot 3
Set 2D Texture "unity_NHxRoughness" to slot 2 sampler slot 0
Set CUBE Texture "_ShadowMapTexture" to slot 3 sampler slot 1

Constant Buffer "FGlobals" (160 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 96
  Vector4 _LightPositionRange at 0
  Vector4 _LightProjectionParams at 16
  Vector4 _LightShadowData at 32
  Vector4 _LightColor0 at 48
  Vector4 _Color at 64
  Float _Metallic at 80
  Float _Glossiness at 84
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 _LightPositionRange;
    float4 _LightProjectionParams;
    float4 _LightShadowData;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_NHxRoughness [[ sampler (0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    sampler sampler_LightTexture0 [[ sampler (3) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _LightTexture0 [[ texture(1) ]] ,
    texture2d<float, access::sample > unity_NHxRoughness [[ texture(2) ]] ,
    depthcube<float, access::sample > _ShadowMapTexture [[ texture(3) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float3 u_xlat3;
    float u_xlat9;
    u_xlat0.xyz = input.TEXCOORD5.xyz + (-FGlobals._LightPositionRange.xyz);
    u_xlat9 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat9 = max(abs(u_xlat0.z), u_xlat9);
    u_xlat9 = u_xlat9 + (-FGlobals._LightProjectionParams.z);
    u_xlat9 = max(u_xlat9, 9.99999975e-06);
    u_xlat9 = u_xlat9 * FGlobals._LightProjectionParams.w;
    u_xlat9 = FGlobals._LightProjectionParams.y / u_xlat9;
    u_xlat9 = u_xlat9 + (-FGlobals._LightProjectionParams.x);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat0.x = _ShadowMapTexture.sample_compare(sampler_ShadowMapTexture, u_xlat0.xyz, saturate(u_xlat9), level(0.0));
    u_xlat3.x = (-FGlobals._LightShadowData.x) + 1.0;
    u_xlat0.x = fma(u_xlat0.x, u_xlat3.x, FGlobals._LightShadowData.x);
    u_xlat3.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat3.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, input.TEXCOORD5.xxx, u_xlat3.xyz);
    u_xlat3.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, input.TEXCOORD5.zzz, u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz + FGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat3.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat3.x = _LightTexture0.sample(sampler_LightTexture0, u_xlat3.xx).x;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat0.xyz = u_xlat0.xxx * FGlobals._LightColor0.xyz;
    u_xlat9 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat1.xyz = float3(u_xlat9) * input.TEXCOORD4.xyz;
    u_xlat2.x = input.TEXCOORD2.w;
    u_xlat2.y = input.TEXCOORD3.w;
    u_xlat2.z = input.TEXCOORD4.w;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0f, 1.0f);
    u_xlat0.xyz = float3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-input.TEXCOORD1.xyz), u_xlat1.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = fma(u_xlat1.xyz, (-float3(u_xlat9)), (-input.TEXCOORD1.xyz));
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat9 * u_xlat9;
    u_xlat1.y = (-FGlobals._Glossiness) + 1.0;
    u_xlat9 = unity_NHxRoughness.sample(samplerunity_NHxRoughness, u_xlat1.xy).x;
    u_xlat9 = u_xlat9 * 16.0;
    u_xlat1.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat2.xyz = fma(FGlobals._Color.xyz, u_xlat1.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat1.xyz = u_xlat1.xyz * FGlobals._Color.xyz;
    u_xlat2.xyz = fma(float3(FGlobals._Metallic), u_xlat2.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat2.xyz = float3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(u_xlat9), u_xlat2.xyz);
    output.SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: POINT_COOKIE SHADOWS_CUBE
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "TexCoord0"
Uses vertex data channel "TexCoord1"

Constant Buffer "VGlobals" (336 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Matrix4x4 unity_WorldToLight at 272
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 _MainTex_ST at 224
  Vector4 _DetailAlbedoMap_ST at 240
  Float _UVSec at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
    float4 _DetailAlbedoMap_ST;
    float _UVSec;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
    float2 TEXCOORD1 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]];
    float3 TEXCOORD6 [[ user(TEXCOORD6) ]];
    float4 TEXCOORD7 [[ user(TEXCOORD7) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float4 u_xlat2;
    float u_xlat10;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat0);
    u_xlat2 = u_xlat1.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    u_xlatb1 = VGlobals._UVSec==0.0;
    u_xlat1.xy = (bool(u_xlatb1)) ? input.TEXCOORD0.xy : input.TEXCOORD1.xy;
    output.TEXCOORD0.zw = fma(u_xlat1.xy, VGlobals._DetailAlbedoMap_ST.xy, VGlobals._DetailAlbedoMap_ST.zw);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat1.xyz = input.POSITION0.yyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0].xyz, input.POSITION0.xxx, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2].xyz, input.POSITION0.zzz, u_xlat1.xyz);
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat1.xyz);
    u_xlat2.xyz = u_xlat1.xyz + (-VGlobals._WorldSpaceCameraPos.xyzx.xyz);
    u_xlat10 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD1.xyz = float3(u_xlat10) * u_xlat2.xyz;
    output.TEXCOORD1.w = 0.0;
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    output.TEXCOORD5.xyz = u_xlat1.xyz;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat1.x = rsqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat2.xyz;
    u_xlat1.w = 0.0;
    output.TEXCOORD2 = u_xlat1.wwwx;
    output.TEXCOORD3 = u_xlat1.wwwy;
    output.TEXCOORD4.w = u_xlat1.z;
    u_xlat1.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    output.TEXCOORD4.xyz = float3(u_xlat10) * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yyy * VGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat1.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, u_xlat0.xxx, u_xlat1.xyz);
    u_xlat0.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, u_xlat0.zzz, u_xlat1.xyz);
    output.TEXCOORD6.xyz = fma(VGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xyz, u_xlat0.www, u_xlat0.xyz);
    output.TEXCOORD7 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTextureB0" to slot 1 sampler slot 4
Set CUBE Texture "_LightTexture0" to slot 2 sampler slot 3
Set 2D Texture "unity_NHxRoughness" to slot 3 sampler slot 0
Set CUBE Texture "_ShadowMapTexture" to slot 4 sampler slot 1

Constant Buffer "FGlobals" (160 bytes) on slot 0 {
  Matrix4x4 unity_WorldToLight at 96
  Vector4 _LightPositionRange at 0
  Vector4 _LightProjectionParams at 16
  Vector4 _LightShadowData at 32
  Vector4 _LightColor0 at 48
  Vector4 _Color at 64
  Float _Metallic at 80
  Float _Glossiness at 84
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 _LightPositionRange;
    float4 _LightProjectionParams;
    float4 _LightShadowData;
    float4 _LightColor0;
    float4 _Color;
    float _Metallic;
    float _Glossiness;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
};

struct Mtl_FragmentIn
{
    float4 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float4 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler samplerunity_NHxRoughness [[ sampler (0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    sampler sampler_LightTexture0 [[ sampler (3) ]],
    sampler sampler_LightTextureB0 [[ sampler (4) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture2d<float, access::sample > _LightTextureB0 [[ texture(1) ]] ,
    texturecube<float, access::sample > _LightTexture0 [[ texture(2) ]] ,
    texture2d<float, access::sample > unity_NHxRoughness [[ texture(3) ]] ,
    depthcube<float, access::sample > _ShadowMapTexture [[ texture(4) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float3 u_xlat3;
    float u_xlat6;
    float u_xlat9;
    u_xlat0.xyz = input.TEXCOORD5.xyz + (-FGlobals._LightPositionRange.xyz);
    u_xlat9 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat9 = max(abs(u_xlat0.z), u_xlat9);
    u_xlat9 = u_xlat9 + (-FGlobals._LightProjectionParams.z);
    u_xlat9 = max(u_xlat9, 9.99999975e-06);
    u_xlat9 = u_xlat9 * FGlobals._LightProjectionParams.w;
    u_xlat9 = FGlobals._LightProjectionParams.y / u_xlat9;
    u_xlat9 = u_xlat9 + (-FGlobals._LightProjectionParams.x);
    u_xlat9 = (-u_xlat9) + 1.0;
    u_xlat0.x = _ShadowMapTexture.sample_compare(sampler_ShadowMapTexture, u_xlat0.xyz, saturate(u_xlat9), level(0.0));
    u_xlat3.x = (-FGlobals._LightShadowData.x) + 1.0;
    u_xlat0.x = fma(u_xlat0.x, u_xlat3.x, FGlobals._LightShadowData.x);
    u_xlat3.xyz = input.TEXCOORD5.yyy * FGlobals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat3.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, input.TEXCOORD5.xxx, u_xlat3.xyz);
    u_xlat3.xyz = fma(FGlobals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, input.TEXCOORD5.zzz, u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz + FGlobals.hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat3.x = _LightTexture0.sample(sampler_LightTexture0, u_xlat3.xyz).w;
    u_xlat6 = _LightTextureB0.sample(sampler_LightTextureB0, u_xlat1.xx).x;
    u_xlat3.x = u_xlat3.x * u_xlat6;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat0.xyz = u_xlat0.xxx * FGlobals._LightColor0.xyz;
    u_xlat9 = dot(input.TEXCOORD4.xyz, input.TEXCOORD4.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat1.xyz = float3(u_xlat9) * input.TEXCOORD4.xyz;
    u_xlat2.x = input.TEXCOORD2.w;
    u_xlat2.y = input.TEXCOORD3.w;
    u_xlat2.z = input.TEXCOORD4.w;
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0f, 1.0f);
    u_xlat0.xyz = float3(u_xlat9) * u_xlat0.xyz;
    u_xlat9 = dot((-input.TEXCOORD1.xyz), u_xlat1.xyz);
    u_xlat9 = u_xlat9 + u_xlat9;
    u_xlat1.xyz = fma(u_xlat1.xyz, (-float3(u_xlat9)), (-input.TEXCOORD1.xyz));
    u_xlat9 = dot(u_xlat1.xyz, u_xlat2.xyz);
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat9 * u_xlat9;
    u_xlat1.y = (-FGlobals._Glossiness) + 1.0;
    u_xlat9 = unity_NHxRoughness.sample(samplerunity_NHxRoughness, u_xlat1.xy).x;
    u_xlat9 = u_xlat9 * 16.0;
    u_xlat1.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat2.xyz = fma(FGlobals._Color.xyz, u_xlat1.xyz, float3(-0.0399999991, -0.0399999991, -0.0399999991));
    u_xlat1.xyz = u_xlat1.xyz * FGlobals._Color.xyz;
    u_xlat2.xyz = fma(float3(FGlobals._Metallic), u_xlat2.xyz, float3(0.0399999991, 0.0399999991, 0.0399999991));
    u_xlat2.xyz = float3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = fma((-FGlobals._Metallic), 0.959999979, 0.959999979);
    u_xlat1.xyz = fma(u_xlat1.xyz, float3(u_xlat9), u_xlat2.xyz);
    output.SV_Target0.xyz = u_xlat0.xyz * u_xlat1.xyz;
    output.SV_Target0.w = 1.0;
    return output;
}


 }
 Pass {
  Name "ShadowCaster"
  Tags { "LIGHTMODE"="SHADOWCASTER" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PerformanceChecks"="False" }
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords: SHADOWS_DEPTH
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"

Constant Buffer "VGlobals" (224 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_LightShadowBias at 16
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 unity_LightShadowBias;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float u_xlat6;
    float u_xlat9;
    bool u_xlatb9;
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat0.xyz = float3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat1);
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat2.xyz = float3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = fma((-u_xlat9), u_xlat9, 1.0);
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * VGlobals.unity_LightShadowBias.z;
    u_xlat0.xyz = fma((-u_xlat0.xyz), float3(u_xlat9), u_xlat1.xyz);
    u_xlatb9 = VGlobals.unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat2);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat2);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    u_xlat1.x = VGlobals.unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = min(u_xlat1.x, 0.0);
    u_xlat1.x = max(u_xlat1.x, -1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.w, u_xlat6);
    output.mtl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    output.mtl_Position.z = fma(VGlobals.unity_LightShadowBias.y, u_xlat0.x, u_xlat6);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
)
{
    Mtl_FragmentOut output;
    output.SV_Target0 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: SHADOWS_CUBE
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"

Constant Buffer "VGlobals" (224 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_LightShadowBias at 16
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 unity_LightShadowBias;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float u_xlat9;
    bool u_xlatb9;
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat0.xyz = float3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat1);
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat2.xyz = float3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = fma((-u_xlat9), u_xlat9, 1.0);
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * VGlobals.unity_LightShadowBias.z;
    u_xlat0.xyz = fma((-u_xlat0.xyz), float3(u_xlat9), u_xlat1.xyz);
    u_xlatb9 = VGlobals.unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat2);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat2);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    u_xlat1.x = min(u_xlat0.w, u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    output.mtl_Position.z = fma(VGlobals.unity_LightShadowBias.y, u_xlat1.x, u_xlat0.z);
    output.mtl_Position.xyw = u_xlat0.xyw;
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
)
{
    Mtl_FragmentOut output;
    output.SV_Target0 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


 }
}
CustomEditor "StandardShaderGUI"
Fallback "VertexLit"
}