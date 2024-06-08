enum PLAYER_STATES {
	IDLE,
	WALKING,
	THROWING,
	PUNCHING,
	CRAFTING
}

age = 0;
lastPlayed = 0;

speed = 0;
move_speed = 1.5;
target_speed = 0;
direction = 270;
state = PLAYER_STATES.IDLE;
