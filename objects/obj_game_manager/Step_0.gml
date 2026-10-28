audio_sound_gain(spr_ocean_sounds, 0.1, 0);
audio_play_sound(spr_ocean_sounds, 5, true);

if (!trawl_event){
 event_timer -= delta_time / 1000000;
    if (event_timer <= 0) {
         if (!instance_exists(obj_trawling_event)) {
        instance_create_depth(0, 0, 0, obj_trawling_event);
            trawl_event = true;
        }
        }
    }

