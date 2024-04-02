//for(var i = ds_list_size(cards_disgarded_list) - 1; i > 0; i--)
//{
//	instance_destroy(ds_list_find_index(cards_disgarded_list, i));
//}



show_debug_message("reshuffle");

ds_list_clear(cards_list);

for(var i = 0; i < cards_count; i++)
{
	var new_card_map = ds_map_create();
	ds_map_add(new_card_map, "cardOwner", CardOwner.Undecided);
	ds_map_add(new_card_map, "cardEntity", noone);
	
	var card_type = CardType.Undecided;
	
	if(i < 8)
	{
		card_type = CardType.Rock;
	}
	else if(i < 16)
	{
		card_type = CardType.Paper;
	}
	else if(i < 24)
	{
		card_type = CardType.Scissor;
	}
	
	ds_map_add(new_card_map, "cardType", card_type);
	
	ds_list_add(cards_list, new_card_map);
}
ds_list_shuffle(cards_list);

if(ds_list_size(cards_disgarded_list) > 0)
{
	for(var i = 0; i < ds_list_size(cards_disgarded_list); i++)
	{
		var card = ds_list_find_value(cards_disgarded_list, i);
		move_card_from_cardxy(card, cards_start_x, cards_start_y + i * cards_vertical_spacing, discard_card_duration, discard_card_duration * i);
		var current_map = ds_list_find_value(cards_list, i);
		card.card_type = current_map[? "cardType"];
		current_map[? "cardEntity"] = card;
	}
}
else
{
	for(var i = 0; i < cards_count; i++)
	{
		var new_card;
		new_card = instance_create_layer(cards_start_x, cards_start_y + i * cards_vertical_spacing, "Cards", obj_card);
		set_card_scale(new_card, cards_scale);
	
		var current_map = ds_list_find_value(cards_list, i);
		new_card.card_type = current_map[? "cardType"];
	
		new_card.cards_manager = id;
	
		current_map[? "cardEntity"] = new_card;
	}
}




show_debug_message("Call Draw Alarm");
alarm[0] = 150;
show_debug_message("Call Draw Alarm After");



