extends Node

@onready var player_input: Node2D = $"PlayerInput"
@onready var level_hud: Control = $"LevelHUD"

var points: Array[int] = [0,0] #ENI Note: player 1, player 2

var player_1: CharacterBody2D = null
var player_2: CharacterBody2D = null

func _ready() -> void:
	player_1 = player_input.get_child(0)
	if GameMaster.playing_2P_mode:
		player_2 = player_input.get_child(1)
	else:
		#Sunny note: Erik told me to move player 2 out of fish's reach with this code
		player_input.get_child(1).global_position.y = -100
		player_input.get_child(1).visible = false
		level_hud.get_child(1).visible = false

func increase_point(body_name: String, current_point: int = 0):
	#ENI Note: using match so I can learn Godot's way of switch cases and this could be expanded to 2+ game feature.
	match body_name:
		player_1.name:
			points[0] += current_point
		player_2.name:
			points[1] += current_point

func update_points():
	level_hud.update_points(points)

func _process(delta: float) -> void:
	update_points()
	check_player_hunger()

func check_player_hunger():
	#Sunny note: if the game is in 2P mode
	if GameMaster.playing_2P_mode == true:
		if player_1.current_hunger <= 0:
			print("Player 1 Lose")
			#Sunny note: make 1P + 2P points global variable
			GameMaster.inform_previous_points(points,1)
			get_tree().change_scene_to_file("res://Scene/Screens/2p_game_over.tscn")
		if player_2.current_hunger <= 0:
			print("Player 2 Lose")
			GameMaster.inform_previous_points(points,0)
			get_tree().change_scene_to_file("res://Scene/Screens/2p_game_over.tscn")
	else:
		if player_1.current_hunger <= 0:
			print("Player Lose")
			#Sunny note: make 1P + 2P points global variable
			GameMaster.inform_previous_points(points)
			get_tree().change_scene_to_file("res://Scene/Screens/1p_game_over.tscn")
