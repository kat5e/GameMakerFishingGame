winw = window_get_width();
winh = window_get_height();
move_speed = 1;
global.shop_open = false;

tilemap = layer_tilemap_get_id("Tiles_Col");
mask_index = player_mask;
instance_create_layer(0, 0, "Instances", obj_inventory); 