'''
ENI Note: this script should take the input checks from the Seagull.
I assume the logic should be that this checks the key press and
informs the correct Seagull.
This way, the 1P can use both input methods while 2P divides them.
Link to the inspiration:
https://forum.godotengine.org/t/so-im-trying-to-make-a-script-that-controls-two-player-in-local-multiplayer/48286
'''
extends Node2D
@onready var player_1: CharacterBody2D = %Player1
@onready var player_2: CharacterBody2D = %Player2

func get_input_1P():
	'''
	ENi Note: I assume from this link
	https://forum.godotengine.org/t/how-to-put-vector2-into-a-variable/103883
	this is how Vector2 vars are declared
	'''
	var input_map: Vector2 = Vector2(0,0)
	if Input.is_action_pressed("move_right"):
		input_map.x = 1
	elif Input.is_action_pressed("move_left"):
		input_map.x = -1
	player_1.control_speed(input_map.x)
	if Input.is_action_pressed("move_back"):
		input_map.y = -1
	player_1.control_altitude(input_map.y)

func _process(delta: float) -> void:
	if !player_2.visible:
		get_input_1P()
