

// Define static variables to maintain state across frames
if (!variable_global_exists("sprite_x")) {
    global.sprite_x = display_get_gui_width() + sprite_get_width(spr_right_hand);  // Start off-screen to the right
    global.sprite_y = display_get_gui_height() + sprite_get_height(spr_right_hand); // Start off-screen at the bottom
	
    global.target_x = display_get_gui_width() - sprite_get_width(spr_right_hand) / 2;  // Bottom right x-coordinate
    global.target_y = display_get_gui_height() - sprite_get_height(spr_right_hand) / 2; // Bottom right y-coordinate
	
    global.offscreen_x = display_get_gui_width() - sprite_get_width(spr_right_hand) / 2 + 900;  // Off-screen to the right
    global.offscreen_y = display_get_gui_height() - sprite_get_height(spr_right_hand) / 2 + 900; // Off-screen at the bottom
	
	global.target_outside = true;
    global.speed = 30;  // Speed of the movement
}

// Check if the 'E' key is pressed to start the movement inside
if (keyboard_check(ord("E"))) {
	global.target_outside = false;
} else {
    // When 'E' is not pressed, start moving outside the screen
    //global.moving_in = false;
    //global.moving_out = true;
	global.target_outside = true;
}

t = 0.1;

if (!global.target_outside) {
	global.sprite_x += (global.target_x - global.sprite_x) * t;
	global.sprite_y += (global.target_y - global.sprite_y) * t;
} else {
	global.sprite_x += (global.offscreen_x - global.sprite_x) * t;
	global.sprite_y += (global.offscreen_y - global.sprite_y) * t;
}


// Draw the sprite at its current position
draw_sprite(spr_right_hand, 0, global.sprite_x, global.sprite_y);
