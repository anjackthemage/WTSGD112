//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
//attribute vec4 in_Colour;                    // (r,g,b,a) unused in this shader.
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
//varying vec4 v_vColour;                                   unused in this shader.

void main()
{
    // Default code for passthrough
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    //v_vColour = in_Colour;                                unused in this shader.
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
//varying vec4 v_vColour;
uniform float alpha;
uniform sampler2D shadow_texture;

void main()
{   // The original color, so we can properly apply alpha blending
    vec4 OriginalColor = texture2D(shadow_texture, v_vTexcoord);
    // Now set RGB to 0 (black) and modify the alpha by our input variable.
    vec4 all_black = vec4(0.0, 0.0, 0.0, OriginalColor.a - alpha);
    
    // Send it up the pipeline.
    gl_FragColor = all_black;
}

