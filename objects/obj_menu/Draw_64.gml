// DRAW_GUI event code

// Check if the 'E' key is pressed
/*
if (keyboard_check(ord("E"))) {
    // Coordinates where you want to draw the sprite
    var draw_x = display_get_gui_width() - sprite_get_width(spr_right_hand) / 2;
    var draw_y = display_get_gui_height() - sprite_get_height(spr_right_hand) / 2;

    // Draw the sprite at the specified coordinates
    draw_sprite(spr_right_hand, 0, draw_x, draw_y);
}

*/

// DRAW_GUI event code

// Define static variables to maintain state across frames
if (!variable_global_exists("sprite_x")) {
    global.sprite_x = display_get_gui_width() + sprite_get_width(spr_right_hand);  // Start off-screen to the right
    global.sprite_y = display_get_gui_height() + sprite_get_height(spr_right_hand); // Start off-screen at the bottom
	
    global.target_x = display_get_gui_width() - sprite_get_width(spr_right_hand) / 2;  // Bottom right x-coordinate
    global.target_y = display_get_gui_height() - sprite_get_height(spr_right_hand) / 2; // Bottom right y-coordinate
	
    global.offscreen_x = display_get_gui_width() - sprite_get_width(spr_right_hand) / 2 + 300;  // Off-screen to the right
    global.offscreen_y = display_get_gui_height() - sprite_get_height(spr_right_hand) / 2 + 300; // Off-screen at the bottom
	
    global.moving_in = false;  // Whether the sprite is moving inside the screen
    global.moving_out = false;  // Whether the sprite is moving outside the screen
    global.speed = 20;  // Speed of the movement
}

// Check if the 'E' key is pressed to start the movement inside
if (keyboard_check(ord("E"))) {
    global.moving_in = true;
    global.moving_out = false;
} else {
    // When 'E' is not pressed, start moving outside the screen
    global.moving_in = false;
    global.moving_out = true;
}

// Update position if the sprite is moving inside
if (global.moving_in) {
    // Move the sprite towards the target position
    global.sprite_x -= global.speed;
    global.sprite_y -= global.speed;

    // Stop moving inside when the sprite reaches the target position
    if (global.sprite_x <= global.target_x && global.sprite_y <= global.target_y) {
        global.moving_in = false;
        // Ensure the sprite is exactly at the target position
        global.sprite_x = global.target_x;
        global.sprite_y = global.target_y;
    }
}

// Update position if the sprite is moving outside
if (global.moving_out) {
    // Move the sprite towards the off-screen position
    global.sprite_x += global.speed;
    global.sprite_y += global.speed;

    // Stop moving outside when the sprite reaches the off-screen position
    if (global.sprite_x >= global.offscreen_x && global.sprite_y >= global.offscreen_y) {
        global.moving_out = false;
        // Ensure the sprite is exactly at the off-screen position
        global.sprite_x = global.offscreen_x;
        global.sprite_y = global.offscreen_y;
    }
}

// Draw the sprite at its current position
draw_sprite(spr_right_hand, 0, global.sprite_x, global.sprite_y);
