class_name player
extends CharacterBody2D

const speed = 300.0
const jumpvel = -500.0;
const BIRD_TEXTURE: Texture2D = preload("res://yellowbird-midflap.png")
const TILT_ANGLE = 35.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity.x = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("Escape")):
		get_tree().quit()

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	if(Input.is_action_just_pressed("Space")):
		velocity.y = jumpvel
		print("space")
	if velocity.y < 0:
		rotation_degrees = -TILT_ANGLE
	elif velocity.y > 0:
		rotation_degrees = TILT_ANGLE
	
	move_and_slide()
	
func kill():
	queue_free()
