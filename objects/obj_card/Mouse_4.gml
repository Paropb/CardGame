if(interactable && cards_manager.can_play_card)
{
	play_card(cards_manager, 
	id, 
	x, 
	y + cards_manager.player_played_card_pos_y_additive, 
	cards_manager.played_card_move_duration,
	0);
	
	cards_manager.player_played_card_type = card_type;
	
	var random_card_index = random_range(0, 3);
	var opponent_card = cards_manager.opponent_drawn_cards[random_card_index];
	
	play_opponent_card(cards_manager,
	opponent_card.id,
	opponent_card.x,
	opponent_card.y + cards_manager.opponent_played_card_pos_y_additive,
	cards_manager.played_card_move_duration,
	cards_manager.played_card_move_duration);
}


