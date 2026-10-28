var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

hover = point_in_rectangle(_mx, _my, x, y, x + sprite_width, y + sprite_height);

if (hover && mouse_check_button_pressed(mb_left)) {
    var _total = 0, _count = 0, _fines = 0;

    if (instance_exists(obj_inventory)) {
        for (var i = 0; i < INVENTORY_SLOTS; i++) {
            var _id = obj_inventory.inventory[i];

            if (_id >= 0 && _id < array_length(global.fish_db)) {
                var _val = global.fish_db[_id].value;
                _total += _val;
                _count++;
                if (fish_is_illegal(_id)) _fines += floor(_val * global.illegal_fine_mult);
                obj_inventory.inventory[i] = -1;
            }
        }
    }

    global.money += _total;
    global.earned_today += _total;
    global.fines_pending += _fines;

    if (instance_exists(panel)) {
        panel.sell_msg = (_count > 0)
            ? "Sold " + string(_count) + " fish for $" + string(_total)
            : "You have nothing to sell.";
    }
}