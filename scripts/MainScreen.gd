extends Control


func _on_StartButton_button_up():
	get_tree().change_scene("res://scenes/Main.tscn")


func _on_ExitButton_button_up():
	get_tree().quit()
