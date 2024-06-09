if(collision_circle(x,y,100,obj_player,false,true)){
	collided = true;
}
if(collided){
	
	age++;

	if(age>display_get_frequency()*5){
		instance_destroy();
	}
}