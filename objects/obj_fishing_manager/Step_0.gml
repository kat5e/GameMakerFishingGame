switch (current_state) {

    case fish_state.idle:
        // Press Space to cast the line
        if (keyboard_check_pressed(vk_space)) {
            // Trigger casting animation here if you have one
            current_state = fish_state.casting;

            // Set a random wait time for a bite (e.g., 2 to 6 seconds)
            bite_timer = game_get_speed(gamespeed_fps) * random_range(2, 6);
        }
        break;

    case fish_state.casting:
        // Simulate a brief casting delay before the hook hits the water
        // If using an animation, check if image_index == image_number - 1
        current_state = fish_state.waiting; 
        break;

    case fish_state.waiting:
        // Count down until a fish bites
        bite_timer--;

        if (bite_timer <= 0) {
            current_state = fish_state.bite;
            reaction_timer = reaction_window;
            // Play an exclamation sound or visual effect here!
        }
        break;

    case fish_state.bite:
        // Count down the reaction window
        reaction_timer--;

        // If player taps Space in time, they trigger the mini-game
        if (keyboard_check_pressed(vk_space)) {
            // Reset mini-game positions before starting
            fish_y = (track_top + track_bottom) / 2;
            bar_y = track_bottom - bar_height;
            progress = 50;

            current_state = fish_state.minigame;
        } 
        // If they take too long, the fish escapes
        else if (reaction_timer <= 0) {
            show_debug_message("Fish nibbled and got away!");
            current_state = fish_state.idle;
        }
        break;

    case fish_state.minigame:
	// --- 1. Move Fish Smoothly ---
        fish_timer--;
        if (fish_timer <= 0) {
            fish_target_y = random_range(track_top + 20, track_bottom - 20);
            fish_timer = game_get_speed(gamespeed_fps) * random_range(1, 3); // Pick new target every 1-3 seconds
        }
        var diff = fish_target_y - fish_y;
        fish_y += sign(diff) * min(abs(diff), 2.5);

        // --- 2. Player Bar Physics ---
        if (keyboard_check(vk_space)) { // Holding space lifts the bar
            bar_vel += lift_accel;
        } else {
            bar_vel += gravity_accel;
        }
        bar_vel = clamp(bar_vel, -6, 6);
        bar_y += bar_vel;

        // Clamp bar boundaries
        if (bar_y < track_top) { bar_y = track_top; bar_vel = 0; }
        if (bar_y > track_bottom - bar_height) { bar_y = track_bottom - bar_height; bar_vel = 0; }

        // --- 3. Overlap & Progress Logic ---
        var fish_in_bar = (fish_y >= bar_y && fish_y <= (bar_y + bar_height));
        if (fish_in_bar) {
            progress += catch_rate;
        } else {
            progress -= drain_rate;
        }
        progress = clamp(progress, 0, 100);

        // --- 4. Win/Lose Outcomes ---
        if (progress >= 100) {
            show_debug_message("You caught a fish!");
            // Reward the player with an item here
            current_state = fish_state.idle;
        } else if (progress <= 0) {
            show_debug_message("The fish got away!");
            current_state = fish_state.idle;
        }
        break;
}