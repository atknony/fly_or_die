extends CharacterBody2D

const speed = 50
const JUMP_FORCE = -350
var gravity: float = ProjectSettings.get("physics/2d/default_gravity")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity.x = speed
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	fly(delta)
	move_and_slide()

func fly(delta: float) -> void:
	velocity.y += gravity * delta
	if Input.is_action_just_pressed("JUMP"):
		velocity.y = JUMP_FORCE
	if Input.is_action_pressed("JUMP"):
		velocity.y = JUMP_FORCE
