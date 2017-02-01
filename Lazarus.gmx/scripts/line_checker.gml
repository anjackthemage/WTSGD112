// Script to check a line for valid matches.
// Will call linear_box_check twice for each line of boxes intersecting box_active
// First check will be either down, down-and-left, left or up-and-left
// Second check will be the opposite direction, so up, then up-and-right, then right,
// then down-and-right.

// Up direction should return immediately, with an empty list.


var box_active = argument[0];
var line_map =  argument[1];
var box_width = 40;
var box_height = 40;
var linear_history = ds_list_create();

var x_modifier = box_width * ds_stack_pop(line_map);
var y_modifier = box_height * ds_stack_pop(line_map);

var new_pos = ds_list_create();
new_pos[| 0] = box_active.x + x_modifier;
new_pos[| 1] = box_active.y + y_modifier;

var first_line = linear_box_check(box_active, new_pos, linear_history);

new_pos[| 0] = box_active.x + (x_modifier * -1);
new_pos[| 1] = box_active.y + (y_modifier * -1);

var second_line = linear_box_check(box_active, new_pos, first_line);

// If we got a non-empty list back, then we might have a line
if(!ds_list_empty(second_line))
{
    if(ds_list_size(second_line) == 3 and abs(second_line[| 0]) == 1)
    {
        // 3 deltas means 4 boxes, if the deltas are 1 or -1, that's a straight
        // Score it
        score += 100;
    }
    else if (ds_list_size(second_line <=2 and second_line[| 0] == 0))
    {
        // A delta of 0 indicates matched boxes, with two or more deltas, we have at
        // least 3 boxes, so it scores
        score += 100;
    }
}

if(!ds_stack_empty(line_map))
{
    line_checker(box_active, line_map);
}
