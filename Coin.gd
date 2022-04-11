extends Area2D

export var rupees : int = 1
onready var sound : AudioStreamPlayer2D = get_node("/root/MainScene/Camera2D/SFX")

func _on_Coin_body_entered(body):
	if body.name == "Player":
		body.add_score(rupees)
		sound.play_coin_SFX()
		queue_free()
