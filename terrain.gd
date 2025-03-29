extends MeshInstance3D

@export_dir var decorations_dir = "res://Decorations"
@export var decor: PackedScene
var decorations: Array[String] = []

func _ready() -> void:
	load_decorations(decorations_dir)
	
func load_decorations(target_path: String) -> void:
	for decoration in DirAccess.open(target_path).get_files():
		decorations.append(decor)
	
func generate_decorations() -> void:
	var decor = decorations.pick_random()
	print(decor)
	#add_child(load("res://Decorations/" + decor).instantiate())
	
func generate_obstacles() -> void:
	pass

func generate_empty() -> void:
	pass
