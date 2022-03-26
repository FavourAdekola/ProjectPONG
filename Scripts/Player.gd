extends KinematicBody2D

onready var anim = $AnimationPlayer

export var canCurve = true

var speed = 500
var acceleration = 50
var friction = 10

var mov_direction = Vector2.ZERO
var velocity = Vector2.ZERO




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(_delta):
	move()
	if (Input.is_action_just_pressed("swing") and canCurve):
		$curveShot/Particles2D.set_emitting(true)
		anim.play("curveShot")
	
func move():
	mov_direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	mov_direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	mov_direction = mov_direction.normalized()
	
	if mov_direction != Vector2.ZERO: 
		velocity += mov_direction * acceleration
		velocity = velocity.clamped(speed)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction)
	
	velocity = move_and_slide(velocity)



func _on_Area2D_body_entered(body):
	if body.name == "ball" and !canCurve:
		if mov_direction.y > 0:
			body.add_force(Vector2(0,body.global_position.y - global_position.y * 10),Vector2(0,body.global_position.y - global_position.y * 10))
		if mov_direction.y <= 0:
			body.add_force(Vector2(0,body.global_position.y - global_position.y * 10),Vector2(0,body.global_position.y - global_position.y * -10))
		print("HIT")
