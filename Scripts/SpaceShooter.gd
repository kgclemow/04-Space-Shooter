extends Node2D

onready var Score = $Score
onready var asteroid = load("res://Scenes/asteroid.tscn")
var score = 0

	
func _ready():
	update_score()

func increase_score():
	score = score + 1
	update_score()

func reset_score():
	score = score - 5
	update_score()

func update_score():
	Score.text = "Score: " + str(score)

func _on_Timer_timeout():
	var a = asteroid.instance()
	get_node("/root/Game").call_deferred("add_child", a)