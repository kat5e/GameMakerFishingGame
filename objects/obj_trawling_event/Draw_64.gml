var _gw = display_get_gui_width();
var gh = display_get_gui_height();
var _cx = _gw / 2;
draw_set_halign(fa_center);
draw_set_color(c_white);
if (trawl_timer > 5){
draw_text(_cx, gh * 0.1, "Oh no a trawling boat is nearby");
draw_text(_cx, (gh * 0.1) + 14, "There are no fish to catch until it leaves the harbor");
}
else if (trawl_timer > 0) {
    draw_text(_cx, gh * 0.1, "The Trawling Boat has left the nearby area");
}