var _cx = gw / 2;
draw_set_halign(fa_center);
draw_set_color(c_white);

//this is for the fishing minigame, and currently uses this draw instead of actual assets
switch (current_state) {

    case fish_state.casting:
        draw_text(_cx, gh * 0.1, "Casting...");
        break;

    case fish_state.waiting:
        draw_text(_cx, gh * 0.1, "Waiting for a bite... (Q to reel in)");
        break;

    case fish_state.bite:
        draw_set_color(c_red);
        draw_text(_cx, gh * 0.1, "! ! !  PRESS SPACE  ! ! !");
        break;

    case fish_state.minigame:
		var _x = 300;
        //Track
        draw_set_color(c_dkgray);
        draw_rectangle(_x - 30, track_top, _x + 30, track_bottom, false);
        //Player bar
        draw_set_color(c_lime);
        draw_rectangle(_x - 25, bar_y, _x + 25, bar_y + bar_height, false);
        //Fish
        var _fspr = asset_get_index("spr_fish_generic");
		if (sprite_exists(_fspr)) {
		    draw_sprite_ext(fish_spr, 0, track_x - 200, fish_y, fish_scale, fish_scale, 0, c_white, 1);
		}
		else {
		    draw_set_color(c_blue);
		    draw_circle(track_x - 180, fish_y, 10 * fish_scale, false);
		}
        //Progress meter
        draw_set_color(c_gray);
        draw_rectangle(_x + 50, track_top, _x + 70, track_bottom, false);
        draw_set_color(c_yellow);
        var _ph = (progress / 100) * track_height;
        draw_rectangle(_x + 50, track_bottom - _ph, _x + 70, track_bottom, false);
        break;

    case fish_state.decision:
	    var _dpw = 440;                 //decision panel width
	    var _dph = 320;                 //decision panel height
	    var _l = _cx - _dpw / 2;
	    var _t = gh / 2 - _dph / 2;

	    draw_set_color(c_black);
	    draw_set_alpha(0.85);
	    draw_rectangle(_l, _t, _l + _dpw, _t + _dph, false);
	    draw_set_alpha(1);
	    draw_set_color(c_white);
	    draw_rectangle(_l, _t, _l + _dpw, _t + _dph, true);

	    draw_text(_cx, _t + 20, "You caught a " + current_fish.name + "!");

	    var _desc_y = _t + 60;
	    if (variable_struct_exists(current_fish, "illegal") && current_fish.illegal) {
	        draw_set_color(c_orange);
	        draw_text(_cx, _desc_y, "! ILLEGAL !");
	        draw_set_color(c_white);
	        _desc_y += 28;
	    }
		
		if (variable_struct_exists(current_fish, "invasive") && current_fish.invasive) {
		    draw_set_color(c_aqua);
		    draw_text(_cx, _desc_y, "! INVASIVE !");
		    draw_set_color(c_white);
		    _desc_y += 28;
		}

	    //Description
	    var _desc = variable_struct_exists(current_fish, "desc") ? current_fish.desc : "You don't recognize this fish.";
	    draw_set_color(c_ltgray);
	    draw_text_ext(_cx, _desc_y, _desc, 22, _dpw - 40);
	    draw_set_color(c_white);

	    draw_text(_cx, _t + _dph - 50, "[E] Keep        [Q] Release");
	    if (inventory_full) {
	        draw_set_color(c_red);
	        draw_text(_cx, _t + _dph - 30, "Inventory full! Release it.");
	    }
	    break;

    case fish_state.escaped:
        draw_text(_cx, gh * 0.1, result_msg);
        break;
}

//reset draw state
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_set_alpha(1);