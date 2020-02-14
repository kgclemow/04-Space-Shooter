extends Node2D

onready var asteroid = load("res://Scenes/asteroid.tscn")
export var score = 0

func increase_score():
	score = score + 1
	find_node("score").update_score()

func decrease_score():
	score = score - 5
	find_node("score").update_score()

func _on_Timer_timeout():
	var a = asteroid.instance()
	get_node("/root/Game").call_deferred("add_child", a)