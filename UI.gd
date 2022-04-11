extends Control

onready var scoreLabel : Label = get_node("HBoxContainer/Label")

func updateScoreLabel(amount):
	scoreLabel.text = str(amount)
