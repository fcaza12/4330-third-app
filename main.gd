extends Node2D

var pipe_set: PackedScene = preload("res://pipe_set.tscn") 

const space_between : int = 300
const step : int = space_between * 3

@onready var player = $player
@onready var prev_step : int = int(player.global_position.x / step)
@onready var camera = $Camera2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(3):
		generate_pipes((prev_step * step) + ((i+1) * space_between))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("Escape")):
		get_tree().quit()
		
func _physics_process(delta: float):
	if is_instance_valid(player):
		camera.global_position.x = player.global_position.x - 200
		var current_step : int = int(player.global_position.x / step)
		if(current_step != prev_step):
			print("current hundredth: " + str(current_step))
			print("prev hundredth: " + str(prev_step))
			print("hit modulo")
			for i in range(3):
				generate_pipes((current_step * step) + ((i+1) * space_between))
			
		prev_step = current_step
		
func generate_pipes(newpos : int):
	var new_pipe_set = pipe_set.instantiate();
	new_pipe_set.global_position.x = newpos
	new_pipe_set.global_position.y = randi_range(-75, 75)
	add_child(new_pipe_set)
