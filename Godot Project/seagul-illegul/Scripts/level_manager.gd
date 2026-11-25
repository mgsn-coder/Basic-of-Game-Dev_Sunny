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
