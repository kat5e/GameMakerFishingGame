if (window_get_width() != winw || window_get_height() != winh) {
    display_set_gui_maximise();
}


var _right = real(keyboard_check(ord("D"))) || (keyboard_check(vk_right)); 
var _left= real(keyboard_check(ord("A"))) || (keyboard_check(vk_left));
var _down = real(keyboard_check(ord("S")))  || (keyboard_check(vk_down));
var _up = real(keyboard_check(ord("W")))  || (keyboard_check(vk_up));
var _hor = _right - _left;
var _ver = _down - _up;


move_and_collide(_hor * move_speed, _ver * move_speed, tilemap, undefined, undefined, undefined, move_speed, move_speed);

if (_ver != 0 or _hor != 0) {
    if  (_ver  >  0)  sprite_index = spr_player_walk_down;
        else if (_ver < 0) sprite_index = spr_player_walk_up;
            else if (_hor > 0) sprite_index = spr_player_walk_right;
                else if(_hor < 0) sprite_index = spr_player_walk_left;
} else {
    if (sprite_index == spr_player_walk_right) sprite_index = spr_player_idle_right;
        else if (sprite_index == spr_player_walk_left) sprite_index = spr_player_idle_left;
        else if (sprite_index == spr_player_walk_up) sprite_index = spr_player_idle_up;
        else if (sprite_index == spr_player_walk_down) sprite_index = spr_player_idle_down;
    }

x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);   