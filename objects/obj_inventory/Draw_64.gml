x = 370;
y = 640;

for (var i = 0; i < INVENTORY_SLOTS; i += 1)
{
    var xx = x + ((i mod rowlength) * 56);
    var yy = y + ((i div rowlength) * 56);
    draw_sprite_ext(spr_inventory_boxes, 0, (xx + -80), (yy), 2.5, 2.5, 0 ,c_white, 1);
}
for (var i = 0; i < INVENTORY_SLOTS; i += 1) {
    var xx = x + ((i mod rowlength) * 56);
    var yy = y + ((i div rowlength) * 56);
    if (inventory[i] != -1){
         draw_sprite_ext(spr_item_icons, inventory[i], (xx - 62) , (yy + 18), 2.5, 2.5, 0, c_white, 1);
    }
}