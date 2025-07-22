extends CanvasLayer

signal start_game

func show_message(text):
	$Message.text = text
	$Message.show()
	$Timer.start()
	
func show_game_over():
	show_message("Game Over")
	# Wait until the MessageTimer has counted down.
	await $Timer.timeout
	$Message.text = "Press start..."
	$Message.show()
	# Make a one-shot timer and wait for it to finish.
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()
	
func update_score(score):
	$Score.text = str(score)
	
func _on_start_button_pressed():
	$StartButton.hide()
	start_game.emit()

func _on_timer_timeout() -> void:
	$Message.hide()
