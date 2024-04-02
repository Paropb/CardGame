
var is_moving = start_moving;
// Step event
if (current_step < move_duration && start_moving) 
{
	interactable = false;
	
	if(move_delay > 0)
	{
		move_delay--;
		if(move_delay == 0)
	{
		audio_play_sound(draw_knife_sound, 1, false);
	}
		return;
	}
	
    // Calculate interpolation factor
    var t = current_step / move_duration;

    // Interpolate x and y positions
    x = lerp(start_x, target_x, t);
    y = lerp(start_y, target_y, t);

    // Increment step counter
    current_step++;
} 
else if(start_moving)
{
    // Movement complete
    x = target_x;
    y = target_y;
	
	start_moving = false;
	
	if(made_opponent_selection)
	{
		made_opponent_selection = false;
	
	}
}

if(card_owner != CardOwner.Undecided)
{
	switch(card_type)
		{
			case CardType.Rock:
				sprite_index = spr_rock;
				break;
			case CardType.Paper:
				sprite_index = spr_paper;
				break;
			case CardType.Scissor:
				sprite_index = spr_scissor;
				break;
		}
}

if(card_owner == CardOwner.Player && !is_moving && !disgarded && !cards_manager.player_played_card)
{
	interactable = true;
}

else
{
	interactable = false;
}

