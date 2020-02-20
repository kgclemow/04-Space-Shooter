extends RigidBody2D

var velocity = Vector2(0,0)
export var min_speed = 100
export var max_speed = 600
export var damage = 50

onready var Explosion = load("res://Scenes/Explosion.tscn")


func _ready():
	randomize()
	position.x = randi() % int(get_viewport_rect().size.x)
	velocity.y = max(randi() % max_speed, min_speed)
	contact_monitor = true
	set_max_contacts_reported(4)
	linear_velocity = velocity

# warning-ignore:unused_argument
func _physics_process(delta):
	var colliding = get_colliding_bodies()
	for c in colliding:
		if c.name != "Bullet":
			var explosion = Explosion.instance()
			explosion.position = position
			explosion.get_node("Sprite").playing = true
			get_node("/root/Game/Explosion").add_child(explosion)
		queue_free()
		
	if position.y > get_viewport_rect().size.y + 50:
		queue_free()

# warning-ignore:unused_argument
func _integrate_forces(state):
	pass
