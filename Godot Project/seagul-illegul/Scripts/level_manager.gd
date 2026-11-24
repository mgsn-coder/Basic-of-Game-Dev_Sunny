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

func update_points():
	level_hud.update_points(points)

func _process(delta: float) -> void:
	update_points()
