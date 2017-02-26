// Script to spawn an enemy and set it on a path

/**
    Arguments:
                0   -   x coord of new object
                1   -   y coord of new object
                2   -   object id
                3   -   direction of new object
**/

// Set variables
var new_x = argument[0];
var new_y = argument[1];
var new_object = instance_create(new_x, new_y, argument[2]);
var obj_dir = argument[3];

var new_path = null;

// 0 to start at the beginning (as opposed to 1, which is the end)
var new_path_position = 0;
// Same speed as normal spawn (-ish, don't think about vector math)
var new_path_speed = new_object.speed;

// List of available paths
var path_list = ds_list_create();
ds_list_add(path_list, path_left_curve_right, path_right_curve_left, path_top_curve_right, path_top_curve_left);

// If caller specified a path, use that
if(argument_count > 4)
{
    new_path = argument[4];
}
else    // Otherwise, use our own
{    
    // determine path based on direction
    switch(obj_dir)
    {
        case 0:
            new_path = 0;
            new_object.x = path_get_point_x(path_list[| new_path], 0);
            break;
        case 90:
            new_path = choose(2, 3);
            new_path_position = 1;
            new_path_speed = -1 * new_path_speed;
            new_object.y = path_get_point_y(path_list[| new_path], 1);
            break;
        case 180:
            new_path = 1;
            new_object.x = path_get_point_x(path_list[| new_path], 0);
            break;
        default:
            new_path = choose(2, 3);
            new_object.y = path_get_point_y(path_list[| new_path], 0);
            break;
    }
}
// DO IT!
with(new_object)
{
    path_start(path_list[| new_path], new_path_speed, path_action_stop, false);
}
