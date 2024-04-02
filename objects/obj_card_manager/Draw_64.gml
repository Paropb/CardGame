draw_set_alpha(1);
draw_set_color(c_green);
draw_text_transformed(1450, 1200, "Player: " + string(player_point), text_x_scale, text_y_scale, 0);

draw_set_color(c_red);
draw_text_transformed(1450, 300, "Opponent: " + string(opponent_point), text_x_scale, text_y_scale, 0);

if(current_time_step > 0)
{
	current_time_step--;
}
var alpha = lerp(0, 1, current_time_step/title_persist_time);
draw_set_alpha(alpha);
draw_text_transformed_color(450, 600, "I Cut My Hands Off", text_x_scale * 2, text_y_scale * 2, 0, c_yellow, c_red, c_red, c_purple, alpha)

