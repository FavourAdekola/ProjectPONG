extends CanvasLayer

onready var red = $ColorRect2/Label
onready var blue = $ColorRect/Label

func _process(_delta):
	if GameControl.bestOf != 9999:
		red.text = str(GameControl.p2_score)
		blue.text = str(GameControl.p1_score)
	else:
		red.text = "-"
		blue.text = "-"
