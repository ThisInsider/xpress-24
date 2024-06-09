/// @description Throw
var throwable = instance_create_layer(x, y-60, "Instances", obj_throwable, {
	speed: point_distance(x, y-60, mouse_target_x, mouse_target_y)/50,
	direction: point_direction(0, 0, mouse_target_x-x, mouse_target_y-y+60),
	sprite_index: spr_pebble,
});