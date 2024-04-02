function player_win()
{
	player_point++;
	won = true;
	audio_play_sound(applause_sound, 1, false);
}
function player_lose()
{
	opponent_point++;
	lost = true;
	audio_play_sound(stab_sound, 1, false);
	//audio_play_sound(cyber_scream_sound, 1, false);
}

can_play_card = false;

switch(player_played_card_type)
{
	case CardType.Rock:
		if(opponent_played_card_type == CardType.Paper) 
		{
			player_lose();
		}
		if opponent_played_card_type == CardType.Scissor
		{
			player_win();
		}
		break;
	case CardType.Paper:
		if(opponent_played_card_type == CardType.Scissor) 
		{
			player_lose();
		}
		if opponent_played_card_type == CardType.Rock
		{
			player_win();
		}
		break;
	case CardType.Scissor:
		if(opponent_played_card_type == CardType.Rock) 
		{
			player_lose();
		}
		if opponent_played_card_type == CardType.Paper
		{
			player_win();
		}
		break;
		
}

var disgard_delay = 0;
if(won)
{
	disgard_delay = won_discard_delay;
}
else if(lost)
{
	disgard_delay = lost_discard_delay;
}

for(var i = 0; i < array_length(player_drawn_cards); i++)
{
	disgard_card_from_cardxy(player_drawn_cards[i], cards_discarded_x, 
	cards_discarded_start_y + ds_list_size(cards_disgarded_list) * cards_vertical_spacing,
	discard_card_duration,
	discard_cards_step_delay * i + disgard_delay);
	ds_list_add(cards_disgarded_list, player_drawn_cards[i]);
}

for(var i = 0; i < array_length(opponent_drawn_cards); i++)
{
	disgard_card_from_cardxy(opponent_drawn_cards[i], cards_discarded_x, 
	cards_discarded_start_y + ds_list_size(cards_disgarded_list) * cards_vertical_spacing,
	discard_card_duration,
	discard_cards_step_delay * (i + array_length(player_drawn_cards)) + disgard_delay);
	ds_list_add(cards_disgarded_list, opponent_drawn_cards[i]);
}

var delay = discard_cards_step_delay * (array_length(player_drawn_cards) + array_length(opponent_drawn_cards));
if(won)
{
	won = false;
	delay += draw_cards_after_win_delay;
}
else if(lost)
{
	lost = false;
	delay += lost_draw_delay;
}

alarm[global.DRAWCARDS] = delay;




