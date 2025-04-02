extends CharacterBody3D

@export var MOVE_SPEED: float = 10
var target_lane: int = 1
var LANES: Array = [-2, 0, 2]
var gravity_pull: float = 24
var jump_velocity: float = 10
var target_velocity: Vector3 = Vector3.ZERO
var state: String = "run"

signal hit

func _physics_process(delta: float) -> void:
	var direction: Vector3 = Vector3.ZERO

	if state == "stop":
		$AnimationPlayer.pause()
	
	if state != "stop":
		if Input.is_action_just_pressed("ui_down") && state != "attack":
			if state == "left" || state == "right":
				$Strafe.stop()
			state = "attack"
			if not is_on_floor():
				gravity_pull = 30
			$Attack.start()

		#Changing Lanes
		if Input.is_action_just_pressed("ui_left") and target_lane > 0:
			if is_on_floor() && state != "attack":
				state = "left"
				$Strafe.start()
			target_lane -= 1
			
		if Input.is_action_just_pressed("ui_right") and target_lane < 2:
			if is_on_floor() && state != "attack":
				state = "right"
				$Strafe.start()
			target_lane += 1
			
		#Jumping
		if Input.is_action_just_pressed("ui_up") and is_on_floor() and state != "stop":
			target_velocity.y = jump_velocity
		
		var target_x: float = LANES[target_lane]
		var current_x: float = global_transform.origin.x
		global_transform.origin.x = lerp(current_x, target_x, MOVE_SPEED * delta)
		velocity = target_velocity
		
	#Controlling animations and GravityPull
	if state == "attack":
		$AnimationPlayer.play("Attack")
		
	if is_on_floor() and state != "stop":
		if state == "run":
			$AnimationPlayer.play("WeaponRun")
		if state == "left":
			$AnimationPlayer.play("Strafe Left")
		if state == "right":
			$AnimationPlayer.play("StrafeRight")

		if(target_velocity.y < -4):
			target_velocity.y = -4
	else:
		if state != "stop":
			target_velocity.y = target_velocity.y - (gravity_pull * delta)
			if state != "attack":
				$AnimationPlayer.play("Jump")
					
	#CollisionDetection
	for index in range(get_slide_collision_count()):
		var collision = get_slide_collision(index)
	for collision_index in get_slide_collision_count():
		var collision = get_slide_collision(collision_index)
		if collision.get_collider() == null:
			continue
		if collision.get_collider().is_in_group("Enemy"):
			state = "stop"
			$Strafe.stop()
			$Attack.stop()
			hit.emit()

	if (position.y > 0.3 and position.y < 5.56 and is_on_floor()):
		target_velocity.z = -4
	else:
		target_velocity.z = 0
	
	#Attack system
	var collider = $rig/Skeleton3D/axe_2handed/Axe/RayCast3D.get_collider()
	if collider != null and collider.is_in_group("Enemy") && state == "attack":
		collider.hit()
	
	move_and_slide()

func _on_strafe_timeout() -> void:
	state = "run"

func _on_attack_timeout() -> void:
	gravity_pull = 24
	state = "run"


func _on_axe_hit() -> void:
	print("Hitted Enemy") # Replace with function body.
