extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# warning-ignore:unused_argument
func _physics_process(delta):
	if Input.is_action_pressed("left"):
		position.x = position.x - 10
	if Input.is_action_pressed("right"):
		position.x = position.x + 10
	if Input.is_action_pressed("up"):
		position.y = position.y + -10
	if Input.is_action_pressed("down"):
		position.y = position.y + 10