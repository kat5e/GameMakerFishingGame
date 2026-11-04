var _d = global.upgrade_defs[$ key];
var _maxed = upgrade_maxed(key);
var _afford = !_maxed && global.money >= upgrade_cost(key);

var _col = (_maxed || !_afford) ? c_dkgray : (hover ? c_ltgray : c_white);
draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, _col, 1);

//label to the right of the button
var _tx = x + sprite_width + 12;
draw_set_halign(fa_left);
draw_set_color(c_white);
draw_text(_tx, y, _d.name + "  Lvl " + string(upgrade_level(key)) + "/" + string(_d.max));

draw_set_color(c_ltgray);
draw_text(_tx, y + 20, _d.desc);

if (_maxed) draw_set_color(c_yellow);
else draw_set_color(_afford ? c_lime : c_red);
draw_text(_tx, y + 40, _maxed ? "MAX" : "$" + string(upgrade_cost(key)));

draw_set_color(c_white);