if(global.debug){
	draw_circle(x,y,100,false);
}

if(collided){
	switch(element){
	case ELEMENTS.CL:
		an = 17;
		am = 35.453;
		name = "Chlorine"
		short = "Cl"
		break;
	case ELEMENTS.FE:
		an = 26;
		am = 55.845;
		name = "Iron"
		short = "Fe"
		break;
	case ELEMENTS.MG:
		an = 12;
		am = 24.305;
		name = "Magnesium"
		short = "Mg"
		break;
	case ELEMENTS.NI:
		an = 28;
		am = 58.693;
		name = "Nickel"
		short = "Ni"
		break;
	case ELEMENTS.S:
		an = 16;
		am = 32.065;
		name = "Sulfur"
		short = "S"
		break;
	case ELEMENTS.ZN:
		an = 30;
		am = 65.380;
		name = "Zinc"
		short = "Zn"
		break;
}
	draw_set_halign(fa_center);
	draw_set_alpha(clamp(5-(age/display_get_frequency()), 0, 1))
	draw_text(obj_player.x,obj_player.y,"You've found "+name+"!");
	draw_element(obj_player.x,obj_player.y-180,an,am,name,short);
	draw_set_alpha(1);
	
}