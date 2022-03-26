extends KinematicBody2D

onready var anim = $AnimationPlayer
onready var dashTimer = $dashTimer
onready var cooldown = $cooldownTimer

export var canCurve = true

var speed = 500
var acceleration = 100
var friction = 20

var dashSpeed = 700
var dashLength = 0.1
var isDashing : bool = false
var canDash : bool = true

var mov_direction = Vector2.ZERO
var velocity = Vector2.ZERO




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(_delta):
	move()
	if (Input.is_action_just_pressed("swing2") and canCurve):
		$curveShot/Particles2D.set_emitting(true)
		anim.play("curveShot")
		print(canCurve)
	if Input.is_action_just_pressed("dash2") and canDash and mov_direction != Vector2.ZERO:
		dash()
	
func dash():
	isDashing = true
	canDash = false
	acceleration = dashSpeed * 10
	speed = dashSpeed*2
	dashTimer.start(dashLength)
	
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


func _on_Area2D_body_entered(body):
	if body.name == "ball" and !canCurve:
		$curve.play()
		if mov_direction.y > 0:
			body.add_force(Vector2(0,body.global_position.y - global_position.y * 10),Vector2(0,body.global_position.y - global_position.y * 10))
		if mov_direction.y <= 0:
			body.add_force(Vector2(0,body.global_position.y - global_position.y * 10),Vector2(0,body.global_position.y - global_position.y * -10))
	elif body.name == "ball":
		$hit.play()


func _on_dashTimer_timeout():
	isDashing = false
	cooldown.start(dashLength*10)
	acceleration = 50
	speed = 500


func _on_cooldownTimer_timeout():
	canDash = true
