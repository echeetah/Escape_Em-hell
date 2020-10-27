extends Node

var time_left: int


func new_game() -> void:
	$V_body.position = $PlayerPosition.position
	$E_body/CollisionShape2D.disabled = true
	$A_body/CollisionShape2D.disabled = true
	$E_body/AnimatedSprite.hide()
	$A_body/AnimatedSprite.hide()
	$StartTimer.start()


func game_over() -> void:
	get_tree().change_scene("res://scenes/EndScene.tscn")


func update_timers(time):
	$ShowTimer.text = str(time)
	$ShowTimer2.text = str(time)


func _ready():
	time_left = 3
	$PauseMenu.hide()
	new_game()
	while time_left >= 0:
		update_timers(time_left)
		yield(get_tree().create_timer(1.0), "timeout")
		time_left -= 1
	time_left = 29
	while time_left >= 0:
		update_timers(time_left)
		yield(get_tree().create_timer(1.0), "timeout")
		time_left -= 1


func _on_StartTimer_timeout():
	$HalfGameTimer.start()
	$GameTimer.start()
	$E_body.position = $EPosition.position
	$E_body/AnimatedSprite.show()
	yield(get_tree().create_timer(0.2), "timeout")
	$E_body/CollisionShape2D.disabled = false


func _on_HalfGameTimer_timeout():
	$A_body.position = $APosition.position
	$A_body/AnimatedSprite.show()
	yield(get_tree().create_timer(0.2), "timeout")
	$A_body/CollisionShape2D.disabled = false


func _on_GameTimer_timeout():
	game_over()


func _on_PauseButton_button_up():
	get_tree().paused = true
	$PauseMenu.show()


func _on_ResumeButton_button_up():
	$PauseMenu.hide()
	get_tree().paused = false


func _on_MainMenuButton_button_up():
	get_tree().paused = false
	get_tree().change_scene("res://scenes/MainScreen.tscn")
