/// draw_text_outlined_ext(x, y, string, sep, max_w, outline_color, outline_w)
/** Arguments:
        0   -   x coordinate
        1   -   y coordinate
        2   -   string to draw
        3   -   separation distance between lines
        4   -   maximum width (pixels) before line break
        5   -   outline color
        6   -   outline width (pixels)
**/

// Variables
var outline_step = 10; // higher number = lower-quality outline
var prev_color = draw_get_color();

draw_set_color(argument[5]);

// To fake an outline, we'll just draw the text over and over again,
// each time at a slightly different position.
for(var outline_direction  = 0; outline_direction < 360; outline_direction += outline_step)
{
    draw_text_ext(argument[0] + lengthdir_x(argument[6], outline_direction), argument[1] + lengthdir_y(argument[6], outline_direction), argument[2], argument[3], argument[4]);
}
// Leave things as we found them
draw_set_color(prev_color);
// Finally, draw the text at the preferred position (and color)
draw_text_ext(argument[0], argument[1], argument[2], argument[3], argument[4]);
