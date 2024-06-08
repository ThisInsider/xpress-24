zoom += 0.5;
var _w = camera_get_view_width(view_camera[0])*zoom;
var _h = camera_get_view_height(view_camera[0])*zoom;
if(_w > display_get_width() || _h > display_get_height()){
	zoom = 1;
	_w = camera_get_view_width(view_camera[0]);
	_h = camera_get_view_height(view_camera[0]);
}
view_wport[0] = _w;
view_hport[0] = _h;
surface_resize(application_surface, _w, _h);
window_set_size(_w, _h);
window_center();