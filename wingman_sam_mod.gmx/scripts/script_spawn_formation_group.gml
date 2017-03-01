// Script to spawn a formation of formations

/**
    Arguments:
                0   -   number of enemies to spawn
                1   -   list of enemies from which to choose
**/

var max_enemies = argument[0];
var enemy_types = argument[1];

var spawned_enemies = 0;

var formation_number = 0;

var x_list = ds_list_create();
var y_list = ds_list_create();


for(var interval = 0; interval < max_enemies; interval++)
{
    // Choose from our list
    next_enemy = enemy_types[| irandom(ds_list_size(enemy_types) - 1)];
    
    new_direction = choose(0, 90, 180, 270);
    
    // Where to put it?
    switch(new_direction)
    {
        case 180:
            for(var interval = 1; interval <= 3; interval++)
            {
                ds_list_add(y_list, (240 / 4) * interval);
                ds_list_add(x_list, room_width + (room_width / 4));
            }
            break;
        case 0:
            for(var interval = 1; interval <= 3; interval++)
            {
                ds_list_add(y_list, 60 + ((240 / 4) * interval));
                ds_list_add(x_list, (room_width + (room_width / 4)) * -1);
            }
            break;
        case 90:
            for(var interval = 1; interval <= 3; interval++)
            {
                ds_list_add(x_list, (640 / 4) * interval);
                ds_list_add(y_list, room_height + (room_height / 3));
            }
            break;
        default:
            for(var interval = 1; interval <= 3; interval++)
            {
                ds_list_add(x_list, (640 / 4) * interval);
                ds_list_add(y_list, (room_height + (room_height / 3)) * -1);
            }
            break;
    }
    
    // Pick a script
    formation_number = choose(0, 1, 2);
    
    // Let there be life!
    switch(formation_number)
    {
        case 0:
            for(var interval_2 = 0; interval_2 < 3; interval_2++)
            {
                if(collision_rectangle(x_list[| interval_2] - 16, y_list[| interval_2] - 16, x_list[| interval_2] + 16, y_list[| interval_2] + 16, obj_enemy_basic, false, false) == noone)
                {
                    script_spawn_follow_path(x_list[| interval_2], y_list[| interval_2], next_enemy, new_direction);
                    // Record the spawn
                    spawned_enemies++;
                }
            }
            break;
        case 1:
            for(var interval_2 = 0; interval_2 < 3; interval_2++)
            {
                if(collision_rectangle(x_list[| interval_2] - 16, y_list[| interval_2] - 16, x_list[| interval_2] + 16, y_list[| interval_2] + 16, obj_enemy_basic, false, false) == noone)
                {
                    spawned_enemies += script_spawn_flying_v(x_list[| interval_2], y_list[| interval_2], next_enemy, new_direction, max_enemies);
                }
            }
            break;
        default:
            for(var interval_2 = 0; interval_2 < 3; interval_2++)
            {
                if(collision_rectangle(x_list[| interval_2] - 16, y_list[| interval_2] - 16, x_list[| interval_2] + 16, y_list[| interval_2] + 16, obj_enemy_basic, false, false) == noone)
                {
                    spawned_enemies += script_spawn_line(x_list[| interval_2], y_list[| interval_2], next_enemy, new_direction, max_enemies);
                }
            }
            break;
    }
    // Did we hit our limit?
    if(spawned_enemies >= max_enemies)
    {
        // I'm cutting you off, buddy
        break;
    }
}

// Return the difference
return spawned_enemies;
