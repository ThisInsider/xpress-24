var _size = 30;
var _offset = 20;
var _space = 10;

for(var _i=0; _i<4; _i++){
	draw_set_color(c_white);
	if(selected_slot == _i){
		draw_set_color(c_orange);
	}
	draw_item_square(_offset+_i*(_space+_size), display_get_gui_height()-(_offset+_size), _size, 2);
}

for(var _i=0; _i<array_length(inventory); _i++){
	var _draw = undefined;
	switch(inventory[_i]){
		case ITEMS.FLASK:
			_draw = spr_flask;
			break;
	}
	if(!is_undefined(_draw)) draw_sprite(_draw, 0, _offset+_i*(_space+_size)+(_size/2), display_get_gui_height()-_offset);
}