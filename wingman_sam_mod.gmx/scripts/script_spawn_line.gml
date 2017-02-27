// Script to spawn a v formation of given plane type, in given direction

/**
    Arguments:
                0   -   x coord for spawn
                1   -   y coord for spawn
                2   -   object to spawn
                3   -   direction of flight
                4   -   max enemies to spawn
**/
// Set variables
var head_x = argument[0];
var head_y = argument[1];
var obj_ref = argument[2];
var flt_dir = argument[3];

if(argument_count > 4)
{
    var max_enemies = argument[4];
}

// Keep track of how many we spawn
var enemies_spawned = 0;

// Random-size
var form_size = choose(2, 3, 4);

// Direction of line
spawn_dir = flt_dir + 180;

// Distance between center of each obj instance in a wing
var obj_span = 68;

// Draw head
instance_create(head_x, head_y, obj_ref);
enemies_spawned++;

// Draw wings
for(var iterator = 1; iterator < form_size; iterator++)
{
    if(enemies_spawned < (max_enemies - 2))
    {
        instance_create(head_x + lengthdir_x(obj_span * iterator, spawn_dir), head_y + lengthdir_y(obj_span * iterator, spawn_dir), obj_ref);
        enemies_spawned++;
    }
    else
    {
        break;
    }
}

// Return number spawned
return enemies_spawned
