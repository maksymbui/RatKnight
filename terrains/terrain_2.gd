extends MeshInstance3D

@export_dir var decorations_dir = "res://Decorations2"
#@export var decor: PackedScene
var decorations: Array

func _ready() -> void:
	generate_decorations()
	
func load_decorations(target_path: String) -> void:
	for decoration in DirAccess.open(decorations_dir).get_files():
		decorations.append(decoration)
	
func generate_decorations() -> void:
	load_decorations(decorations_dir)
	var decoration = load("res://Decorations2/" + decorations.pick_random()).instantiate()
	#var decoration = load("res://Decorations/Decoration1.tscn").instantiate()
	add_child(decoration)
	
func generate_obstacles() -> void:
	pass

func generate_empty() -> void:
	pass
