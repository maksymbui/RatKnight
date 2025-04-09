extends MeshInstance3D

@export_dir var decorations_dir = "res://Decorations2"
@export_dir var obstacles_dir = "res://LVLS"
#@export var decor: PackedScene
var decorations: Array
var obstacles: Array

func _ready() -> void:
	load_decorations(decorations_dir)
	generate_decorations()
	generate_obstacles()
	
func load_decorations(target_path: String) -> void:
	for decoration in DirAccess.open(decorations_dir).get_files():
		decorations.append(decoration)
	for obstacle in DirAccess.open(obstacles_dir).get_files():
		obstacles.append(obstacle)
	
func generate_decorations() -> void:
	var decoration = load(decorations_dir + "/" + decorations.pick_random()).instantiate()
	#var decoration = load("res://Decorations/Decoration1.tscn").instantiate()
	add_child(decoration)
	
func generate_obstacles() -> void:
	var obstacle = load(obstacles_dir + "/" + obstacles.pick_random()).instantiate()
	add_child(obstacle)

func generate_empty() -> void:
	pass
