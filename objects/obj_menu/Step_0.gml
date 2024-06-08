if (keyboard_check(ord("E"))) {
	to_right_x = 0;
	to_right_y = 0;
	shake+=165/display_get_frequency();
	to_left_x = 0;
	to_left_y = display_get_gui_height();
} else if(keyboard_check(ord("Q"))) {
	to_left_x = display_get_gui_width();
	to_left_y = 0;
	shake+=165/display_get_frequency();
    to_right_x = display_get_gui_width();
	to_right_y = display_get_gui_height();
} else {
    to_right_x = display_get_gui_width();
	to_right_y = display_get_gui_height();
	to_left_x = 0;
	to_left_y = display_get_gui_height();
}