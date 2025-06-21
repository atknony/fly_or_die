extends Area2D

var SPEED: float = 80
const OFF_SCREEN: float = 1000.0

func _process(delta: float) -> void:
	position.y += SPEED * delta

func _ready() -> void:
	pass

func _on_2d_screen_exited() -> void:
	queue_free()
