extends Control

onready var scoreLabel : Label = get_node("HBoxContainer/Label")

func updateScoreLabel():
	scoreLabel.text = str(Global.score)
