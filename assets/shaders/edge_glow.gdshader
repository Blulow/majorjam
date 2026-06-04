shader_type canvas_item;

instance uniform vec4 glow_color: source_color = vec4(1.0, 0.3, 0.0, 1.0);
instance uniform float border_thickness: hint_range(0.0, 10.0) = 2.0;
instance uniform float glow_intensity: hint_range(0.0, 10.0) = 3.0;

void fragment() {
	vec4 current_color = texture(TEXTURE, UV);
	vec2 size = TEXTURE_PIXEL_SIZE * border_thickness;
	
	float alpha = current_color.a;
	alpha += texture(TEXTURE, UV + vec2(0.0, size.y)).a;
	alpha += texture(TEXTURE, UV - vec2(0.0, size.y)).a;
	alpha += texture(TEXTURE, UV + vec2(size.x, 0)).a;
	alpha += texture(TEXTURE, UV - vec2(size.x, 0)).a;
	
	if (current_color.a == 0.0 && alpha > 0.0) {
		COLOR = glow_color * glow_intensity;
	} else {
		COLOR = current_color;
	}
}
