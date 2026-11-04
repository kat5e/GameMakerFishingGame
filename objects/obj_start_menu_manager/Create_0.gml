started = true;
layer_name = "StartLayer";
background_layer = "Background";

update_started = function () 
{
    if (started){
        application_surface_draw_enable(true);
        instance_deactivate_all(true);
        layer_set_visible(layer_name, true);
        layer_set_visible(background_layer, true);
    } else {
        application_surface_draw_enable(false);
        instance_activate_all();
        layer_set_visible(layer_name, false);
    }
}
update_started();