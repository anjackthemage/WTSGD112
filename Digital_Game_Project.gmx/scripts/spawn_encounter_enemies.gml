/// spawn_encounter_enemies(num_enemies, enemy_type_list, max_enemy_type)

var num_enemies = argument[0];
var enemy_type_list = argument[1];
var max_enemy_type = argument[2];

var enemies_spawned = ds_list_create();

for(var interval = 0; interval < num_enemies; interval++)
{
    // Randomly select enemy type from list.
    var next_mob_type = ds_list_find_value(enemy_type_list, irandom_range(0, max_enemy_type));
    // Spawn at specified grid positions
    ds_list_add(enemies_spawned, instance_create(0, 0, next_mob_type));
    show_debug_message(object_get_name(next_mob_type));
}

return enemies_spawned;
