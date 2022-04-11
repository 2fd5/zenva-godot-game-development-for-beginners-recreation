extends Area2D

export var rupees : int = 1

func _on_Coin_body_entered(body):
	if body.name == "Player":
		body.add_score(rupees)
		queue_free()

