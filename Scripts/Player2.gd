extends KinematicBody2D

onready var anim = $AnimationPlayer

export var curve = true

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
	if (Input.is_action_just_pressed("swing2") and curve):
		$curveShot/Particles2D.set_emitting(true)
		anim.play("swing")
	
	pass
	
func move():
	
	mov_direction.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	mov_direction.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	
	mov_direction = mov_direction.normalized()
	
	if mov_direction != Vector2.ZERO:
		velocity += mov_direction * acceleration
		velocity = velocity.clamped(speed)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction)
	
	velocity = move_and_slide(velocity)

