
extends Area2D

const Y = 520

var X = 0

var LaserPew = preload('res://LaserPew.tscn')


func shoot_laser():
	print("PEWPEW")
	var pew = LaserPew.instance()
	get_parent().add_child(pew)
	pew.set_pos(get_pos())

func _ready():
	set_process_input(true)


func _input(event):
	if event.type == InputEvent.MOUSE_MOTION:
		X = get_viewport().get_mouse_pos().x
		
		set_pos(Vector2(X,Y))
	
	elif event.type == InputEvent.MOUSE_BUTTON:
		if event.button_index == BUTTON_LEFT && event.pressed:
			shoot_laser()




func _on_player_body_enter( body ):
	get_parent().add_score(body.value)
	body.queue_free()
