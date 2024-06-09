
if(pressed_e<=1.5*display_get_frequency()){
	draw_sprite(spr_key_e, 0, display_get_gui_width()-64, display_get_gui_height()-64);
}
if(show_press_q){
	draw_sprite(spr_key_q, 0, display_get_gui_width()-64, display_get_gui_height()-64);
}

right_x = lerp(right_x, to_right_x, 0.04*(delta_time/10000));
right_y = lerp(right_y, to_right_y, 0.04*(delta_time/10000));

left_y = lerp(left_y, to_left_y, 0.04*(delta_time/10000));

draw_set_color(c_black);
draw_set_alpha(0.4-0.4*(left_y/display_get_gui_height()));
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

draw_set_alpha(1);
draw_sprite_stretched(spr_right_hand, 0, right_x, right_y+sin(shake/300)*10+10, display_get_gui_width(), display_get_gui_height());

draw_sprite_stretched(spr_left_hand, 0, 0, left_y+sin(shake/300)*10+10, display_get_gui_width(), display_get_gui_height());

draw_set_color(c_white);
for(var _i=0; _i<6; _i++){
	var _c = c_white;
	if(
		window_mouse_get_x()/obj_init.zoom >= 120+floor(_i%3)*80
		&& window_mouse_get_x()/obj_init.zoom <= 120+floor(_i%3)*80+60
		&& window_mouse_get_y()/obj_init.zoom >= 160+floor(_i/3)*80+left_y+(10-floor(_i%3)*10)
		&& window_mouse_get_y()/obj_init.zoom <= 160+floor(_i/3)*80+left_y+(10-floor(_i%3)*10)+60
	){
		_c=c_orange
	}
	draw_item_square(120+floor(_i%3)*80,160+floor(_i/3)*80+left_y+(10-floor(_i%3)*10),60,2,_c);
}
for(var _i=0; _i<array_length(obj_player.hand); _i++){
	draw_set_color(c_black)
	var _name="cl";
	switch(obj_player.hand[_i]){
			case ELEMENTS.CL:
				_name = "cl";
				break;
			case ELEMENTS.FE:
				_name = "fe";
				break;
			case ELEMENTS.MG:
				_name = "mg";
				break;
			case ELEMENTS.NI:
				_name = "ni";
				break;
			case ELEMENTS.S:
				_name = "s";
				break;
			case ELEMENTS.ZN:
				_name = "zn";
				break;
		}
	draw_sprite(asset_get_index("spr_element_"+_name), 0, 120+floor(_i%3)*80+30, 160+floor(_i/3)*80+left_y+sin(shake/300)*10+(10-floor(_i%3)*10)+30)
	if(
		window_mouse_get_x()/obj_init.zoom >= 120+floor(_i%3)*80
		&& window_mouse_get_x()/obj_init.zoom <= 120+floor(_i%3)*80+60
		&& window_mouse_get_y()/obj_init.zoom >= 160+floor(_i/3)*80+left_y+(10-floor(_i%3)*10)
		&& window_mouse_get_y()/obj_init.zoom <= 160+floor(_i/3)*80+left_y+(10-floor(_i%3)*10)+60
	){
		switch(obj_player.hand[_i]){
			case ELEMENTS.CL:
				draw_element(540,162+left_y+sin(shake/300)*10,17,35.453,"Chlorine","Cl");
				break;
			case ELEMENTS.FE:
				draw_element(540,162+left_y+sin(shake/300)*10,26,55.845,"Iron","Fe");
				break;
			case ELEMENTS.MG:
				draw_element(540,162+left_y+sin(shake/300)*10,12,24.305,"Magnesium","Mg");
				break;
			case ELEMENTS.NI:
				draw_element(540,162+left_y+sin(shake/300)*10,28,58.693,"Nickel","Ni");
				break;
			case ELEMENTS.S:
				draw_element(540,162+left_y+sin(shake/300)*10,16,32.065,"Sulfur","S");
				break;
			case ELEMENTS.ZN:
				draw_element(540,162+left_y+sin(shake/300)*10,30,65.380,"Zinc","Zn");
				break;
		}
	}
	draw_set_color(c_white);
}