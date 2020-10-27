extends KinematicBody2D


export var max_speed = 150
export var mass = 2.0

onready var player_node = get_node("../V_body")
var _velocity = Vector2()


func _process(_delta):
	if _velocity.x != 0:
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_h = _velocity.x > 0
	if _velocity.length() > 0:
		$AnimatedSprite.play("walk")
	else:
		$AnimatedSprite.play("breathe")


func _physics_process(_delta):
	var target_global_position: Vector2 = player_node.position
	
	_velocity = follow(
		_velocity,
		global_position,
		target_global_position,
		max_speed,
		mass
	)
	
	_velocity = move_and_slide(_velocity)


static func follow(
		velocity: Vector2,
		global_position: Vector2,
		target_position: Vector2,
		max_speed := max_speed,
		mass := mass
	) -> Vector2:
	
	var new_velocity := Vector2()
	var desired_velocity: Vector2 = (target_position - global_position).normalized() * max_speed
	var steering: Vector2 = (desired_velocity - velocity) / mass
	return velocity + steering
