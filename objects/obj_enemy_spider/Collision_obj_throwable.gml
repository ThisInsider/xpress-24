direction = other.direction
speed = 1.35*(delta_time/10000);
state = ENEMY_STATES.RETREATING;
instance_destroy(other.id);