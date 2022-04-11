extends AudioStreamPlayer2D

onready var coinSFX = preload("res://Audio/coin44k.tres")
onready var dieSFX = preload("res://Audio/236320__szpury__vanished-002-41k.tres")

func play_die_SFX():
	stream = dieSFX
	play()

func play_coin_SFX():
	stream = coinSFX
	play()
