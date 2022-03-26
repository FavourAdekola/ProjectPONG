extends Node

const TRANS = Tween.TRANS_SINE
const EASE = Tween.EASE_IN_OUT

var amplitude = 0
var priority = 0


onready var camera = get_parent()

func start(duration = 0.2, frequency = 15, amplitude = 16, priority = 0):
	if (priority >= self.priority):
		self.priority = priority
		self.amplitude = amplitude

		$Tween/Duration.wait_time = duration
		$Tween/Frequency.wait_time = 1 / float(frequency)
		$Tween/Duration.start()
		$Tween/Frequency.start()

		_new_shake()

func _new_shake():
	var rand = Vector2()
	rand.x = rand_range(-amplitude, amplitude)
	rand.y = rand_range(-amplitude, amplitude)

	$Tween.interpolate_property(camera, "offset", camera.offset, rand, $Tween/Frequency.wait_time, TRANS, EASE)
	$Tween.start()

func _reset():
	$Tween.interpolate_property(camera, "offset", camera.offset, Vector2(), $Tween/Frequency.wait_time, TRANS, EASE)
	$Tween.start()

	priority = 0

func _on_Frequency_timeout():
	_new_shake()


func _on_Duration_timeout():
	_reset()
	$Tween/Frequency.stop()
