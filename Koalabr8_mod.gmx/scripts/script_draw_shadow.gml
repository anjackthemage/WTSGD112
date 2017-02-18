var sprite = argument[0];
var start_x = argument[1];
var start_y = argument[2];
var shadow_angle = argument[3];

var s_height = sprite_get_height(sprite);
var s_width = sprite_get_width(sprite);

var transform_x = lengthdir_x(s_height, shadow_angle - 90);
var transform_y = lengthdir_y(s_height, shadow_angle - 90);

var shadow_x = x - transform_x;
var shadow_y = y - (s_height - transform_y);

shader_set(shader_shadow);
ualpha = shader_get_uniform(shader_shadow, "alpha");
shader_set_uniform_f(ualpha, 0.5);
draw_sprite_pos(sprite, 0, shadow_x, shadow_y, shadow_x + s_width, shadow_y - (s_height - transform_y), start_x + s_width, start_y + s_height, start_x, start_y + s_height, 1);
//draw_sprite_ext(sprite, 0, shadow_x, shadow_y, 0.9, 0.9, 10, c_white, 1);
shader_reset();
