if (global.fishing_cooldown > 0) global.fishing_cooldown--;

if (global.fishing_active || global.shop_open || global.fishing_cooldown > 0) {
    can_interact = false;
    exit;
}

can_interact = (instance_exists(Object1) && distance_to_object(Object1) <= interact_range);

if (can_interact && keyboard_check_pressed(ord("E"))) {
    global.fishing_active = true;
    instance_create_depth(0, 0, -1000, obj_fishing_manager);
    Object1.sprite_index = spr_fish_down;
}