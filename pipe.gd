extends StaticBody2D

@onready var detection : Area2D = $Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	detection.body_entered.connect(_on_body_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_body_entered(body: Node2D):
	print("detection")
	if body is player:
		body.kill()
