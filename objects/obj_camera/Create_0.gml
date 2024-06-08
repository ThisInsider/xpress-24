aspect_ratio = display_get_width()/display_get_height();
cam_width = 960;
cam_height = cam_width/aspect_ratio;

follow = obj_player;

x = follow.x;
x_to = follow.x;
y = follow.y;
y_to = follow.y;