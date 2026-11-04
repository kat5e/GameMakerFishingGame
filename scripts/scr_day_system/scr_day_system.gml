global.day = 1;
global.start_money = 0; 
global.earned_today = 0;
global.fines_pending = 0;
global.bonus_pending = 0;
global.sleep_active = false;
global.illegal_fine_mult = 1.5; //fine = fish value times this
global.invasive_bonus_mult = 1.5;
global.sleep_min_time = 0.75;   //sleep unlocks 3/4 through the day
global.day_start_hour = 6;      //day starts at 6:00 AM
global.day_length_hours = 18;	//day ends at 12:00 AM

function day_expenses(_day)
{
    return 10 + (_day - 1) * 15;   //currently increases by 15 per day, will essentially determine difficulty
}

function is_day_over() {
    return instance_exists(obj_daynight) && obj_daynight.time_of_day >= 1;
}

function fish_is_illegal(_id) {
    var _f = global.fish_db[_id];
    return variable_struct_exists(_f, "illegal") && _f.illegal;
}

function fish_is_invasive(_id) {
    var _f = global.fish_db[_id];
    return variable_struct_exists(_f, "invasive") && _f.invasive;
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

function reset_run()
{
    global.day = 1;
    global.money = global.start_money;
    global.earned_today = 0;
    global.fines_pending = 0;
	global.bonus_pending = 0;

    global.upgrades = { pole: 0, line: 0, bobber: 0 };

    global.sleep_active = false;
    global.fishing_active = false;
    global.shop_open = false;
    global.fishing_cooldown = 0;
    global.shop_cooldown = 0;

    if (instance_exists(obj_daynight)) obj_daynight.time_of_day = 0;

    if (instance_exists(obj_inventory))
    {
        for (var i = 0; i < INVENTORY_SLOTS; i++) obj_inventory.inventory[i] = -1;
    }
}

//This is where the end of day dialogue goes
//one array of lines per day, replace text with lore once it is provided
function get_day_dialogue(_day) {
    switch (_day) {
        case 1: return [
            "Day 1 complete",
            "The light inside swayed faintly in the damp, cold draft, stretching your shadow long across the wet, peeling wall.",
			"Twenty years ago, in this room, your father would usually drag back baskets of fish around this time. His arms were thick as an old ship’s rudder then, and he was still healthy.",
			"He had once pressed a fish-boning knife into your young palm and patted your shoulder in the morning mist: “The sea won’t shortchange those who respect it, kid.”",
			"You still remembered those words."
        ];
        case 2: return [
            "Day 2 complete",
            "You found your father’s old logbook in the house. The dates stopped at a day five years ago.",
			"In his notes, he complained in pencil that the ocean-going ships refused to return even pregnant female fish to the sea, and he had begun to worry about the future of marine life.",
			"He was wise—you had always known that—but you had never imagined that he had foreseen today’s overfishing problem years ago."
        ];
        case 3: return [
            "Day 3 complete",
            "It began to drizzle tonight, and you closed the window.",
			"In his later years, your father had always been silent. He spent more and more time on fishing, but most of what he brought back from each trip was discarded nylon rope, along with deformed catches whose bellies were stuffed with plastic particles."
        ];
		case 4: return [
            "Day 4 complete",
            "When you were young, your father told you that the fishermen here followed a certain unspoken principle: during spawning season, they did not use deep nets, and fish smaller than three fingers wide had to be returned to the water.",
			"But later, big companies’ electric pulse trawlers entered the no-fishing zone. The electrodes stunned and floated up all life on the seabed, catching everything in one net regardless of size.",
			" Not a single fish washed up on the beach, because there was nothing left in these waters to kill."
        ];
		case 5: return [
            "Day 5 complete",
            "Now the night wind always carried the smell of heavy oil from the ocean fishing boats miles away. Those engines roared late into the night like tireless giant beasts.",
			"You tried to remember the smell you had smelled while playing on the dock as a child, but found that you had long since pushed that smell out of your mind."
        ];
    }
    return ["It is getting harder and harder to continue a life of fishing in these conditions..."];
}