var sprite_to_poll = argument[0];
var sprite_sub_image = argument[1];

var return_sprite = undefined;

var new_surface = surface_create(sprite_get_width(sprite_to_poll), sprite_get_height(sprite_to_poll));
    
if(surface_exists(new_surface))
{
    surface_set_target(new_surface);
    draw_clear_alpha(c_black, 0);
    draw_sprite(sprite_to_poll, sprite_sub_image, 0, 0);
    var new_sprite = sprite_create_from_surface(new_surface, 0, 0, sprite_get_width(sprite_to_poll), sprite_get_height(sprite_to_poll), false, false, 0, 0);
    if(new_sprite != undefined)
    {
        return_sprite = new_sprite;
    }
    surface_reset_target();
    surface_free(new_surface);
}

return return_sprite;
