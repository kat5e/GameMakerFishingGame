var _cx = gw / 2;
draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(_cx, gh * 0.1, "Oh no a trawling boat is nearby");
draw_text(_cx, gh * 0.1, "There are no fish to catch until it leaves the harbor");
if (trawl_timer <= 0){
    draw_text(_cx, gh * 0.1, "The Trawling Boat has left the area");
}