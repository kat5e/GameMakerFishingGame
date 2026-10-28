enum fish_state { casting, waiting, bite, minigame, decision, escaped }

global.fishing_active = false;
global.fishing_cooldown = 0;

//weight = how common they are summed to 100
//speed = how fast it darts
//drain = how fast progress is lost

global.fish_db = [
    { name: "Sardine",		weight: 16, speed: 2.0, drain: 0.25, value: 10 },
    { name: "Flounder",		weight: 16, speed: 2.8, drain: 0.35, value: 10 },
    { name: "Mackerel",		weight: 16, speed: 3.5, drain: 0.45, value: 10 },
    { name: "Lionfish",		weight: 16,  speed: 4.5, drain: 0.55, value: 10 },
	{ name: "Parrotfish",	weight: 9, speed: 3.5, drain: 0.45, value: 50 },
	{ name: "Pufferfish",	weight: 9, speed: 3.5, drain: 0.45, value: 50 },
	{ name: "Angelfish",	weight: 9, speed: 3.5, drain: 0.45, value: 50 },
	{ name: "Tuna",			weight: 4, speed: 3.5, drain: 0.45, value: 100 },
	{ name: "Clownfish",	weight: 4, speed: 3.5, drain: 0.45, value: 100 },
	{ name: "Anglerfish",	weight: 1, speed: 3.5, drain: 0.45, value: 200 }
];

function fish_pick_random_id() {
    var _total = 0;
    for (var i = 0; i < array_length(global.fish_db); i++) _total += global.fish_db[i].weight;

    var _roll = random(_total);
    for (var i = 0; i < array_length(global.fish_db); i++)
    {
        _roll -= global.fish_db[i].weight;
        if (_roll <= 0) return i;
    }
    return 0;
}