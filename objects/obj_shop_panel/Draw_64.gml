var _w = 400, _h = 300;
var _x = (display_get_gui_width()  - _w) / 2;
var _y = (display_get_gui_height() - _h) / 2;

draw_sprite(spr_shop_ui_box, 0, panel_x, panel_y);

draw_text(panel_x + 16, panel_y + 16, "Fish Shop");
draw_text(panel_x + 16, panel_y + panel_h - 32, "Press E to close");
draw_text(panel_x + panel_w - 140, panel_y + 16, "Money: $" + string(global.money));
if (sell_msg != "") {
    draw_text(panel_x + 16, panel_y + panel_h - 120, sell_msg);
}