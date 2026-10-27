global.shop_open = true;
just_opened = true;

panel_w = sprite_get_width(spr_shop_ui_box);
panel_h = sprite_get_height(spr_shop_ui_box);
panel_x = (display_get_gui_width()  - panel_w) / 2;
panel_y = (display_get_gui_height() - panel_h) / 2;

//button layout: object + offset from the panel's top-left corner
//all buttons can be drawn from this array with their own object
buttons = [
    { obj: obj_shop_sleep_button, ox: 16, oy: 60 },
    //{ obj: obj_shop_buy_button, ox: 16, oy: 120 },
];

for (var i = 0; i < array_length(buttons); i++)
{
    var _b = buttons[i];
    instance_create_depth(panel_x + _b.ox, panel_y + _b.oy, -1001, _b.obj);
}