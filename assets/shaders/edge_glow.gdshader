shader_type canvas_item;

instance uniform vec4 glow_color: source_color = vec4(1.0, 0.3, 0.0, 1.0);
instance uniform float border_thickness: hint_range(0.0, 10.0) = 2.0;
instance uniform float glow_intensity: hint_range(0.0, 10.0) = 3.0;
instance uniform float alpha: hint_range(0.0, 1.0, 0.1) = 1.0;

void fragment() {
	vec4 current_color = texture(TEXTURE, UV);
	vec2 size = TEXTURE_PIXEL_SIZE * border_thickness;
	
	float alpha_sample = current_color.a;
	alpha_sample += texture(TEXTURE, UV + vec2(0.0, size.y)).a;
	alpha_sample += texture(TEXTURE, UV - vec2(0.0, size.y)).a;
	alpha_sample += texture(TEXTURE, UV + vec2(size.x, 0)).a;
	alpha_sample += texture(TEXTURE, UV - vec2(size.x, 0)).a;
	
	vec4 final_color;
	
	if (current_color.a == 0.0 && alpha_sample > 0.0) {
		//COLOR = glow_color * glow_intensity;
		COLOR = glow_color * glow_intensity;
		COLOR.a = alpha;
	} else {
		COLOR = current_color;
	}
}
