global.fishing_cooldown = 100; 
trawl_timer -= delta_time / 1000000; 
 if (trawl_timer <= 0) {
        global.fishing_cooldown = 10;
    }