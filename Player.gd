extends KinematicBody2D

export var speed : int = 200
var gravity : int = 500
var jumpAmount : int = 300
var velocity : Vector2 = Vector2()

onready var sprite : Sprite = get_node("Sprite")

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
