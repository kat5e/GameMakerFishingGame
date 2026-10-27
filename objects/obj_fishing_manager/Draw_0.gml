// 1. Draw temporary text placeholder for the stationary player character
draw_set_color(c_white);
draw_text(100, 100, "Fishing Spot Active");

// 2. Draw visual context cues based on current state
switch (current_state) {
    case fish_state.waiting:
        draw_text(100, 130, "Bobber is in the water... waiting...");
        break;

    case fish_state.bite:
        draw_set_color(c_red);
        draw_text(100, 130, "HIT! PRESS SPACE QUICKLY!");
        break;

    case fish_state.minigame:
        // --- Render the mini-game graphical panels from our previous step ---
        // Background track
        draw_set_color(c_darkgray);
        draw_rectangle(room_width/2 - 30, track_top, room_width/2 + 30, track_bottom, false);

        // Green player slider bar
        draw_set_color(c_lime);
        draw_rectangle(room_width/2 - 25, bar_y, room_width/2 + 25, bar_y + bar_height, false);

        // Fish icon
        draw_set_color(c_aqua);
        draw_circle(room_width/2, fish_y, 10, false);

        // Side progress background
        draw_set_color(c_gray);
        draw_rectangle(room_width/2 + 50, track_top, room_width/2 + 70, track_bottom, false);

        // Filled catching progress
        var prog_height = (progress / 100) * track_height;
        draw_set_color(c_yellow);
        draw_rectangle(room_width/2 + 50, track_bottom - prog_height, room_width/2 + 70, track_bottom, false);
        break;
}