var _cx = gw / 2;
draw_set_halign(fa_center);
draw_set_color(c_white);

switch (current_state) {

    case fish_state.casting:
        draw_text(_cx, gh * 0.1, "Casting...");
        break;

    case fish_state.waiting:
        draw_text(_cx, gh * 0.1, "Waiting for a bite...   (Q to reel in)");
        break;

    case fish_state.bite:
        draw_set_color(c_red);
        draw_text(_cx, gh * 0.1, "! ! !  PRESS SPACE  ! ! !");
        break;

    case fish_state.minigame:
        // Track
        draw_set_color(c_dkgray);
        draw_rectangle(track_x - 30, track_top, track_x + 30, track_bottom, false);
        // Player bar
        draw_set_color(c_lime);
        draw_rectangle(track_x - 25, bar_y, track_x + 25, bar_y + bar_height, false);
        // Fish
        if (sprite_exists(spr_item_icons)) {
		    draw_sprite(spr_item_icons, current_fish_id, track_x, fish_y);
		} 
		else {
		    draw_set_color(c_aqua);
		    draw_circle(track_x, fish_y, 10, false);
		}
        // Progress meter
        draw_set_color(c_gray);
        draw_rectangle(track_x + 50, track_top, track_x + 70, track_bottom, false);
        draw_set_color(c_yellow);
        var _ph = (progress / 100) * track_height;
        draw_rectangle(track_x + 50, track_bottom - _ph, track_x + 70, track_bottom, false);
        break;

    case fish_state.decision:
        draw_set_color(c_black);
        draw_set_alpha(0.85);
        draw_rectangle(_cx - 180, gh/2 - 80, _cx + 180, gh/2 + 80, false);
        draw_set_alpha(1);
        draw_set_color(c_white);
        draw_rectangle(_cx - 180, gh/2 - 80, _cx + 180, gh/2 + 80, true);
        draw_text(_cx, gh/2 - 55, "You caught a " + current_fish.name + "!");
        draw_text(_cx, gh/2 - 10, "[E] Keep        [Q] Release");
        if (inventory_full) {
            draw_set_color(c_red);
            draw_text(_cx, gh/2 + 35, "Inventory full! Release it.");
        }
        break;

    case fish_state.escaped:
        draw_text(_cx, gh * 0.1, result_msg);
        break;
}

// reset draw state
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_set_alpha(1);