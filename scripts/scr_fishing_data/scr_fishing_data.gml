enum fish_state { casting, waiting, bite, minigame, decision, escaped }

global.fishing_active = false;
global.fishing_cooldown = 0;
global.money = 0;

//weight = how common they are summed to 100
//speed = how fast it darts in the minigame
//drain = how fast progress is lost in the minigame

global.fish_db = [
    { name: "Sardine",		weight: 16, speed: 2.5, drain: 0.2, value: 15, 
		desc: "Sardines feed almost exclusively on zooplankton and are mostly caught at night. Although they are not endangered, they are currently facing a major decline in population due to overfishing." },
    { name: "Flounder",		weight: 16, speed: 2.5, drain: 0.2, value: 15,
		desc: "Flounders are flat-bodied fish that dwell on the ocean floor. They are born with one eye on each side and as they age both eyes converge onto one side of the fish. Some species are threatened due to overfishing and habitat loss." },
    { name: "Mackerel",		weight: 16, speed: 2.5, drain: 0.2, value: 15,
		desc: "Mackerel live in large migrating schools and can retract their fins in order to swim faster. Due to new regulations, Mackerel are currently stable and in the process of recovering from previous overfishing." },
    { name: "Lionfish",		weight: 16,  speed: 2.5, drain: 0.2, value: 15, illegal: true,
		desc: "Lionfish are an invasive species of coral fish. They have brightly colored warning marks and have venomous spines along their dorsal fins. These fish are extremely detrimental to the biodiversity of a reef ecosystem and should not be released into the wild." },
	{ name: "Parrotfish",	weight: 9, speed: 3.5, drain: 0.3, value: 30,
		desc: "Parrotfish got their name from their parrot-like beak which they use to eat coral. Parrotfish are not currently endangered but trawling destroys the coral ecosystems that they rely on to survive." },
	{ name: "Pufferfish",	weight: 9, speed: 3.5, drain: 0.3, value: 30, illegal: true,
		desc: "Pufferfish are toxic and should only be eaten after careful preparation. Contrary to popular belief they cannot inject venom through their spines but only if they are consumed. 8% of the world's pufferfish species are considered critically endangered due to overfishing and habitat loss." },
	{ name: "Angelfish",	weight: 9, speed: 3.5, drain: 0.3, value: 30,
		desc: "When Angelfish are juveniles they are characterized by a variety of vibrant colors but when they reach maturity they become duller. Angelfish spend their lives in reef systems that are commonly destroyed by unregulated trawling." },
	{ name: "Tuna",			weight: 4, speed: 4.5, drain: 0.4, value: 75,
		desc: "Characterized by their sleek, iridescent silver bodies, tuna are built for speed and never stop swimming. Due to overfishing most species of tuna ranged from threatened to critically endangered but after regulations were put in place their populations have been stabilizing." },
	{ name: "Clownfish",	weight: 4, speed: 4.5, drain: 0.4, value: 75, illegal: true,
		desc: "Clownfish populations face threats as they are highly sought after aquarium fish. In many places the catching of clownfish is highly regulated and should not be kept without government permission." },
	{ name: "Anglerfish",	weight: 1, speed: 5.5, drain: 0.5, value: 200,
		desc: "Anglerfish use a modified dorsal fin as a lure to catch prey. Anglerfish are not currently threatened by overfishing or human expansion but humans are progressively encroaching on their habitat with deep sea mining operations and oil drilling." }
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