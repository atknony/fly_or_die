extends Node2D

const SPIKE = preload("res://Scenes/spike.tscn")
var SPIKE_HEIGHT = 50.0

var new_wait_time
var spike_speed = 80.0
var counter = 0

@onready var min_time = 1.0
@onready var max_time = 2.0
@onready var spawner_timer: Timer = $Spawner/SpawnerTimer
@onready var player: CharacterBody2D = $Player
@onready var leftupper: Marker2D = $Spawner/leftupper
@onready var leftlower: Marker2D = $Spawner/leftlower
@onready var spike_holder: Node = $Spawner/spike_holder

func _on_player_bumped_walls(body: Node2D) -> void:
	player.transform.x *= -1
	player.velocity.x *= -1

func spawn_spike() -> void:
	var new_spike = SPIKE.instantiate()
	if (counter % 2) == 0:
		new_spike.position = Vector2(524,-50)
	else:
		new_spike.position = Vector2(16,-50)
	spike_holder.add_child(new_spike)
	counter += 1
	if spike_speed < 300:
		spike_speed *= 1.04
	else:
		spike_speed += 5
	for spike in spike_holder.get_children():
		spike.SPEED = spike_speed 

func _on_spawntimer_timeout() -> void:
	min_time = ((SPIKE_HEIGHT)/spike_speed) * 3
	max_time = min_time * 3
	new_wait_time = randf_range(min_time,max_time)
	spawn_spike()
	spawner_timer.wait_time = new_wait_time	
	print("Spike Speed: ",spike_speed)
	print("Counter: ",counter)
