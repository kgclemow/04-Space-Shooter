extends RigidBody2D


export var speed = 500
onready var Explosion = load("res://Scenes/Explosion.tscn")
onready var Spaceship = get_node("/root/Game/Spaceship")

func _ready():
	contact_monitor = true
	set_max_contacts_reported(4)

# warning-ignore:unused_argument
func _physics_process(delta):
	var colliding = get_colliding_bodies()
	for c in colliding:
		var Explosion = Explosion.instance()
		Explosion.position = position
		Explosion.get_node("Sprite").playing = true
		get_node("/root/Game/Explosion").add_child(Explosion)
		if c.get_parent().name == "Enemyship":
			Spaceship.change_score(c.score)
			c.die()
		queue_free()

	if position.y < -10:
		queue_free()

func _integrate_forces(state):
	state.set_linear_velocity(Vector2(0,-speed))
	state.set_angular_velocity(0)
