enum fish_state {
    idle,
    casting,
    waiting,
    bite,
    minigame
}
current_state = fish_state.idle;

bite_timer = 0;
reaction_timer = 0;
reaction_window = game_get_speed(gamespeed_fps) * 1.0; //players have 1.0 seconds to react to a fish bite

track_top = 200;
track_bottom = 680;
track_height = track_bottom - track_top;

fish_y = (track_top + track_bottom) / 2;
fish_target_y = fish_y;
fish_timer = 0; 

bar_y = track_bottom;
bar_height = 120;
bar_vel = 0;
gravity_accel = 0.4;
lift_accel = -0.8;

progress = 50;
catch_rate = 0.5;
drain_rate = 0.35;