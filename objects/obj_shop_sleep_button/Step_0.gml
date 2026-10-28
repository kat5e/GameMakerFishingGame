var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

hover = point_in_rectangle(_mx, _my, x, y, x + sprite_width, y + sprite_height);

//right now sleeping just resets the daynight shader to be morning
//more code can be added to move to the end of day room 
//and then display text for the story before returning to the game
if (hover && mouse_check_button_pressed(mb_left)) {
    instance_create_depth(0, 0, -2000, obj_sleep_sequence);
    instance_destroy(obj_shop_panel);
}