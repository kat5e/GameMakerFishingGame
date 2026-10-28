var _fps = game_get_speed(gamespeed_fps);
gw = display_get_gui_width();
gh = display_get_gui_height();

current_state = fish_state.casting;
current_fish = undefined;
current_fish_id = -1;

cast_timer = _fps * 0.5;
bite_timer = 0;
reaction_window = _fps * 1.0; //1 second to react to bite
reaction_timer = 0;

result_msg = "";
result_timer = 0;
inventory_full = false;

//minigame layout (GUI coordinates)
track_x = gw / 2;
track_top = gh * 0.2;
track_bottom = gh * 0.8;
track_height = track_bottom - track_top;

fish_y = (track_top + track_bottom) / 2;
fish_target_y = fish_y;
fish_timer = 0;
fish_speed = 2.5;

//physics of the bar
bar_height = track_height * 0.25;
bar_y = track_bottom - bar_height;
bar_vel = 0;
gravity_accel = 0.4;
lift_accel = -0.8;

//these variables can easily be changed with upgrades in the future
progress = 40;
catch_rate = 0.5;
drain_rate = 0.35;

fail = function(_msg)
{
    result_msg = _msg;
    result_timer = game_get_speed(gamespeed_fps) * 1.5;
    current_state = fish_state.escaped;
}