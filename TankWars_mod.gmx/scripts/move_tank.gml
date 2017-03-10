/// move_tank(tank_obj, control_activated)

var speed_adjust = 0;
var angle_adjust = 0;

switch(direction_entered)
{
    case "forward":
        speed_adjust = 1;
        break;
    case "reverse":
        speed_adjust = -1;
        break;
    case "turnleft":
        angle_adjust = 6;
        break;
    case "turnright":
        angle_adjust = -6;
        break;
    default:
        tank_moved = false;
        break;
}

with(tank_obj)
{
    image_angle += angle_adjust;
    speed += speed_adjust;
}
