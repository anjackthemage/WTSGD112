// This script will step through each box in a line and check the change in type (delta)
// between each box. Depending on the result, the script will either recursively call itself
// or return a list of the deltas it has accrued.

// Usage: linear_box_check(object, list_1[], list_2[])
//  Where:
//      object is a reference to a box we know exists (such as the falling box),
//      list_1 is a list where the first two elements are the x and y values of the
//          next potential box in the line (respectively)
//      list_2 is a list of delta values (empty array for initial call)

var box_current = argument[0];
var pos = argument[1];
var linear_history = argument[2];

var box_next = instance_position(pos[| 0], pos[| 1], obj_wall);

// If there's a box there, which isn't a wall, take a closer look
if (box_next != noone and box_next.type != box_type.wall)
{
    // Assuming we've done this dance before
    if (!ds_list_empty(linear_history))
    {
        // Delta between type of next_box and type of current_box
        var cur_increment = box_next.type - box_current.type;
        // Delta between type of current_box and type of the previous box
        var prev_increment = linear_history[| ds_list_size(linear_history) - 1];
        // If the delta is 0 or 1 and matches the previous deltas, we keep going
        if (abs(cur_increment) <= 1 and cur_increment == prev_increment)
        {
            // Add the cur_increment to our list
            ds_list_add(linear_history, cur_increment);
        }
        else
        {
            // If we've hit a dead end, pass this back up the line
            return linear_history;
        }
    }
    else
    {
        // If we're here, it's because these are the first two boxes in our line
        // Gotta start somewhere, so just add the delta into the list
        ds_list_add(linear_history, box_next.type - box_current.type);
    }
    // Set coordinates of the next box in the line
    var new_pos = ds_list_create();
    new_pos[| 0] = box_next.x + (box_next.x - box_current.x);
    new_pos[| 1] = box_next.y + (box_next.y - box_current.y);
    // Recurse, passing next_box to be the new current_box
    linear_box_check(box_next, new_pos, linear_history);
}
else
{
    return linear_history;
}

