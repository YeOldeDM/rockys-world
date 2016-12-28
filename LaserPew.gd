
extends Area2D

var speed = 400

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	var pos = get_pos()
	pos.y -= speed*delta
	set_pos(pos)


func _on_LaserPew_body_enter( body ):
	if 'value' in body:
		body.queue_free()
	queue_free()


func _on_VisibilityNotifier2D_exit_screen():
	queue_free()
