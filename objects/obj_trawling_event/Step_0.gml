global.fishing_cooldown = 100;
if (trawling_time && !instance_exists(obj_trawling_boat)) {
    var _boat = instance_create_depth(200, 455, -100, obj_trawling_boat);
    _boat.image_xscale = 4;
_boat.image_yscale = 4;

    _boat.hspeed = 2;
}
trawl_timer -= delta_time / 350000; 
 if (trawl_timer <= 5) {
        global.fishing_cooldown = 10;
    }
if (trawl_timer <= 0) {
    if(!instance_exists(obj_trawling_boat)){
            instance_destroy();
    }
}