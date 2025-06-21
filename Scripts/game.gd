extends Node2D

const SPIKE = preload("res://Scenes/spike.tscn")

var COUNTER: int = 0

@onready var player: CharacterBody2D = $Player
@onready var leftupper: Marker2D = $Spawner/leftupper
@onready var leftlower: Marker2D = $Spawner/leftlower
@onready var spike_holder: Node = $Spawner/spike_holder

func _on_player_bumped_walls(body: Node2D) -> void:
	player.transform.x *= -1
	player.velocity.x *= -1

func spawn_spike() -> void:
	var new_spike = SPIKE.instantiate()
	var y_position: float = randf_range(leftupper.position.y,leftlower.position.y)
	if COUNTER % 2 == 0:
		new_spike.position = Vector2(506,y_position)
	else: 
		new_spike.position = Vector2(37,y_position)
	new_spike.SPEED += COUNTER * 15
	spike_holder.add_child(new_spike)


func _on_spawntimer_timeout() -> void:
	COUNTER += 1
	spawn_spike()
