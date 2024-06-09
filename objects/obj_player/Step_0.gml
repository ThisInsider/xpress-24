
	var _move_vertical = keyboard_check(ord("S")) - keyboard_check(ord("W"));
	var _move_horizontal =  keyboard_check(ord("D")) - keyboard_check(ord("A"));
	
if(array_length(hand) >= 6){
	final_count++;
	if(final_count > display_get_frequency()*3){
		room_goto(outro);
	}
}
	
if(!obj_menu.is_menu_open){

	switch (keyboard_key)
	{
	    case ord("1"): selected_slot = 0; break;
	    case ord("2"): selected_slot = 1; break;
	    case ord("3"): selected_slot = 2; break;
	    case ord("4"): selected_slot = 3; break;
	}
	if(mouse_wheel_up()){
		selected_slot = selected_slot-1<0?3:selected_slot-1;
	}else if(mouse_wheel_down()){
		selected_slot = selected_slot+1>3?0:selected_slot+1;
	}

	if(state == PLAYER_STATES.IDLE || state == PLAYER_STATES.WALKING){
		target_speed = clamp(abs(_move_vertical)+abs(_move_horizontal), 0, 1) * move_speed * (delta_time/10000);
		if(collision_point(x+lengthdir_x(target_speed, direction), y+lengthdir_y(target_speed, direction), obj_tree, false, false)){
			target_speed = target_speed/5;
		}
		if(target_speed > 0){
			state = PLAYER_STATES.WALKING;
		}else{
			state = PLAYER_STATES.IDLE;
		}
	}

	if (state == PLAYER_STATES.WALKING) {
		age += 60/display_get_frequency();
		if (age - last_played >= 22) {
			audio_play_sound(sound_footstep, 0, false);
			last_played = age;
		}
	}else if(age > 8){
		age = 8;
		last_played = 0;
	}

	if((state == PLAYER_STATES.IDLE || state == PLAYER_STATES.WALKING) && keyboard_check_pressed(vk_space)){
		state = PLAYER_STATES.PUNCHING;
		image_index = 0;
		target_speed = 0;
		var _spr = spr_player_punch_down;
		alarm[0] = (sprite_get_number(_spr)/sprite_get_speed(_spr))*display_get_frequency();
	}
	if((state == PLAYER_STATES.IDLE || state == PLAYER_STATES.WALKING) && mouse_check_button_pressed(mb_left)){
		mouse_target_x = window_view_mouse_get_x(0);
		mouse_target_y = window_view_mouse_get_y(0);
		direction = point_direction(0, 0, mouse_target_x-x, mouse_target_y-y);
		switch(inventory[selected_slot]){
			case ITEMS.PEBBLE:
				state = PLAYER_STATES.THROWING;
				image_index = 0;
				target_speed = 0;
				var _spr = spr_player_throw_down;
				alarm[0] = (sprite_get_number(_spr)/sprite_get_speed(_spr))*display_get_frequency();
				alarm[2] = (14/sprite_get_speed(_spr))*display_get_frequency();
		}
	}
}else{
	target_speed = 0;
	if(state == PLAYER_STATES.WALKING){
		state = PLAYER_STATES.IDLE;
	}
}

speed = lerp(speed, target_speed, 0.24*(delta_time/10000));
if(target_speed > 0 && speed > 0.5){
	direction = point_direction(0,0,_move_horizontal, _move_vertical);
}
	
x = clamp(x, 0, 8192-sprite_width);
y = clamp(y, 0, 8192-sprite_height);

var _sprite_direction = floor((direction+22.5)/45);
switch(_sprite_direction){
	case 0:
		_sprite_direction = "left";
		image_xscale = -1;
		break;
	case 1:
		_sprite_direction = "up_left";
		image_xscale = -1;
		break;
	case 2:
		_sprite_direction = "up";
		image_xscale = 1;
		break;
	case 3:
		_sprite_direction = "up_left";
		image_xscale = 1;
		break;
	case 4:
		_sprite_direction = "left";
		image_xscale = 1;
		break;
	case 5:
		_sprite_direction = "down_left";
		image_xscale = 1;
		break;
	case 6:
		_sprite_direction = "down";
		image_xscale = 1;
		break;
	case 7:
		_sprite_direction = "down_left";
		image_xscale = -1;
		break;
	case 8:
		_sprite_direction = "left";
		image_xscale = -1;
		break;
}

var _state;
switch(state){
	case PLAYER_STATES.IDLE:
		_state = "idle";
		break;
	case PLAYER_STATES.WALKING:
		_state = "walk";
		break;
	case PLAYER_STATES.THROWING:
		_state = "throw";
		break;
	case PLAYER_STATES.PUNCHING:
		_state = "punch";
		break;
	case PLAYER_STATES.CRAFTING:
		_state = "craft";
		break;
}

sprite_index = asset_get_index("spr_player_"+_state+"_"+_sprite_direction);
