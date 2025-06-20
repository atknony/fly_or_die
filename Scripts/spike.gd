extends Area2D


const SPEED: float = 120.0
const OFF_SCREEN: float = 100.0

func _process(delta: float) -> void:
	position.y += SPEED * delta 
	
	if position.x < get_viewport_rect().position.y - OFF_SCREEN:
		pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
