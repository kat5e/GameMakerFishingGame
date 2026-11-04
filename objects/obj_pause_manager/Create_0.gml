paused = false;
layer_name = "PauseLayer";

update_pause = function () 
{
    if (paused){
        application_surface_draw_enable(true);
        instance_deactivate_all(true);
        instance_activate_object(obj_fishshop);
        layer_set_visible(layer_name, true);
    } else { 
        application_surface_draw_enable(false);
        instance_activate_all();
        layer_set_visible(layer_name, false);
    }
}
update_pause();