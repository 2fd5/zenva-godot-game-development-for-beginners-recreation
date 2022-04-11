extends Node

var score : int = 0
var multiplier : int = 1
onready var ui : Control = get_node("/root/MainScene/CanvasLayer/UI")

func add_score(amount):
	score += amount * multiplier
	ui.updateScoreLabel(score)
