extends Control



func _on_RestartButton_button_up():
	get_tree().change_scene("res://scenes/Main.tscn")


func _on_QuitButton_button_up():
	get_tree().quit()
