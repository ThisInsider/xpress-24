if(follow != noone){
	x_to = follow.x;
	y_to = follow.y;
}

x = lerp(x, x_to, 0.04*(delta_time/10000));
y = lerp(y, y_to, 0.04*(delta_time/10000));

camera_set_view_pos(view_camera[0], x-(cam_width*0.5), y-(cam_height*0.5));