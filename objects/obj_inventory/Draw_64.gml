x = 370;
y = 640;
draw_sprite_stretched
    (
    spr_ui_back,
    0,
    x-6,
    y-6,
    24+rowlength*36,
    24+(((INVENTORY_SLOTS-1)  div rowlength) +1) * 36
);

for (var i = 0; i < INVENTORY_SLOTS; i += 1)
{
    var xx = x + ((i mod rowlength) * 36);
    var yy = y + ((i div rowlength) * 36 );
    draw_sprite(spr_ui_button, 0, (xx), (yy))
    if (inventory[i] != -1){
        draw_sprite(spr_item_icons, inventory[i], (xx+20),(yy+20));
    }
}