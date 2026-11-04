if (!audio_is_playing(spr_background_music && !audio_is_playing( spr_ocean_sounds))){
    audio_play_sound(spr_background_music, 5, true);
    audio_play_sound(spr_ocean_sounds, 6, true)
}

if (!trawl_event){
 event_timer -= delta_time / 1000000;
    if (event_timer <= 0) {
         if (!instance_exists(obj_trawling_event)) {
        instance_create_depth(0, 0, 0, obj_trawling_event);
            trawl_event = true;
        }
        }
    }

