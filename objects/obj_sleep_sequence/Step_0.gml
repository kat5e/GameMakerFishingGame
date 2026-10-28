fade = min(1, fade + 0.05);

if (input_delay > 0) { input_delay--; exit; }

var _adv = keyboard_check_pressed(vk_space)
        || keyboard_check_pressed(vk_enter)
        || mouse_check_button_pressed(mb_left);

switch (state)
{
    case "dialogue":
        var _len = string_length(lines[line_index]);
        if (char_count < _len)
        {
            char_count += type_speed;
            if (_adv) char_count = _len; //first press finishes the line
        }
        else if (_adv) //next press advances
        {
            line_index++;
            char_count = 0;
            if (line_index >= array_length(lines)) start_summary();
        }
        break;

    case "summary":
        if (_adv)
        {
            if (global.money < 0) state = "gameover";
            else end_day();
        }
        break;

    case "gameover":
        if (_adv) game_restart();
        break;
}