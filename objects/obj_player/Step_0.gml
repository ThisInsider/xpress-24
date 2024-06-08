var _move_vertical = keyboard_check(ord("S")) - keyboard_check(ord("W"));
var _move_horizontal =  keyboard_check(ord("D")) - keyboard_check(ord("A"));

target_speed = clamp(abs(_move_vertical)+abs(_move_horizontal), 0, 1) * move_speed * (delta_time/10000);
if(target_speed > 0){
	direction = point_direction(0,0,_move_horizontal, _move_vertical);
}
speed = lerp(speed, target_speed, 0.08*(delta_time/10000));

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

