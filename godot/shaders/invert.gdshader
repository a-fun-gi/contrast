shader_type canvas_item;
render_mode unshaded;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_linear;

void fragment() {
	vec4 c = textureLod(screen_texture,SCREEN_UV,0.0).rgba;
	c.r = 1.0 - c.r;
	c.b = 1.0 - c.b;
	c.g = 1.0 - c.g;
	COLOR.rgba = c;
}