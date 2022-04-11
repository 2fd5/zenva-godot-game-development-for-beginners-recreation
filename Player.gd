extends KinematicBody2D

export var speed : int = 250
var gravity : int = 600
var jumpAmount : int = 400
var velocity : Vector2 = Vector2()

onready var sprite : Sprite = get_node("Sprite")
onready var ui : Control = get_node("/root/MainScene/CanvasLayer/UI")
onready var sound : AudioStreamPlayer2D = get_node("/root/MainScene/Camera2D/SFX")
onready var cameraAnimation : AnimationPlayer = get_node("/root/MainScene/AnimationPlayer")

func _ready():
	cameraAnimation.current_animation = "idle"
	
func _physics_process(delta):
	velocity.x = 0

	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	if Input.is_action_pressed("move_right"):
		velocity.x += speed

	velocity = move_and_slide(velocity, Vector2.UP)
	
	velocity.y += gravity * delta

	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y -= jumpAmount

	if velocity.x < 0:
		sprite.flip_h = true
	if velocity.x > 0:
		sprite.flip_h = false
	
	if position.y > 768:
		die()

func die():
	Global.score = 0
	sound.play_die_SFX()
	cameraAnimation.current_animation = "shake"
	cameraAnimation.play("shake")
	
func add_score(amount):
	Global.add_score(amount)
	ui.updateScoreLabel()


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "shake":
		get_tree().reload_current_scene()
