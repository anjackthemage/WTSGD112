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
var matched_boxes = ds_list_create();
ds_list_add(matched_boxes, box_active);

var x_modifier = box_width * ds_stack_pop(line_map);
var y_modifier = box_height * ds_stack_pop(line_map);

var check_pos = ds_list_create();
check_pos[| 0] = box_active.x + x_modifier;
check_pos[| 1] = box_active.y + y_modifier;

linear_box_check(matched_boxes, check_pos);

var new_pos = ds_list_create();
new_pos[| 0] = box_active.x + (x_modifier * -1);
new_pos[| 1] = box_active.y + (y_modifier * -1);

var temp_list = ds_list_create();
for ( var iterator = ds_list_size(matched_boxes) -1; iterator >= 0; iterator--)
{
    ds_list_add(temp_list, matched_boxes[| iterator]);
}

ds_list_copy(matched_boxes, temp_list);

linear_box_check(matched_boxes, new_pos);

// If we got a non-empty list back, then we might have a line
if(!ds_list_empty(matched_boxes))
{
    if(ds_list_size(matched_boxes) == 4 and matched_boxes[| 0].type != matched_boxes[| 1].type)
    {
        // 4 boxes with different types should only happen if it's a straight
        // Score it
        for (var iterator = 0; iterator < ds_list_size(matched_boxes); iterator++)
        {
            var box_instance = matched_boxes[| iterator];
            box_instance.matched= 1;
            effect_create_above(ef_firework, box_instance.x+20, box_instance.y+20, 0, c_aqua);
            var floating_number = instance_create(box_instance.x + 20, box_instance.y + 20, obj_floating_number);
            floating_number.point_value = 50;
            score += 50;
        }
    }
    else if (ds_list_size(matched_boxes) >=3 and matched_boxes[| 0].type == matched_boxes[| 1].type)
    {
        // They're all the same type and we have at least 3 boxes
        // it scores
        for (var iterator = 0; iterator < ds_list_size(matched_boxes); iterator++)
        {
            var box_instance = matched_boxes[| iterator];
            box_instance.matched = 1;
            effect_create_above(ef_firework, box_instance.x+20, box_instance.y+20, 0, c_aqua);
            floating_number = instance_create(box_instance.x + 20, box_instance.y + 20, obj_floating_number);
            floating_number.point_value = 30;
            score += 30;
        }
    }
}

if(!ds_stack_empty(line_map))
{
    line_checker(box_active, line_map);
}
