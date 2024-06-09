// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_element(_x,_y,_an,_am,_name,_short){
	draw_line_width(_x-40,_y,_x+40,_y,2);
	draw_line_width(_x-40,_y,_x-40,_y+100,2);
	draw_line_width(_x-40,_y+100,_x+40,_y+100,2);
	draw_line_width(_x+40,_y,_x+40,_y+100,2);
	
	draw_set_halign(fa_left);
	draw_text(_x-37,_y,string(_an));
	draw_set_halign(fa_right);
	draw_text(_x+37,_y,string(_am));
	draw_set_halign(fa_center);
	draw_text_transformed(_x,_y+7,string(_short),4,4,0);
	draw_set_halign(fa_center);
	draw_text(_x,_y+80,string(_name));
	
}