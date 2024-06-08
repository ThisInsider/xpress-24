global.debug = true;

global.controller = false;

var _fps = display_get_frequency()
game_set_speed(_fps, gamespeed_fps);

zoom = 1;

scr_initialize_controller();