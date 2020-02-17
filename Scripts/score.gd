extends Label

func _ready():
	pass
	
func _on_Player_score_changed():
	var s = get_node("/root/Game/Spaceship").score
	$Score.text = "Score: " +str(s)