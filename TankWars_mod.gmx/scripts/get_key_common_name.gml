/// get_key_common_name(key_to_check)

var key_to_check = argument[0];

switch(key_to_check)
{
    case 	vk_left	:	return 	'Left Arrow'	;
    case 	vk_right	:	return 	'Right Arrow'	;
    case 	vk_up	:	return 	'Up Arrow'	;
    case 	vk_down	:	return 	'Down Arrow'	;
    case 	vk_enter	:	return 	'Enter'	;
    case 	vk_escape	:	return 	'Escape'	;
    case 	vk_space	:	return 	'Space'	;
    case 	vk_shift	:	return 	'Shift'	;
    case 	vk_control	:	return 	'Control'	;
    case 	vk_alt	:	return 	'Alt'	;
    case 	vk_backspace	:	return 	'Backspace'	;
    case 	vk_tab	:	return 	'Tab'	;
    case 	vk_home	:	return 	'Home'	;
    case 	vk_end	:	return 	'End'	;
    case 	vk_delete	:	return 	'Delete'	;
    case 	vk_insert	:	return 	'Insert'	;
    case 	vk_pageup	:	return 	'Page Up'	;
    case 	vk_pagedown	:	return 	'Page Down'	;
    case 	vk_pause	:	return 	'Pause'	;
    case 	vk_printscreen	:	return 	'Print Screen'	;
    case 	vk_f1	:	return 	'F1'	;
    case 	vk_f2	:	return 	'F2'	;
    case 	vk_f3	:	return 	'F3'	;
    case 	vk_f4	:	return 	'F4'	;
    case 	vk_f5	:	return 	'F5'	;
    case 	vk_f6	:	return 	'F6'	;
    case 	vk_f7	:	return 	'F7'	;
    case 	vk_f8	:	return 	'F8'	;
    case 	vk_f9	:	return 	'F9'	;
    case 	vk_f10	:	return 	'F10'	;
    case 	vk_f11	:	return 	'F11'	;
    case 	vk_f12	:	return 	'F12'	;
    case 	vk_numpad0	:	return 	'Numpad 0'	;
    case 	vk_numpad1	:	return 	'Numpad 1'	;
    case 	vk_numpad2	:	return 	'Numpad 2'	;
    case 	vk_numpad3	:	return 	'Numpad 3'	;
    case 	vk_numpad4	:	return 	'Numpad 4'	;
    case 	vk_numpad5	:	return 	'Numpad 5'	;
    case 	vk_numpad6	:	return 	'Numpad 6'	;
    case 	vk_numpad7	:	return 	'Numpad 7'	;
    case 	vk_numpad8	:	return 	'Numpad 8'	;
    case 	vk_multiply	:	return 	'Numpad *'	;
    case 	vk_divide	:	return 	'Numpad /'	;
    case 	vk_add	:	return 	'Numpad +'	;
    case 	vk_subtract	:	return 	'Numpad -'	;
    case 	vk_decimal	:	return 	'Numpad .'	;
    default: return key_to_check;
}
