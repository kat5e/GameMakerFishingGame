draw_self();

if (can_interact) { //this does not actually work yet
    draw_set_halign(fa_center);
    draw_text(x + 39, bbox_top + 20, "[E]");
    draw_set_halign(fa_left);
}