extends Node2D

func _ready():
	pass




func _on_Spaceship_score_changed():
	var s = get_node("/root/Game/SpaceShip").score
	$Score.text = "Score: " + str(s)
