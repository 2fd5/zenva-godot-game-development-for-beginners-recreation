extends Node

var score : int = 0
var multiplier : int = 1

func add_score(amount):
	score += amount * multiplier
