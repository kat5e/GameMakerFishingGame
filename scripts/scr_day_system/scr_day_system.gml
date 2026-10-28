global.day = 1;
global.earned_today = 0;
global.fines_pending = 0;
global.sleep_active = false;
global.illegal_fine_mult = 2.0;   //fine = fish value times this

function day_expenses(_day)
{
    return 50 + (_day - 1) * 10;   //currently increases by 10 per day, will essentially determine difficulty
}

function is_day_over() {
    return instance_exists(obj_daynight) && obj_daynight.time_of_day >= 1;
}

function fish_is_illegal(_id) {
    var _f = global.fish_db[_id];
    return variable_struct_exists(_f, "illegal") && _f.illegal;
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