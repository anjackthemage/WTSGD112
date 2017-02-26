// Script to spawn a group of enemies without a pre-set pattern
// TODO: Prevent spawning multiple enemies in the same position

/**
    Arguments:
                0   -   number of enemies to spawn
                1   -   list of enemies from which to choose
**/

var max_enemies = argument[0];
var enemy_types = argument[1];

var spawned_enemies = 0;

var spawn_method = 0;

for(var interval = 0; interval < max_enemies; interval++)
{
    // Choose from our list
    next_enemy = enemy_types[| irandom(ds_list_size(enemy_type_list) - 1)];
    
    // Where to put it?
    switch(next_enemy)
    {
        case obj_enemy_left:
            new_x = room_width + ((room_width / 4) * choose(1, 2, 3));
            new_y = (360 / 3) * choose(1, 2);
            new_direction = 180;
            break;
        case obj_enemy_right:
            new_x = -1 * ((room_width / 4) * choose(1, 2, 3));
            new_y = (360 / 3) * choose(1, 2);
            new_direction = 0;
            break;
        case obj_enemy_up:
            new_x = (640 / 4) * choose(1, 2, 3);
            new_y = room_height + ((room_height / 3) * choose(1, 2));
            new_direction = 90;
            break;
        default:
            new_x = (640 / 4) * choose(1, 2, 3);
            new_y = -1 * ((room_height / 3) * choose(1, 2));
            new_direction = 270;
            break;
    }
    
    // Check for collisions
    if(collision_rectangle(new_x, new_y, new_x + 32, new_y + 32, obj_enemy_basic, false, false) == noone)
    {
        // Pick a script
        spawn_method = choose(0, 1, 2);
        
        // Let there be life!
        switch(spawn_method)
        {
            case 1:
                script_spawn_follow_path(new_x, new_y, next_enemy, new_direction)
                // Record the successful spawn
                spawned_enemies++;
                break;
            case 2:
                spawned_enemies += script_spawn_flying_v(new_x, new_y, next_enemy, new_direction, max_enemies)
                break;
            default:
                instance_create(new_x, new_y, next_enemy)
                // Record the successful spawn
                spawned_enemies++;
                break;
        }
    }
    // Did we hit our limit?
    if(spawned_enemies >= max_enemies)
    {
        // I'm cutting you off, buddy
        break;
    }
}

// Return the difference
return max_enemies - spawned_enemies;
