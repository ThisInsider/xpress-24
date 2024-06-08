function scr_initialize_controller(){
	var gp_num = gamepad_get_device_count();
	for (var i = 0; i < gp_num; i++;)
	{
	    if (gamepad_is_connected(i))
	    {
	        global.controller = i;
	    }
	    else
	    {
	        global.controller = false;
	    }
	}
}