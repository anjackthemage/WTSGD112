var sprite = argument[0];       // Not sure if the script inherits "self" reference, so pass the sprite directly
var start_x = argument[1];      //
var start_y = argument[2];      //
var s_width = argument[3];      // In case the visible pixels aren't the same size as the sprite (I'm looking at you, saw sprite)
var s_height = argument[4];     //

var rotated = 0;
// If the object's "base" is at a different angle, we need to skew the shadow differently (slightly)
if(argument_count == 6 and argument[5])
{
    rotated = 1;
}

// Blech, arbitrary numbers :(
var shadow_angle = 20;

var transform_x = lengthdir_x(s_height, shadow_angle - 90); // Delta x
var transform_y = lengthdir_y(s_height, shadow_angle - 90); // Delta y

var shadow_x = start_x - transform_x;                       // Start the shadow to the left (-x) of the image
var shadow_y = start_y - (s_height - transform_y);          // Start the shadow slightly above (-y) the image

var shadow_tex_sampler =  shader_get_sampler_index(shader_shadow, "shadow_texture");

var shadow_sprite = sprite_get_texture(sprite, 0); // Convert sprite to a texture we can pass to the shader

shader_set(shader_shadow);                                  // My custom shader :D - Just draws black pixels in place of the sprite

texture_set_stage(shadow_tex_sampler, shadow_sprite);  // So we can draw the correct "sub-image"

var ualpha = shader_get_uniform(shader_shadow, "alpha");    // This value is subtracted from the alpha of each pixel in the sprite
shader_set_uniform_f(ualpha, 0.5);                          // We'll make the shadow 50% transparent, for now

// This will skew the shadow so that the base of the shadow sprite and the base of the regular sprite will be the same, but the top of the
// shadow sprite will be slightly above and to the left of the regular sprite. I think this is a good approximation of a shadow.
if(sprite != undefined)
{
    if(rotated == 1)
    {
        draw_sprite_pos(sprite, 0, shadow_x, shadow_y, start_x + s_width, start_y, start_x + s_width, start_y + s_height, start_x, start_y + s_height, 1);
    }
    else
    {
        draw_sprite_pos(sprite, 0, shadow_x - 3, shadow_y - 3, shadow_x + s_width, shadow_y, start_x + s_width, start_y + s_height, start_x, start_y + s_height, 1);
    }
}
else
{
    show_debug_message("Missing sprite!!!");
}
// For dynamic shadows, we'd want to designate a ligth source object in the room and calculate the angle based off of that.
// For these purposes, we can go with a sun-like light source (very big, very far away). This means the shadow angle won't
// noticeably change, so we can use a static parallelogram (rhomboid, in this case).

shader_reset(); //Shut down the shader, otherwise everything would be drawn solid black
