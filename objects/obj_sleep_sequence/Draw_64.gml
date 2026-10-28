var _cx = gw / 2;

draw_set_color(c_black);
draw_set_alpha(fade);
draw_rectangle(0, 0, gw, gh, false);
draw_set_alpha(fade);
draw_set_color(c_white);
draw_set_halign(fa_center);

switch (state)
{
    case "dialogue":
        var _shown = string_copy(lines[line_index], 1, floor(char_count));
        draw_text_ext(_cx, gh * 0.4, _shown, 28, gw * 0.6);
        if (char_count >= string_length(lines[line_index]) && (current_time div 500) mod 2 == 0)
            draw_text(_cx, gh * 0.85, "Press Space to continue");
        break;

    case "summary":
        draw_text(_cx, gh * 0.2, "Day " + string(global.day) + " Summary");

        var _rows = [
            ["Money earned",        "+$" + string(earned)],
            ["Illegal catch fines", "-$" + string(fines)],
            ["Daily expenses",      "-$" + string(expenses)]
        ];
        var _y = gh * 0.35;
        for (var i = 0; i < array_length(_rows); i++)
        {
            draw_set_halign(fa_left);
            draw_text(_cx - 160, _y, _rows[i][0]);
            draw_set_halign(fa_right);
            draw_text(_cx + 160, _y, _rows[i][1]);
            _y += 32;
        }

        draw_set_halign(fa_left);
        draw_text(_cx - 160, _y + 16, "Balance");
        draw_set_halign(fa_right);
        draw_set_color(global.money < 0 ? c_red : c_lime);
        draw_text(_cx + 160, _y + 16, "$" + string(global.money));

        draw_set_halign(fa_center);
        draw_set_color(c_white);
        draw_text(_cx, gh * 0.85, "Press Space to continue");
        break;

    case "gameover":
        draw_set_color(c_red);
        draw_text(_cx, gh * 0.4, "GAME OVER");
        draw_set_color(c_white);
        draw_text(_cx, gh * 0.5, "You couldn't pay your debts.");
        draw_text(_cx, gh * 0.85, "Press Space to restart");
        break;
}

draw_set_halign(fa_left);
draw_set_color(c_white);
draw_set_alpha(1);