extends KinematicBody2D

export var speed : int = 250
var gravity : int = 600
var jumpAmount : int = 400
var velocity : Vector2 = Vector2()

onready var sprite : Sprite = get_node("Sprite")
onready var ui : Control = get_node("/root/MainScene/CanvasLayer/UI")

func _physics_process(delta):
	velocity.x = 0

	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	if Input.is_action_pressed("move_right"):
		velocity.x += speed

	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y += jumpAmount

	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.y += gravity * delta

	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y -= jumpAmount

	if velocity.x < 0:
		sprite.flip_h = true
	if velocity.x > 0:
		sprite.flip_h = false

func die():
	Global.score = 0
	get_tree().reload_current_scene()

func add_score(amount):
	Global.add_score(amount)
	ui.updateScoreLabel()
