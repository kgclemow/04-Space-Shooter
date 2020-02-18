extends RigidBody2D

onready var Game = get_node("/root/Game")


func _ready():
	contact_monitor = true
	set_max_contacts_reported(4)
	randomize()
	var x = randi() % int(get_viewport().size.x)
	position = Vector2(x, position.y)
	

# warning-ignore:unused_argument
func _physics_process(delta):
	var colliding = get_colliding_bodies()
	for c in colliding:
		print(c.name)
		if c.name == "Spaceship":
			Game.reset_score()
	
	if position.y > get_viewport().size.y:
		Game.increase_score()
		queue_free()
