// Script to spawn multiple groups of enemies in formations

/**
    arguments:
                0   -   number of enemies to spawn
                1   -   enemy type list
                2   -   length of formations (0 = random)
       
    return:
                number of enemies spawned (so we can keep trying)
**/

var max_enemies = argument[0];
var enemy_types = argument[1];
var max_length = argument[2];

var new_x = 0;
var new_y = 0;

var new_path = 0;

var next_enemy = 0;

var spawned_enemies = 0;

var temp_obj = noone;

for(var interval = 0; interval < max_enemies; interval++)
{
    // Pick enemy type from our list
    next_enemy = enemy_types[| irandom(ds_list_size(enemy_types) - 1)];
    
    new_path = choose(path_TL_BR, path_TR_BL, path_BR_TL, path_BL_TR);
    start_x = path_get_point_x(new_path, 0);
    end_x = path_get_point_x(new_path, 1);
    start_y = path_get_point_y(new_path, 0);
    end_y = path_get_point_y(new_path, 1);
    
    path_direction = point_direction(end_x, end_y, start_x, start_y);
    
    new_x = start_x;
    new_y = start_y;
    for(var interval_2 = 0; interval_2 < max_length; interval_2++)
    {
        if(collision_point(new_x, new_y, obj_enemy_basic, false, false) == noone)
        {
            temp_obj = instance_create(new_x, new_y, next_enemy);
            
            new_x += lengthdir_x(68, path_direction);
            new_y += lengthdir_y(68, path_direction);
            
            with(temp_obj)
            {
                path_start(new_path, 4, path_action_stop, false);
            }
            
            spawned_enemies++;
            if(spawned_enemies >= max_enemies)
            {
                break;
            }
        }
    }
    if(spawned_enemies >= max_enemies)
    {
        break;
    }
}

return spawned_enemies;
