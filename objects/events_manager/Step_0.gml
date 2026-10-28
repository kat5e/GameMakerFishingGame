if (!trawl_event){
    event_timer -= delta_time / 1000000;
    
    if (event_timer <= 0) {
        trawl_event = true
        instance_create_layer(x, y, "Instances", trawling_event);
    }
}