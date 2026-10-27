draw_self();

if (can_interact) {
    draw_set_halign(fa_center);
    draw_text(x, bbox_top - 12, "Press E");
    draw_set_halign(fa_left);
}