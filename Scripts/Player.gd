extends KinematicBody2D

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
	mouse()
	
	pass
	
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

func mouse():
	var v = get_global_mouse_position() - global_position
	
	var angle = v.angle()
	
	global_rotation = lerp_angle(global_rotation, angle, 1)
