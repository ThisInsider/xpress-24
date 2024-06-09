/// @description Insert description here
// You can write your code in this editor

target_x = target.x;
target_y = target.y;

var delta_x = target_x - obj_player.x;
var delta_y = target_y - obj_player.y;

var padding = 40;

var radius_x = display_get_gui_width() / 2 - padding;
var radius_y = display_get_gui_height() / 2 - padding;

var angle_deg = point_direction(obj_player.x, -obj_player.y, target_x, -target_y);

var angle_rad = degtorad(angle_deg);

var direction_index = (floor((angle_deg + 22.5) / 45) + 2 ) % 8;

var new_x = display_get_gui_width() / 2 + radius_x * cos(angle_rad) - padding / 2;
var new_y = display_get_gui_height() / 2 + radius_y * sin(angle_rad) - padding / 2;

var d = sqrt(power(delta_y, 2) + power(delta_x, 2));

if (d < 200) {
	op += (0-op) * 0.1;
} else {
	op += (1-op) * 0.1;
}

draw_set_alpha(op);

//draw_sprite(spr_target_direction, direction_index, new_x, new_y);
draw_sprite_stretched(spr_target_direction, direction_index, new_x, new_y, 48, 48);

draw_set_alpha(1);
