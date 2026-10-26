//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

const vec3 day_color = vec3(1.0, 1.0, 1.0);
const vec3 sunset_color = vec3(0.95, 0.85, 0.6);
const vec3 night_color = vec3(0.25, 0.25, 0.55);

uniform float time_of_day;

void main()
{
	vec4 pixel = texture2D(gm_BaseTexture, v_vTexcoord);
	
	vec3 color = mix(day_color, night_color, time_of_day);
	
	if (time_of_day < 0.5) {
		float t = time_of_day * 2.0; 
		color = mix(day_color, sunset_color, t);
	}
	else {
		float t = (time_of_day - 0.5) * 2.0; 
		color = mix(sunset_color, night_color, t);
    }
	
	gl_FragColor = vec4(pixel.rgb * color.rgb, pixel.a) * v_vColour;
}
//doing the shader this way caused the pause menu to overlay over a black screen
//we could easily implement a background of some sort to remedy this