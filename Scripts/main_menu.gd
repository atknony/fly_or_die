extends Control

const GAME = preload("res://Scenes/game.tscn")

func _on_button_pressed() -> void:
	print("heyy")
	get_tree().change_scene_to_packed(GAME)
