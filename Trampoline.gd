extends Area3D

@export var boost_velocity: float = 18.0

signal trampoline_boosted

func _on_body_entered(body):
	body.target_velocity.y = boost_velocity
	trampoline_boosted.emit()
