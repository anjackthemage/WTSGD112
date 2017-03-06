/// handle_damage(projectile_obj, target_object, dmg_amt)

var projectile_obj = argument[0];
var target_obj = argument[1];
var dmg_amt = argument[2];
var dmg_diff = 0;

if(target_obj.shield_health > 0)
{
    dmg_diff = dmg_amt - target_obj.shield_health;
}
else
{
    dmg_diff = dmg_amt;
}

if(dmg_diff > 0)
{
    target_obj.my_health -= dmg_diff;
    target_obj.last_damaged_by = projectile_obj.fired_from;
}
else
{
    target_obj.shield_health -= dmg_amt;
}
