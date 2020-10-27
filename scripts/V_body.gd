extends KinematicBody2D


export (int) var speed = 170
var screen_size


var velocity = Vector2()


func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed


func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)


func _process(delta):
	if velocity.x != 0:
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_h = velocity.x > 0
	if velocity.length() > 0:
		$AnimatedSprite.play("walk")
	else:
		$AnimatedSprite.play("breathe")
	position += velocity * delta


func _on_EnemyDetector_body_entered(body):
	get_tree().change_scene("res://scenes/EndScene.tscn")
