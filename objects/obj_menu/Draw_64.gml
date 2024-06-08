
right_x = lerp(right_x, to_right_x, 0.04*(delta_time/10000));
right_y = lerp(right_y, to_right_y, 0.04*(delta_time/10000));

draw_sprite_stretched(spr_right_hand, 0, right_x, right_y+sin(shake/300)*10+10, display_get_gui_width(), display_get_gui_height());

left_y = lerp(left_y, to_left_y, 0.04*(delta_time/10000));

draw_sprite_stretched(spr_left_hand, 0, 0, left_y+sin(shake/300)*10+10, display_get_gui_width(), display_get_gui_height());