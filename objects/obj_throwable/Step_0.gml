age++;

speed = lerp(speed, 0, 0.03*(delta_time/10000));

if(age>=display_get_frequency()) instance_destroy(self);