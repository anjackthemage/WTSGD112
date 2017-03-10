/// move_tank(tank_obj, control_activated)

var tank_obj = argument[0];
var control_activated = argument[1];

var speed_adjust = 0;
var angle_adjust = 0;

switch(control_activated)
{
    case "Forward":
        speed_adjust = 1;
        break;
    case "Reverse":
        speed_adjust = -1;
        break;
    case "Turn Left":
        angle_adjust = 6;
        break;
    case "Turn Right":
        angle_adjust = -6;
        break;
    default:
        tank_moved = false;
        break;
}

with(tank_obj)
{
    image_angle += angle_adjust;
    if(speed < max_speed)
    {
        speed += speed_adjust;
    }
}
