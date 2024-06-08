/// @description Throw
var throwable = instance_create_layer(x, y, "Instances", obj_throwable, {
	speed: point_distance(x, y, mouse_target_x, mouse_target_y)/50,
	direction: point_direction(0, 0, mouse_target_x-x, mouse_target_y-y),
	sprite_index: spr_flask,
});