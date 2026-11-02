global.day = 1;
global.earned_today = 0;
global.fines_pending = 0;
global.sleep_active = false;
global.illegal_fine_mult = 1.5; //fine = fish value times this
global.sleep_min_time = 0.75;   //sleep unlocks 3/4 through the day
global.day_start_hour = 6;      //day starts at 6:00 AM
global.day_length_hours = 18;	//day ends at 12:00 AM

function day_expenses(_day)
{
    return 25 + (_day - 1) * 5;   //currently increases by 5 per day, will essentially determine difficulty
}

function is_day_over() {
    return instance_exists(obj_daynight) && obj_daynight.time_of_day >= 1;
}

function fish_is_illegal(_id) {
    var _f = global.fish_db[_id];
    return variable_struct_exists(_f, "illegal") && _f.illegal;
}

function time_to_clock(_t) {
    var _mins = floor((global.day_start_hour + _t * global.day_length_hours) * 60);
    _mins = floor(_mins / 10) * 10;                 //snap to 10-minute steps

    var _h24 = (_mins div 60) mod 24;
    var _m   = _mins mod 60;
    var _h12 = _h24 mod 12;
    if (_h12 == 0) _h12 = 12;

    return string(_h12) + ":" + ((_m < 10) ? "0" : "") + string(_m) + ((_h24 >= 12) ? " PM" : " AM");
}

function can_sleep() {
    return instance_exists(obj_daynight) && obj_daynight.time_of_day >= global.sleep_min_time;
}

//This is where the end of day dialogue goes
//one array of lines per day, replace text with lore once it is provided
function get_day_dialogue(_day) {
    switch (_day) {
        case 1: return [
            "Day 1 complete",
            "Wow look at all of this juicy lore.",
			"If I didn't want to stay the first night, why would I stay any more than five.",
			"Why would I stay more than two, hello?"
        ];
        case 2: return [
            "Juicy juicy lore.",
            "Something about some fish being illegal to sell.",
			"And they're fining you for it??",
			"Rude."
        ];
        // case 3: ...
    }
    return ["Repeating message down here.", "This message will keep popping up after there is no more specific text above."];
}