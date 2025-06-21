extends Area2D

var SPEED: float = 80

func _process(delta: float) -> void:
	position.y += SPEED * delta
	
func _on_2d_screen_exited() -> void:
	queue_free()
