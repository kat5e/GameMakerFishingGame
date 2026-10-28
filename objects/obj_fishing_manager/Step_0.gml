switch (current_state) {

//Determines which fish you will catch
    case fish_state.casting:
        cast_timer--;
        if (cast_timer <= 0) {
            current_fish_id = fish_pick_random_id();
			current_fish = global.fish_db[current_fish_id];
            bite_timer = game_get_speed(gamespeed_fps) * random_range(2, 10); //this range is something the time to wait... we could change it as days progress to take longer as to represent overfishing and trawling
            current_state = fish_state.waiting;
			Object1.sprite_index = spr_player_fish_down_1;
        }
        break;

//Q cancels cast
    case fish_state.waiting:
        if (keyboard_check_pressed(ord("Q"))) { 
            instance_destroy();
            break;
        }
        bite_timer--;
        if (bite_timer <= 0) {
            reaction_timer = reaction_window;
            current_state = fish_state.bite;
        }
        break;

//Uses fish stats to set up the stardew minigame
    case fish_state.bite:
        reaction_timer--;
        if (keyboard_check_pressed(vk_space)) {
			instance_create_layer(690, 170, "Instances", obj_enemy1);
            fish_speed = current_fish.speed;
            drain_rate = current_fish.drain;
            fish_y = (track_top + track_bottom) / 2;
            fish_target_y = fish_y;
            fish_timer = 0;
            bar_y = track_bottom - bar_height;
            bar_vel = 0;
            progress = 40;
            current_state = fish_state.minigame;
        } else if (reaction_timer <= 0) {
            fail("Too slow! The fish got away.");
        }
        break;

    case fish_state.minigame:
        fish_timer--;
        if (fish_timer <= 0) {
            fish_target_y = random_range(track_top + 20, track_bottom - 20); //fish moves to a random spot between the track
            fish_timer = game_get_speed(gamespeed_fps) * random_range(0.5, 2.5); //how often fish moves
        }
        var _diff = fish_target_y - fish_y;
        fish_y += sign(_diff) * min(abs(_diff), fish_speed);

        //Player bar physics
        if (keyboard_check(vk_space)) bar_vel += lift_accel;
        else bar_vel += gravity_accel;
        bar_vel = clamp(bar_vel, -6, 6);
        bar_y += bar_vel;

        if (bar_y < track_top) { bar_y = track_top; bar_vel = 0; }
        if (bar_y > track_bottom - bar_height) { bar_y = track_bottom - bar_height; bar_vel = 0; }

        //Progress bar
        var _fish_in_bar = (fish_y >= bar_y && fish_y <= bar_y + bar_height);
        progress += _fish_in_bar ? catch_rate : -drain_rate;
        progress = clamp(progress, 0, 100);

        if (progress >= 100) {
            inventory_full = false;
            current_state = fish_state.decision;
        } else if (progress <= 0) {
            fail("The " + current_fish.name + " got away!");
			instance_destroy(obj_enemy1);
        }
        break;

    case fish_state.decision:
        if (keyboard_check_pressed(ord("E"))) { //E to keep caught fish
		    if (instance_exists(obj_inventory) && InventoryAdd(obj_inventory, current_fish_id)) {
				instance_destroy();
				instance_destroy(obj_enemy1);
			}
		    else inventory_full = true; //forces release if the inventory is full
		}
        else if (keyboard_check_pressed(ord("Q"))) { //Q to release caught fish
            instance_destroy();
			instance_destroy(obj_enemy1);
        }
        break;

    case fish_state.escaped:
        result_timer--;
        if (result_timer <= 0) instance_destroy();
        break;
}