function draw_item_square(_pos_x, _pos_y, _size, _width, _c = c_white){
	draw_set_color(_c);
	draw_line_width(_pos_x,_pos_y+10,_pos_x,_pos_y,_width);
	draw_line_width(_pos_x,_pos_y,_pos_x+10,_pos_y,_width);
	draw_line_width(_pos_x+_size-10,_pos_y,_pos_x+_size,_pos_y,_width);
	draw_line_width(_pos_x+_size,_pos_y,_pos_x+_size,_pos_y+10,_width);
	draw_line_width(_pos_x,_pos_y+_size-10,_pos_x,_pos_y+_size,_width);
	draw_line_width(_pos_x,_pos_y+_size,_pos_x+10,_pos_y+_size,_width);
	draw_line_width(_pos_x+_size-10,_pos_y+_size,_pos_x+_size,_pos_y+_size,_width);
	draw_line_width(_pos_x+_size,_pos_y+_size,_pos_x+_size,_pos_y+_size-10,_width);
}