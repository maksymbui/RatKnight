shader_type spatial;
render_mode blend_mix, depth_draw_opaque, cull_disabled, diffuse_toon, specular_toon;

uniform vec4 albedo : source_color;
uniform sampler2D color_gradient;
uniform sampler2D fresnel_gradient;

float fresnel(float amount, vec3 normal, vec3 view) {
    return 1.0 - clamp(dot(normalize(normal), normalize(view)), 0.0, 1.0);
}

void vertex() {
    // Called for every vertex, material is visible on
}

void fragment() {
    float basic_fresnel = fresnel(4.0, NORMAL, VIEW);
    ALBEDO = texture(fresnel_gradient, vec2(basic_fresnel, 0.0)).rgb * 1.0;
}

void light() {
    float dotproduct = clamp(dot(NORMAL, LIGHT), 0.0, 1.0);
    float sample = clamp(dotproduct + 1.0, 0.0, 1.0); // Example adjustment
    // Additional lighting calculations can go here
}
