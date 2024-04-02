// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// Push an item onto the stack
function stack_push(stack, value) {
    ds_list_insert(stack, 0, value);
}

// Pop an item from the stack
function stack_pop(stack) {
    if (!ds_list_empty(stack)) {
        var value = ds_list_find_value(stack, 0);
        ds_list_delete(stack, 0);
        return value;
    }
    return undefined; // Stack is empty
}

// Check if the stack is empty
function stack_is_empty(stack) {
    return ds_list_empty(stack);
}

function set_card_scale(card_entity, scale)
{
	card_entity.image_xscale = scale;
	card_entity.image_yscale = scale;
}
function move_card_from_cardxy(card_entity, target_x, target_y, move_duration, move_delay)
{
	card_entity.start_x = card_entity.x;
	card_entity.start_y = card_entity.y;
	card_entity.target_x = target_x;
	card_entity.target_y = target_y;
	card_entity.move_duration = move_duration;
	card_entity.start_moving = true;
	card_entity.move_delay = move_delay + 1;
	card_entity.current_step = 0;
}

function draw_card(card_entity, start_x, start_y, target_x, target_y, move_duration, move_delay)
{
	card_entity.start_x = start_x;
	card_entity.start_y = start_y;
	card_entity.target_x = target_x;
	card_entity.target_y = target_y;
	card_entity.move_duration = move_duration;
	card_entity.start_moving = true;
	card_entity.move_delay = move_delay + 1;
	card_entity.current_step = 0;
	
	card_entity.disgarded = false;
}
function draw_card_from_cardxy(card_entity, target_x, target_y, move_duration, move_delay)
{
	card_entity.start_x = card_entity.x;
	card_entity.start_y = card_entity.y;
	card_entity.target_x = target_x;
	card_entity.target_y = target_y;
	card_entity.move_duration = move_duration;
	card_entity.start_moving = true;
	card_entity.move_delay = move_delay + 1;
	card_entity.current_step = 0;
	
	card_entity.disgarded = false;
}
function discard_card(card_entity, start_x, start_y, target_x, target_y, move_duration, move_delay)
{
	card_entity.start_x = start_x;
	card_entity.start_y = start_y;
	card_entity.target_x = target_x;
	card_entity.target_y = target_y;
	card_entity.move_duration = move_duration;
	card_entity.start_moving = true;
	card_entity.move_delay = move_delay + 1;
	card_entity.current_step = 0;
	
	card_entity.disgarded = true;
}
function disgard_card_from_cardxy(card_entity, target_x, target_y, move_duration, move_delay)
{
	card_entity.start_x = card_entity.x;
	card_entity.start_y = card_entity.y;
	card_entity.target_x = target_x;
	card_entity.target_y = target_y;
	card_entity.move_duration = move_duration;
	card_entity.start_moving = true;
	card_entity.move_delay = move_delay + 1;
	card_entity.current_step = 0;
	
	card_entity.disgarded = true;
}
function play_card(cards_manager, card_entity, played_pos_x, played_pos_y, move_duration, move_delay)
{
	card_entity.start_x = card_entity.x;
	card_entity.start_y = card_entity.y;
	card_entity.target_x = played_pos_x;
	card_entity.target_y = played_pos_y;
	card_entity.move_duration = move_duration;
	card_entity.start_moving = true;
	card_entity.move_delay = move_delay + 1;
	card_entity.current_step = 0;
	
	cards_manager.player_played_card = true;
	cards_manager.player_played_card_type = card_entity.card_type;
}
function play_opponent_card(cards_manager, card_entity, played_pos_x, played_pos_y, move_duration, move_delay)
{
	card_entity.start_x = card_entity.x;
	card_entity.start_y = card_entity.y;
	card_entity.target_x = played_pos_x;
	card_entity.target_y = played_pos_y;
	card_entity.move_duration = move_duration;
	card_entity.start_moving = true;
	card_entity.move_delay = move_delay + 1;
	card_entity.current_step = 0;
	
	card_entity.made_opponent_selection = true;
	
	cards_manager.opponent_played_card = true;
	cards_manager.opponent_played_card_type = card_entity.card_type;
	
	cards_manager.alarm[global.DISCARDCARDS] = move_duration + move_delay;
}