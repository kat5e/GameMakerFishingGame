

shader_set(sh_daynight);

//var _t = sin_ext(time_of_day, 0, 1);
var _t = time_of_day;

shader_set_uniform_f(shader_get_uniform(sh_daynight, "time_of_day"), _t);

draw_surface(application_surface, 0, 0);

shader_reset();


function sin_ext(delta_value, start_value, end_value) {
	return start_value + (end_value - start_value) * (sin(delta_value) + 1) / 2;
}