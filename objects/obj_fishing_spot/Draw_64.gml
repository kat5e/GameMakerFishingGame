draw_set_halign(fa_center);
var _y = display_get_gui_height() - 128;

if (can_interact) 
	draw_text(display_get_gui_width() / 2, _y, "Press E to fish");
else if (near && is_day_over() && !global.sleep_active) 
	draw_text(display_get_gui_width() / 2, _y, "It's too late to fish. Go sleep.");

draw_set_halign(fa_left);