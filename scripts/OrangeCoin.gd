extends Area2D


onready var anim_player: AnimationPlayer = $AnimationPlayer


func _on_OrangeCoin_body_entered(body):
	anim_player.play("modulate")
