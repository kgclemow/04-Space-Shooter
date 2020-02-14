extends Label


func _ready():
	pass 


# warning-ignore:unused_argument
func _physics_process(delta):
# warning-ignore:return_value_discarded
	get_viewport().get_mouse_position()
	var mouse_pos = get_viewport().get_mouse_position()
	print(mouse_pos.x)
	print(mouse_pos.y)
	text = str(mouse_pos.x) + ", " + str(mouse_pos.y)

