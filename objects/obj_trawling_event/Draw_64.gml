var _gw = display_get_gui_width();
var _gh = display_get_gui_height();
var _cx = _gw / 2;

draw_set_halign(fa_center);
draw_set_valign(fa_top);

if (trawl_timer > 5) {
    var _line1 = "Oh no a trawling boat is nearby";
    var _line2 = "There are no fish to catch until it leaves the harbor";
    
    var _text_w = max(string_width(_line1), string_width(_line2)) + 32; 
    var _text_h = 14 + string_height(_line2) + 24; 
    
    var _y1 = (_gh * 0.1) - 12;
    var _y2 = _y1 + _text_h;
    var _x1 = _cx - (_text_w / 2);
    var _x2 = _cx + (_text_w / 2);
    
    draw_set_color(c_black);
    draw_set_alpha(0.85); 
    draw_rectangle(_x1, _y1, _x2, _y2, false);
    draw_set_alpha(1.0); 
    
    draw_set_color(c_white);
    draw_text(_cx, _gh * 0.1, _line1);
    draw_text(_cx, (_gh * 0.1) + 14, _line2);

} else if (trawl_timer > 0) {
    var _line1 = "The Trawling Boat has left the nearby area";
    
    var _text_w = string_width(_line1) + 32;
    var _text_h = string_height(_line1) + 24;
    
    var _y1 = (_gh * 0.1) - 12;
    var _y2 = _y1 + _text_h;
    var _x1 = _cx - (_text_w / 2);
    var _x2 = _cx + (_text_w / 2);
    
    draw_set_color(c_black);
    draw_set_alpha(0.85);
    draw_rectangle(_x1, _y1, _x2, _y2, false);
    draw_set_alpha(1.0);
    
    draw_set_color(c_white);
    draw_text(_cx, _gh * 0.1, _line1);
}
