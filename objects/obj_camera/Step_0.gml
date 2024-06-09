if(follow != noone){
	x_to = follow.x;
	y_to = follow.y-follow.sprite_height/4;
}

x = lerp(x, x_to, 0.06*(delta_time/10000));
y = lerp(y, y_to, 0.06*(delta_time/10000));

camera_set_view_pos(view_camera[0], x-(cam_width*0.5), y-(cam_height*0.5));