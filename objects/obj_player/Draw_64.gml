var _size = 30;
var _offset = 20;
var _space = 10

for(var _i=0; _i<4; _i++){
	var _c = c_white
	if(selected_slot == _i){
		_c = c_orange;
	}
	draw_item_square(_offset+_i*(_space+_size), display_get_gui_height()-(_offset+_size), _size, 2, _c);
}

for(var _i=0; _i<array_length(inventory); _i++){
	var _draw = undefined;
	switch(inventory[_i]){
		case ITEMS.PEBBLE:
			_draw = spr_pebble;
			break;
	}
	if(!is_undefined(_draw)) draw_sprite_stretched(_draw, 0, _offset+_i*(_space+_size), display_get_gui_height()-_offset-_size,_size,_size);
}

exit;
// arrow direction to target

// ovdje treba u point_direction dodati da on kuzi di se nalazi taj target koji trazi
/*
var angle = point_direction(x, y, 50, 189);

var dir;

    if (angle >= 337.5 or angle < 22.5) {
        dir = 0; // Right
    } else if (angle >= 22.5 and angle < 67.5) {
        dir = 1; // Up-Right
    } else if (angle >= 67.5 and angle < 112.5) {
        dir = 2; // Up
    } else if (angle >= 112.5 and angle < 157.5) {
        dir = 3; // Up-Left
    } else if (angle >= 157.5 and angle < 202.5) {
        dir = 4; // Left
    } else if (angle >= 202.5 and angle < 247.5) {
        dir = 5; // Down-Left
    } else if (angle >= 247.5 and angle < 292.5) {
        dir = 6; // Down
    } else if (angle >= 292.5 and angle < 337.5) {
        dir = 7; // Down-Right
    }
	
    draw_sprite(spr_target_direction, dir, display_get_gui_width()/2, 0);
*/

/*


var angle = point_direction(x, y, 50, 350);

var dir;

var arrow_x;
var arrow_y;
var screen_center_x = display_get_gui_width() / 2;
var screen_center_y = display_get_gui_height() / 2;

    if (angle >= 337.5 or angle < 22.5) {
        dir = 0; // Right
        arrow_x = display_get_gui_width() - 50;
        arrow_y = screen_center_y;
    } else if (angle >= 22.5 and angle < 67.5) {
        dir = 45; // Up-Right
        arrow_x = display_get_gui_width() - 50;
        arrow_y = 50;
    } else if (angle >= 67.5 and angle < 112.5) {
        dir = 90; // Up
        arrow_x = screen_center_x;
        arrow_y = 50;
    } else if (angle >= 112.5 and angle < 157.5) {
        dir = 135; // Up-Left
        arrow_x = 50;
        arrow_y = 50;
    } else if (angle >= 157.5 and angle < 202.5) {
        dir = 180; // Left
        arrow_x = 50;
        arrow_y = screen_center_y;
    } else if (angle >= 202.5 and angle < 247.5) {
        dir = 225; // Down-Left
        arrow_x = 50;
        arrow_y = display_get_gui_height() - 50;
    } else if (angle >= 247.5 and angle < 292.5) {
        dir = 270; // Down
        arrow_x = screen_center_x;
        arrow_y = display_get_gui_height() - 50;
    } else if (angle >= 292.5 and angle < 337.5) {
        dir = 315; // Down-Right
        arrow_x = display_get_gui_width() - 50;
        arrow_y = display_get_gui_height() - 50;
    }
	
	draw_sprite(spr_target_direction, dir, arrow_x, arrow_y);
*/

// Assume the following values for the rectangle and padding
var rect_left = 100;
var rect_top = 100;
var rect_right = 700;
var rect_bottom = 500;
var padding = 10;

// Input angle (in degrees)
var angle = 0;

// Convert angle to radians
var angle_rad = degtorad(angle);

// Calculate width and height of the rectangle
var rect_width = rect_right - rect_left;
var rect_height = rect_bottom - rect_top;

// Initialize sprite position variables
var sprite_x, sprite_y;

// Determine the position based on the angle
if (angle >= 0 && angle < 90) {
    // Top edge
    sprite_x = rect_left + padding + (angle / 90) * (rect_width - 2 * padding);
    sprite_y = rect_top + padding;
} else if (angle >= 90 && angle < 180) {
    // Right edge
    sprite_x = rect_right - padding;
    sprite_y = rect_top + padding + ((angle - 90) / 90) * (rect_height - 2 * padding);
} else if (angle >= 180 && angle < 270) {
    // Bottom edge
    sprite_x = rect_right - padding - ((angle - 180) / 90) * (rect_width - 2 * padding);
    sprite_y = rect_bottom - padding;
} else if (angle >= 270 && angle < 360) {
    // Left edge
    sprite_x = rect_left + padding;
    sprite_y = rect_bottom - padding - ((angle - 270) / 90) * (rect_height - 2 * padding);
}

// Set sprite position
sprite_x = clamp(sprite_x, rect_left + padding, rect_right - padding);
sprite_y = clamp(sprite_y, rect_top + padding, rect_bottom - padding);

// Draw sprite at calculated position (replace with actual sprite draw code)
draw_sprite(sprite_index, 0, sprite_x, sprite_y);