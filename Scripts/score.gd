extends Label

func _ready():
	update_score()

func update_score():
	text = "score: " + str(get_parent().score)