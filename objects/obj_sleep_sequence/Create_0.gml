global.sleep_active = true;

gw = display_get_gui_width();
gh = display_get_gui_height();

state = "dialogue"; //dialogue state, then funds summary, then game over (if you lose)
fade = 0;
input_delay = 15; //ignores input for a few frames so the button click doesn't skip text

lines = get_day_dialogue(global.day);
line_index = 0;
char_count = 0;
type_speed = 0.6;

earned   = global.earned_today;
fines    = global.fines_pending;
expenses = day_expenses(global.day);

start_summary = function()
{
    global.money -= (fines + expenses);
    state = "summary";
}

end_day = function()
{
    global.day++;
    global.earned_today = 0;
    global.fines_pending = 0;
    if (instance_exists(obj_daynight)) obj_daynight.time_of_day = 0;
    instance_destroy();
}