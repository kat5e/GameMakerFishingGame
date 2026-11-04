started = true;
layer_name = "StartLayer";

update_started = function () 
{
    if (started){
        instance_deactivate_all(true);
        layer_set_visible(layer_name, true);
    } else {
        instance_activate_all();
        layer_set_visible(layer_name, false);
    }
}
update_started();