var _move_vertical = keyboard_check(ord("S")) - keyboard_check(ord("W"));
var _move_horizontal =  keyboard_check(ord("D")) - keyboard_check(ord("A"));

if(state == PLAYER_STATES.IDLE || state == PLAYER_STATES.WALKING){
	target_speed = clamp(abs(_move_vertical)+abs(_move_horizontal), 0, 1) * move_speed * (delta_time/10000);
	if(target_speed > 0){
		state = PLAYER_STATES.WALKING;
	}else{
		state = PLAYER_STATES.IDLE;
	}
}
speed = lerp(speed, target_speed, 0.24*(delta_time/10000));

if(target_speed > 0 && speed > 0.5){
	direction = point_direction(0,0,_move_horizontal, _move_vertical);
}

x = clamp(x, 0, 8192-sprite_width);
y = clamp(y, 0, 8192-sprite_height);

age = age + 1;
if ((keyboard_check(ord("W")) == true)
    || (keyboard_check(ord("A")) == true)
	|| (keyboard_check(ord("S")) == true)
	|| (keyboard_check(ord("D")) == true)) {
		
	if (age - lastPlayed >= 22) {
		audio_play_sound(sound_footstep, 0, false);
		lastPlayed = age;
	}	    
}

var _sprite_direction = floor(direction/45);
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
