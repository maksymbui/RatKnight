extends CharacterBody3D

func hit() -> void:	
	set_collision_layer_value(0,false)
	queue_free()
