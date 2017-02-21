// Only way I could think to arbitrarily copy a sub-image without creating a new object

/** Arguments:
        0   -   The sprite contiaining the sub-image we want
        1   -   The index of the sub-image
**/
var sprite_to_poll = argument[0];
var sprite_sub_image = argument[1];

var return_sprite = undefined;
// Create a temporary surface, for drawing the sprite
var new_surface = surface_create(sprite_get_width(sprite_to_poll), sprite_get_height(sprite_to_poll));
// Surfaces are volatile, so be sure it's still there
if(surface_exists(new_surface))
{
    // Set engine to draw to the new surface, instead of the default "application surface"
    surface_set_target(new_surface);
    // Clear the surface so we don't get extra graphical garbage
    draw_clear_alpha(c_black, 0);
    
    draw_sprite(sprite_to_poll, sprite_sub_image, 0, 0);
    // Create a new sprite from the drawn image
    var new_sprite = sprite_create_from_surface(new_surface, 0, 0, sprite_get_width(sprite_to_poll), sprite_get_height(sprite_to_poll), false, false, 0, 0);
    // This isn't really necessary
    return_sprite = new_sprite;
    // Clean up and destroy the surface, so we don't waste memory
    surface_reset_target();
    surface_free(new_surface);
}

return return_sprite;
