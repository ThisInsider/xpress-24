if(fe_collected){
	fe_collected = false;
	var num = instance_number(obj_trigger_dig);
	for (var i = 0; i < num; i++)
	{
		var inst = instance_find(obj_trigger_dig, i);
		with (inst)
		{
			if (inst.element > 1)
			{
				instance_create_layer(x, y, "Instances", obj_arrow, {
					target: id
				});
			}
		}
	}
}

if(keyboard_check_pressed(ord("Q"))){
	is_menu_open = !is_menu_open;
	if(show_press_q){
		show_press_q = false;
		pressed_q = true;
		instance_activate_object(obj_trigger_dig);
		var num = instance_number(obj_trigger_dig);
			for (var i = 0; i < num; i++)
			{
				var inst = instance_find(obj_trigger_dig, i);
				with (inst)
				{
				    if (inst.element == ELEMENTS.FE)
				    {
				        instance_create_layer(x, y, "Instances", obj_arrow, {
							target: id
						});
				    }
				}
			}
	}
}

if (keyboard_check(ord("E"))) {
	if(!e_complete){
		pressed_e++;
		if(pressed_e>=1.5*display_get_frequency()){
			e_complete = true;
		instance_activate_object(obj_trigger_dig);
			var num = instance_number(obj_trigger_dig);
			for (var i = 0; i < num; i++)
			{
				var inst = instance_find(obj_trigger_dig, i);
				with (inst)
				{
				    if (inst.element == ELEMENTS.CL)
				    {
				        instance_create_layer(x, y, "Instances", obj_arrow, {
							target: id
						});
				    }else{
						instance_deactivate_object(id)
					}
				}
			}
		}
	}
	to_right_x = 0;
	to_right_y = 0;
	shake+=165/display_get_frequency();
	to_left_y = display_get_gui_height();
} else if(is_menu_open) {
	to_left_y = 0;
	shake+=165/display_get_frequency();
    to_right_x = display_get_gui_width();
	to_right_y = display_get_gui_height();
} else {
    to_right_x = display_get_gui_width();
	to_right_y = display_get_gui_height();
	to_left_y = display_get_gui_height();
}