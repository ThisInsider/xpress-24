enum PLAYER_STATES {
	IDLE,
	WALKING,
	THROWING,
	PUNCHING,
	CRAFTING
}
enum ITEMS {
	FLASK
}

age = 8;
last_played = 0;

speed = 0;
move_speed = 1.5;
target_speed = 0;
direction = 270;
state = PLAYER_STATES.IDLE;

mouse_target_x = 0;
mouse_target_y = 0;

inventory = [ITEMS.FLASK, undefined, undefined, undefined];
hand = [ELEMENTS.CL, ELEMENTS.FE, ELEMENTS.MG, ELEMENTS.NI, ELEMENTS.S, ELEMENTS.ZN];
selected_slot = 0;

// target direction






