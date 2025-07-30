extends StaticBody3D

func hit() -> void:	
	set_collision_layer_value(3,false)
	$AnimationPlayer.play("Breakeble OBstacleAction")
	$AnimationPlayer.play("Breakeble OBstacleAction_001")
	$AnimationPlayer.play("Breakeble OBstacleAction_002")
	$AnimationPlayer.play("Breakeble OBstacleAction_003")
	$AnimationPlayer.play("Breakeble OBstacleAction_004")
	$AnimationPlayer.play("Breakeble OBstacleAction_005")
	$AnimationPlayer.play("Breakeble OBstacleAction_006")
