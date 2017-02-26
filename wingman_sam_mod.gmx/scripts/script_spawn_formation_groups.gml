// Script to spawn multiple groups of enemies in formations

/**
    arguments:
                0   -   number of enemies to spawn
                1   -   enemy type list
    
    formation types:
                0   -   3 flying v from a single direction
                1   -   2 - 3 straight lines from a single direction
                2   -   4 path-followers (singletons) from 2 - 3 directions
                3   -   2 path_followers (lines) from a single direction
                4   -   sine wave group from any single direction
                5   -   2 flying v from 2 opposing directions (4 total)
    
    return:
                number of enemies not yet spawned (so we can keep trying)
**/

var max_enemies = argument[0];
var enemy_types = argument[1];

var spawned_enemies = 0;

var formation_type = 0;

for(var interval = 0; interval < max_enemies; interval++)
{
    
    switch(formation_type)
    {
        case 0:
        
            break;
        case 1:
        
            break;
        case 2:
        
            break;
        case 3:
        
            break;
        case 4:
        
            break;
        case 5:
        
            break;
    }
}

return spawned_enemies;
