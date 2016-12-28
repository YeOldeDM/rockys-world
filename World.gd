
extends Node2D

var padding = 24

var score = 0 setget _set_score

var Treat = preload('res://Treat.tscn')
var MetalTreat = preload('res://MetalTreat.tscn')

func add_score(amt):
	var new_score = score + amt
	set('score', new_score)

func spawn_treat(metal=false):
	var new_treat = null
	if metal:
		new_treat = MetalTreat.instance()
	else:	new_treat = Treat.instance()
	var x = rand_range(padding, get_viewport().get_rect().size.width-padding)
	add_child(new_treat)
	new_treat.set_pos(Vector2(x, 0))
	if metal:	new_treat.value = -1

func _set_score(value):
	score = value
	get_node('Score').set_text("TREATS: "+str(score))









func _on_Killzone_body_enter( body ):
	add_score(-body.value)
	body.queue_free()


func _on_TreatTime_timeout():
	var R = randf()
	if R <= 0.1:
		spawn_treat(true)
	else:	spawn_treat(false)
	get_node('TreatTime').set_wait_time(get_node('TreatTime').get_wait_time()*0.9)



