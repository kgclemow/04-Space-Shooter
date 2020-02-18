extends Node

export var max_enemies = 5
export var probability = 0.3

onready var Enemyship = load("res://Scenes/Enemyship.tscn")

func _ready():
	randomize()


func _on_Timer_timeout():
	if get_child_count() < max_enemies + 1:
		if randf() < probability or get_child_count() == 1:
			if randf() < 0.5:
				var e = Enemyship.instance()
				add_child(e)
			else:
				var e = Enemyship.instance()
				add_child(e)
