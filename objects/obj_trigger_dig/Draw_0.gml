if(global.debug){
	draw_circle(x,y,100,false);
}

if(collided){
	
	draw_set_halign(fa_center);
	draw_set_alpha(clamp(5-(age/display_get_frequency()), 0, 1))
	draw_text(obj_player.x,obj_player.y,"You've found Silicon!");
	draw_element(obj_player.x,obj_player.y-180,an,am,name,short);
	draw_set_alpha(1);
	
}