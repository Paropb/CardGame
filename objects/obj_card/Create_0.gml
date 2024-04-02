
interactable = false;
disgarded = false;

made_opponent_selection = false;

cards_manager = noone;

card_owner = CardOwner.Undecided;
card_type = CardType.Undecided;

// Create variables to track movement
start_x = x;
start_y = y;
target_x = x; // Destination x-coordinate
target_y = y; // Destination y-coordinate
move_duration = 0; // Duration in steps (adjust as needed)
current_step = 0;
start_moving = false;
move_delay = 0;

