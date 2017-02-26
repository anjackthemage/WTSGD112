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
var new_path_position = 0;
var new_path_speed = new_object.speed;
show_debug_message(new_path_speed);
var new_path = null;

// determine path based on direction
switch(obj_dir)
{
    case 0:
        new_path = path_left_curve_right;
        new_object.y = path_get_point_y(new_path, 0);
        break;
    case 90:
        new_path = choose(path_top_curve_right, path_top_curve_left);
        new_path_position = 1;
        new_path_speed = -1 * new_path_speed;
        new_object.x = path_get_point_x(new_path, 1);
        break;
    case 180:
        new_path = path_right_curve_left;
        new_object.y = path_get_point_y(new_path, 0);
        break;
    default:
        new_path = choose(path_top_curve_right, path_top_curve_left);
        new_object.x = path_get_point_x(new_path, 0);
        break;
}

with(new_object)
{
    path_start(new_path, new_path_speed, path_action_stop, false);
}
