extends CharacterBody2D

var gravity: float = ProjectSettings.get("physics/2d/default_gravity")
var hold_time := 0.0

const speed = 170
const JUMP_FORCE = -350
const HOLD_FORCE = -700
const HOLD_LIMIT  := 0.5

func _ready() -> void:
	velocity.x = speed

func _physics_process(delta: float) -> void:
	fly(delta)
	move_and_slide()

func fly(delta: float) -> void:
	velocity.y += gravity * delta
	if Input.is_action_just_pressed("JUMP"):
		velocity.y = JUMP_FORCE
		hold_time  = 0.0
	if Input.is_action_pressed("JUMP") and hold_time < HOLD_LIMIT:
		velocity.y = JUMP_FORCE
		hold_time  += delta
