var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

hover = point_in_rectangle(_mx, _my, x, y, x + sprite_width, y + sprite_height);
locked = !can_sleep();

if (hover && mouse_check_button_pressed(mb_left)) {
    if (locked) {
		if (instance_exists(panel)) panel.sell_msg = "You can sleep after " + time_to_clock(global.sleep_min_time) + ".";
    }
    else {
        instance_create_depth(0, 0, -2000, obj_sleep_sequence);
        instance_destroy(obj_shop_panel);
    }
}