global.upgrades = { pole: 0, line: 0, bobber: 0 };

//max = highest level
//cost = price of level 1
//growth = price multiplier per level
global.upgrade_defs = {
    pole:   { name: "Pole",  desc: "Fishing progress drains slower.",	max: 5, cost: 25, growth: 1.5 },
    line:   { name: "Line",  desc: "Fishing progress rises faster.",	max: 5, cost: 50, growth: 1.5 },
    bobber: { name: "Bobber", desc: "Fish bite sooner.",				max: 5, cost: 40, growth: 1.5 }
};

function upgrade_level(_key) { 
	return global.upgrades[$ _key]; 
}

function upgrade_maxed(_key) { 
	return upgrade_level(_key) >= global.upgrade_defs[$ _key].max; 
}

function upgrade_cost(_key) {
    var _d = global.upgrade_defs[$ _key];
    return round(_d.cost * power(_d.growth, upgrade_level(_key)));
}

//upgrade effects
function upgrade_drain_mult() { 
	return max(0.4, 1 - 0.1 * upgrade_level("pole")); //10% less drain per level
}
function upgrade_catch_mult() { 
	return 1 + 0.15 * upgrade_level("line"); //15% more catch rate per level
}
function upgrade_bite_min() { 
	return max(0.5, 4 - 0.5 * upgrade_level("bobber")); //minimum seconds for bite
} 
function upgrade_bite_max() {
	return max(2.5, 10 - 1.0 * upgrade_level("bobber")); //maximum seconds for bite
}