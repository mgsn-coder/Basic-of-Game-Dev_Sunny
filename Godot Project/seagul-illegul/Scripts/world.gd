extends Node2D

@export var food_scenes :Array[PackedScene]= []

@onready var player_spawn_pos: Marker2D = $PlayerSpawnPos
@onready var player: CharacterBody2D = $Player
@onready var timer: Timer = $FoodSpawnTimer
@onready var food_container: Node2D = $FoodContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Player spawn at Marker2D's position regradless where it is.
	player.global_position = player_spawn_pos.global_position


func _on_food_spawn_timer_timeout() -> void:
	var f = food_scenes.pick_random().instantiate() #create new food
	f.global_position = Vector2(randf_range(20,140),-10) #set position
	f.game_manager = $GameManager #connect it to GameManager
	food_container.add_child(f) #add it as a child of the scene
