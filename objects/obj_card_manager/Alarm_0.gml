/// Draw Cards Alarm

// Player

show_debug_message("Draw Cards in Alarm 0");

if(!(ds_list_size(cards_list) >= 6))
{
	reshuffle = true;
	return;
}

player_played_card = false;
player_drawn_cards = [];

for(var i = 0; i < 3; i++)
{
	var current_map = stack_pop(cards_list);
	
	current_map[? "cardType"] = CardOwner.Player; 
	var current_card_type = current_map[? "cardType"];
	var current_card_entity = current_map[? "cardEntity"];
	
	current_card_entity.card_owner = CardOwner.Player;
	
	draw_card_from_cardxy(current_card_entity, 
	player_cards_drawn_pos_x + i * drawn_cards_x_spacing, 
	player_cards_drawn_pos_y, 
	draw_card_duration,
	draw_cards_step_delay * i);
	
	player_drawn_cards[i] = current_card_entity;
}

opponent_drawn_cards = [];

for(var i = 0; i < 3; i++)
{
	var current_map = stack_pop(cards_list);
	
	 current_map[? "cardType"] = CardOwner.Opponent;
	var current_card_type = current_map[? "cardType"];
	var current_card_entity = current_map[? "cardEntity"];
	
	current_card_entity.card_owner = CardOwner.Opponent;
	
	draw_card_from_cardxy(current_card_entity, 
	opponent_cards_drawn_pos_x + i * drawn_cards_x_spacing, 
	opponent_cards_drawn_pos_y, 
	draw_card_duration,
	draw_cards_step_delay * (i + 3));
	
	opponent_drawn_cards[i] = current_card_entity;
}

alarm[global.CANPLAYCARDS] = 6 * draw_cards_step_delay;

