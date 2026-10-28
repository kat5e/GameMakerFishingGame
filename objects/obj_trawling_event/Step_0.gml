global.fishing_cooldown = 100;
trawl_timer -= delta_time / 1000000; 
 if (trawl_timer <= 5) {
        global.fishing_cooldown = 10;
    }
if (trawl_timer < 0) {
    instance_destroy();
}