
enum ELEMENTS {
	CL,
	FE,
	MG,
	NI,
	S,
	ZN,
}

fe_collected = false;

pressed_e = 0;
e_complete = false;
show_press_q = false;
pressed_q = false;

is_menu_open = false;

shake = 0;

right_x = display_get_gui_width();
right_y = display_get_gui_height();

to_right_x = display_get_gui_width();
to_right_y = display_get_gui_height();

left_y = display_get_gui_height();

to_left_y = display_get_gui_height();