extends Area2D


onready var anim_player: AnimationPlayer = $AnimationPlayer


func _on_PurpleCoin_body_entered(body):
	anim_player.play("fade_away")
