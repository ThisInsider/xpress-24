global.debug = false;

global.controller = false;

var _fps = display_get_frequency()
game_set_speed(_fps, gamespeed_fps);

zoom = 1;

zoom += 0.5;
var _w = 640*zoom;
var _h = 360*zoom;
if(_w > display_get_width() || _h > display_get_height()){
	zoom = 1;
	_w = 640;
	_h = 360;
}
surface_resize(application_surface, _w, _h);
display_set_gui_size(640, 360);
window_set_size(_w, _h);
window_center();