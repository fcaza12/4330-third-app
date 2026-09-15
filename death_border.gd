extends Area2D

@export var vertical_offset: float = 250

@onready var camera : Camera2D
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera = get_viewport().get_camera_2d()
	body_entered.connect(_on_body_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if camera:
		global_position.x = camera.global_position.x
		global_position.y = camera.global_position.y + vertical_offset
	
func _on_body_entered(body: Node2D):
	print("detection")
	if body is player:
		body.kill()
