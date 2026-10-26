//this code was my attempt at trying to make the shop menu only interactable from
//a specfic distance to the shop... 
var _p = instance_nearest(x, y, Object1);
can_interact = (_p != noone && point_distance(x, y, _p.x, _p.y) <= interact_range);

//i removed a && can_interact check from this if statement 
if (keyboard_check_pressed(ord("E"))) {
	shop_open = !shop_open;
    update_shop();
}