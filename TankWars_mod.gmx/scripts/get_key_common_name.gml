/// get_key_common_name(key_to_check)

var key_to_check = argument[0];

// Check for "vk_" and remove
if(string_count("vk_", key_to_check) > 0)
{
    key_to_check = string_copy(key_to_check, 4, string_length(key_to_check) - 3);
    if(string_count(key_to_check, "up down left right"))
    {
        key_to_check += " arrow";
    }
}

return(key_to_check);
