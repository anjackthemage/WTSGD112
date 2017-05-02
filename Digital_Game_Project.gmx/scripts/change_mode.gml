///change_mode()

show_debug_message("TEST!");
mode = next_mode;

// Character selection mode
if(mode == char_select_mode)
{
    next_mode = action_select_mode;
}

// Action selection mode
if(mode == action_select_mode)
{
    next_mode = target_select_mode;
}

if(mode == target_select_mode)
{
    next_mode = wait_mode;
}
