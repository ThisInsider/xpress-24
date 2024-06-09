if(state == ENEMY_STATES.IDLE || state == ENEMY_STATES.WALKING){
	if(distance_to_object(obj_player) < 200){
		speed = move_speed*(delta_time/10000);
		direction = point_direction(x,y, obj_player.x, obj_player.y);
	}else{
		speed = 0;
	}

	if(speed > 0){
		state = ENEMY_STATES.WALKING;
	}else{
		state = ENEMY_STATES.IDLE;
	}
}else if(state == ENEMY_STATES.RETREATING){
	age++;
	if(age > display_get_frequency()*1){
		age = 0;
		state = ENEMY_STATES.IDLE;
	}
}

var _sprite_direction = floor((direction)/90);
switch(_sprite_direction){
	case 0:
		_sprite_direction = "up_left";
		image_xscale = -1;
		break;
	case 1:
		_sprite_direction = "up_left";
		image_xscale = 1;
		break;
	case 2:
		_sprite_direction = "down_left";
		image_xscale = 1;
		break;
	case 3:
		_sprite_direction = "down_left";
		image_xscale = -1;
		break;
	case 4:
		_sprite_direction = "up_left";
		image_xscale = -1;
		break;
}

var _state;
switch(state){
	case ENEMY_STATES.IDLE:
		_state = "idle";
		break;
	case ENEMY_STATES.WALKING:
	case ENEMY_STATES.RETREATING:
		_state = "walk";
		break;
	case ENEMY_STATES.ATTACKING:
		_state = "attack";
		break;
}

sprite_index = asset_get_index("spr_enemy_spider_"+_state+"_"+_sprite_direction);