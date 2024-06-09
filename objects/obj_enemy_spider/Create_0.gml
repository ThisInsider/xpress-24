visible = false;
enum ENEMY_STATES {
	IDLE,
	WALKING,
	ATTACKING,
	RETREATING,
}

age = 0;
move_speed = 1.15;
state = ENEMY_STATES.IDLE;