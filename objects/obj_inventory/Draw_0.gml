draw_sprite_stretched
    (
    spr_ui_box,
    0,
    x-6,
    y-6,
    12+rowlength*36,
    12+(((INVENTORY_SLOTS-1)  div rowlength) +1) * 36
);

for (var i = 0; i < INVENTORY_SLOTS; i += 1)
{
    var xx = x + (i mod rowlength) * 36 + 2;
    var yy = y + (i div rowlength) * 36 + 2;
    draw_sprite(spr_ui_button, 0, xx, yy)
    if (inventory[i] != -1) {
        draw_sprite(spr_item_icons, inventory[i], xx, yy);
    }
}