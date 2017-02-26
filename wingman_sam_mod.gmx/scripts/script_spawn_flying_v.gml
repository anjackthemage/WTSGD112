// Script to spawn a v formation of given plane type, in given direction

/**
    Arguments:
                0   -   x coord for spawn
                1   -   y coord for spawn
                2   -   object to spawn
                3   -   direction of flight
**/
// Set variables
head_x = argument[0];
head_y = argument[1];
obj_ref = argument[2];
flt_dir = argument[3];

// Random-size
form_size = choose(2, 3, 4);

// Direction of each wing
top_wing_dir = flt_dir - 157.5;
bottom_wing_dir = flt_dir + 157.5;

// Distance between center of each obj instance in a wing
obj_span = 68;

// Draw head
instance_create(head_x, head_y, obj_ref);
// Draw wings
for(var iterator = 1; iterator < form_size; iterator++)
{
    instance_create(head_x + lengthdir_x(obj_span * iterator, top_wing_dir), head_y + lengthdir_y(obj_span * iterator, top_wing_dir), obj_ref);
    instance_create(head_x + lengthdir_x(obj_span * iterator, bottom_wing_dir), head_y + lengthdir_y(obj_span * iterator, bottom_wing_dir), obj_ref);
}
