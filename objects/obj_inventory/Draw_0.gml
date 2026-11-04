for (var i = 0; i < INVENTORY_SLOTS; i += 1)
{
    var xx = x + (i mod rowlength) * 36 + 2;
    var yy = y + (i div rowlength) * 36 + 2;
    draw_sprite(spr_inventory_boxes, -1, xx, yy)
    if (inventory[i] != -1) {
        draw_sprite(spr_item_icons, inventory[i], xx, yy);
    }
}