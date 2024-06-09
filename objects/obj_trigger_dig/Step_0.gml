if(!collided && collision_circle(x,y,100,obj_player,false,true)){
	collided = true;
	array_push(obj_player.hand, element);
}
if(collided){
	
	age++;

	if(age>display_get_frequency()*5){
			if(!obj_menu.pressed_q){
				obj_menu.show_press_q = true;
			}else{
				obj_menu.fe_collected = true;
			}
		instance_destroy();
	}
}