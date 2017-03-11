
if(gamepad_is_connected(0))
{
    show_debug_message(string(gamepad_axis_value(0, gp_axislh)));
    show_debug_message(string(gamepad_axis_value(0, gp_axislv)));
}
