if (global.sleep_active) exit;

var _gw = display_get_gui_width();
var _t = clamp(time_of_day, 0, 1);
var _px = _gw - 200;
var _py = 12;
var _pw = 188;
var _ph = 104;
var _bx = _px + 10;
var _bw = _pw - 20;

//panel
draw_set_color(c_black);
draw_set_alpha(0.6);
draw_rectangle(_px, _py, _px + _pw, _py + _ph, false);
draw_set_alpha(1);

//white normally, orange once you can sleep, red when the day is over
var _tcol = c_white;
if (_t >= 1) _tcol = c_red;
else if (can_sleep()) _tcol = c_orange;

//day clock
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_text(_px + 10, _py + 8, "Day " + string(global.day));
draw_set_halign(fa_right);
draw_set_color(_tcol);
draw_text(_px + _pw - 10, _py + 8, time_to_clock(_t));

//day progress bar
var _by = _py + 36;
draw_set_color(c_dkgray);
draw_rectangle(_bx, _by, _bx + _bw, _by + 10, false);
draw_set_color(_tcol);
draw_rectangle(_bx, _by, _bx + _bw * _t, _by + 10, false);

var _sx = _bx + _bw * global.sleep_min_time;   //sleep-unlock mark
draw_set_color(c_white);
draw_line(_sx, _by - 3, _sx, _by + 13);

//money
var _exp = day_expenses(global.day);

draw_set_halign(fa_left);
draw_set_color(c_white);
draw_text(_px + 10, _py + 58, "Money");
draw_text(_px + 10, _py + 78, "Expenses");

draw_set_halign(fa_right);
draw_set_color(c_white);
draw_text(_px + _pw - 10, _py + 58, "$" + string(global.money));
draw_set_color(c_red);
draw_text(_px + _pw - 10, _py + 78, "-$" + string(_exp));


draw_set_halign(fa_left);
draw_set_color(c_white);
draw_set_alpha(1);