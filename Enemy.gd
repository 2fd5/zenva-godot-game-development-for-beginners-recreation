extends Area2D

export var distanceLeft : int = 120
export var distanceRight : int = 20
export var speed : int = 60
export var rotationSpeed : int = 60

onready var sprite : Sprite = get_node("Sprite")

var startX : int
var endX : int

func _ready():
	startX = position.x - distanceLeft
	endX = position.x + distanceRight

func _process(delta):
	position.x += speed * delta
	# far right
	if position.x > endX:
		position.x = endX
		# flip direction
		flip_direction()
	# far left
	if position.x < startX:
		position.x = startX
		# flip direction
		flip_direction()

	# rotate sprite
	sprite.rotation_degrees += rotationSpeed * delta


func _on_Enemy_body_entered(body):
	if body.name == "Player":
		body.die()

func flip_direction():
	speed *= -1
	rotationSpeed *= -1
