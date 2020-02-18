extends KinematicBody2D

export var score = 0 
export var margin = 5 
export var y_range = 300
export var acceleration = 0.1

var velocity = Vector2(0,0)

onready var VP = get_viewport_rect().size

onready var Bullet = load("res://Scenes/Bullet.tscn")

signal score_changed

func _ready():
	emit_signal("score_changed")

func change_score(s):
	score += s
	emit_signal("score_changed")
	
func die():
	queue_free()
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/GameOver.tscn")

# warning-ignore:unused_argument
func _physics_process(delta):
	if Input.is_action_pressed("fire"):
		var b = Bullet.instance()
		b.position = position
		b.position.y -= 25
		get_node("/root/Game/Bullets").fire(b)
		
	if position.x < margin:
		velocity.x = 0
		position.x = margin
	if position.x > VP.x - margin:
		velocity.x = 0
		position.x = VP.x - margin
	if position.y < VP.y - y_range:
		velocity.y = 0
		position.y = VP.y - y_range
	if position.y > VP.y - margin:
		velocity.y = 0
		position.y = VP.y - margin
	
	if Input.is_action_pressed("left"):
		position.x = position.x - 10
	if Input.is_action_pressed("right"):
		position.x = position.x + 10
	if Input.is_action_pressed("up"):
		position.y = position.y + -10
	if Input.is_action_pressed("down"):
		position.y = position.y + 10

# warning-ignore:unused_variable
	var collision = move_and_collide(velocity)
