//the cooldown is put in place since the shop was opening and closing on the same button press
if (!variable_global_exists("shop_cooldown")) global.shop_cooldown = 0; 

if (global.shop_cooldown > 0) global.shop_cooldown--;

if (global.shop_open || global.shop_cooldown > 0) {
    can_interact = false;
    exit;
}

can_interact = (instance_exists(Object1) && distance_to_object(Object1) <= interact_range);

if (can_interact && keyboard_check_pressed(ord("E"))) {
    instance_create_depth(0, 0, -1000, obj_shop_panel);
}