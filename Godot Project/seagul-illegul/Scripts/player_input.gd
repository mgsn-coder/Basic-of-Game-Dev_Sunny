'''
ENI Note: this script should take the input checks from the Seagull.
I assume the logic should be that this checks the key press and
informs the correct Seagull.
This way, the 1P can use both input methods while 2P divides them.
Link to the inspiration:
https://forum.godotengine.org/t/so-im-trying-to-make-a-script-that-controls-two-player-in-local-multiplayer/48286

For hunger bar, recheck this
https://gamedevacademy.org/progressbar-in-godot-complete-guide/
'''
extends Node2D
@onready var player_1: CharacterBody2D = %Player1
@onready var player_2: CharacterBody2D = %Player2
@onready var hunger_bar_1: ProgressBar = $Player1/HungerBar
@onready var hunger_bar_2: ProgressBar = $Player2/HungerBar

func get_input_1P():
	'''
	ENi Note: I assume from this link
	https://forum.godotengine.org/t/how-to-put-vector2-into-a-variable/103883
	this is how Vector2 vars are declared
	'''
	var input_map: Vector2 = Vector2(0,0)
	if Input.is_action_pressed("move_right_1") || Input.is_action_pressed("move_right_2"):
		input_map.x = 1
	elif Input.is_action_pressed("move_left_1") || Input.is_action_pressed("move_left_2"):
		input_map.x = -1
	player_1.control_speed(input_map.x)
	if Input.is_action_pressed("move_back_1") || Input.is_action_pressed("move_back_2"):
		input_map.y = -1
	player_1.control_altitude(input_map.y)

func get_input_2P():
	var input_map_1: Vector2 = Vector2(0,0)
	var input_map_2: Vector2 = Vector2(0,0)
	if Input.is_action_pressed("move_right_2"):
			input_map_2.x = 1
	elif Input.is_action_pressed("move_left_2"):
			input_map_2.x = -1
	player_2.control_speed(input_map_2.x)
	if Input.is_action_pressed("move_right_1"):
		input_map_1.x = 1
	elif Input.is_action_pressed("move_left_1"):
			input_map_1.x = -1
	player_1.control_speed(input_map_1.x)
	if Input.is_action_pressed("move_back_2"):
		input_map_2.y = -1
	player_2.control_altitude(input_map_2.y)
	if Input.is_action_pressed("move_back_1"):
		input_map_1.y = -1
	player_1.control_altitude(input_map_1.y)
	

func update_hungerbar():
	hunger_bar_1.value = player_1.current_hunger
	if player_2.visible:
		hunger_bar_2.value = player_2.current_hunger

func _process(delta: float) -> void:
	if !player_2.visible:
		get_input_1P()
	else:
		get_input_2P()
	update_hungerbar()
