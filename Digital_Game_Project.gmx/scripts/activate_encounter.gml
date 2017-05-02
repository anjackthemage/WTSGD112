/// activate_encounter(source_mob)

var source_mob = argument[0];

// Halt character movement
obj_hunter.speed = 0;
obj_hunter.sprite_index = spr_hunter_down;
obj_hunter.image_speed = 0;
obj_hunter.image_index = 4;

// Record spawned enemies
obj_battle_director.mob_source = source_mob;
obj_battle_director.num_mobs = source_mob.num_mobs;
obj_battle_director.mob_type_list = source_mob.mob_type_list;
obj_battle_director.max_enemy_type = source_mob.max_enemy_type;

// Go to the battle screen
room_goto(rm_battle);

// Todo: Remove encounter enemy if battle is won. Move player characters away if they escape.

