extends Node3D
var dark_color: Color = Color(0.05, 0.153, 0.233, 1)
var fog_current_color: Color = Color(0, 0, 0, 1)
var sky_color: Color = Color(0.529, 0.808, 0.980, 1)

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var env := get_viewport().get_world_3d().environment
	var collider = $Player/FogSwitch.get_collider()
	if collider != null and env:
		fog_current_color = fog_current_color.lerp(dark_color, 1.5 * delta)
	else:
		fog_current_color = fog_current_color.lerp(sky_color, 1.5 * delta)
	env.fog_light_color = fog_current_color

func _on_player_hit() -> void:
	$TerrainController._stop_gen()
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		get_tree().reload_current_scene()
