var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);
hover = point_in_rectangle(_mx, _my, x, y, x + sprite_width, y + sprite_height);

if (hover && mouse_check_button_pressed(mb_left)) {
    var _msg = "";

    if (upgrade_maxed(key)) {
        _msg = global.upgrade_defs[$ key].name + " is already maxed out.";
    }
    else {
        var _cost = upgrade_cost(key);
        if (global.money >= _cost) {
            global.money -= _cost;
            global.upgrades[$ key]++;
            _msg = "Upgraded " + global.upgrade_defs[$ key].name + " to level " + string(upgrade_level(key)) + ".";
        }
        else {
            _msg = "Not enough money. You need $" + string(_cost) + ".";
        }
    }
    if (instance_exists(panel)) panel.sell_msg = _msg;
}