global.DRAWCARDS = 0;
global.DISCARDCARDS = 1;
global.CANPLAYCARDS = 2;
global.SHUFFLECARDS = 3;
//GUI

title_persist_time = 200;
current_time_step = 400;

text_x_scale = 4;
text_y_scale = 4;

reshuffle = true;

/// Data

draw_cards_after_win_delay = 180;
lost_draw_delay = 120;
won_discard_delay = 120;
lost_discard_delay = 60;
won = false;
lost = false;

can_play_card = false;

player_point = 0;
opponent_point = 0;

player_played_card = false;
player_played_card_type = CardType.Undecided;

opponent_player_card = false;
opponent_played_card_type = CardType.Undecided;

draw_card_duration = 20;

discard_card_duration = 10;

draw_cards_step_delay = 20;

discard_cards_step_delay = 5;

player_cards_drawn_pos_x = 350;
player_cards_drawn_pos_y = 500;

player_played_card_pos_y_additive = -80;

player_drawn_cards = [];

opponent_cards_drawn_pos_x = 350;
opponent_cards_drawn_pos_y = 100;

opponent_played_card_pos_y_additive = 80;

opponent_drawn_cards = [];

played_card_move_duration = 30;

drawn_cards_x_spacing = 100;

cards_start_x = 150;
cards_start_y = 300;

cards_discarded_x = 750;
cards_discarded_start_y = 300;

cards_scale = 1.5;

cards_vertical_spacing = 4;

cards_count = 24;

cards_list = ds_list_create();

cards_disgarded_list = ds_list_create();

enum CardOwner
{
	Undecided, Player, Opponent
}

enum CardType
{
	Undecided, Rock, Paper, Scissor
}

/// Cards Initialization

alarm[global.SHUFFLECARDS] = 10;





