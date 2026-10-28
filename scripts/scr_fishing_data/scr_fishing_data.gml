enum fish_state { casting, waiting, bite, minigame, decision, escaped }

global.fishing_active = false;
global.fishing_cooldown = 0;
global.money = 0;

//weight = how common they are summed to 100
//speed = how fast it darts in the minigame
//drain = how fast progress is lost in the minigame

global.fish_db = [
    { name: "Sardine",		weight: 16, speed: 2.5, drain: 0.35, value: 10 },
    { name: "Flounder",		weight: 16, speed: 2.5, drain: 0.35, value: 10 },
    { name: "Mackerel",		weight: 16, speed: 2.5, drain: 0.35, value: 10 },
    { name: "Lionfish",		weight: 16,  speed: 2.5, drain: 0.35, value: 10, illegal: true },
	{ name: "Parrotfish",	weight: 9, speed: 3.5, drain: 0.5, value: 20 },
	{ name: "Pufferfish",	weight: 9, speed: 3.5, drain: 0.5, value: 20, illegal: true },
	{ name: "Angelfish",	weight: 9, speed: 3.5, drain: 0.5, value: 20 },
	{ name: "Tuna",			weight: 4, speed: 4.5, drain: 0.7, value: 75 },
	{ name: "Clownfish",	weight: 4, speed: 4.5, drain: 0.7, value: 75, illegal: true },
	{ name: "Anglerfish",	weight: 1, speed: 5.5, drain: 0.8, value: 200 }
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