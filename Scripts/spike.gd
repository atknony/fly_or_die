extends Area2D

var SPEED: float = 120.0
const ACCELERATION: float = 50.0 
const OFF_SCREEN: float = 1000.0


func _process(delta: float) -> void:
	SPEED += ACCELERATION * delta 
	position.y += SPEED * delta 
	if position.y > get_viewport_rect().position.y + OFF_SCREEN:
		queue_free()
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
