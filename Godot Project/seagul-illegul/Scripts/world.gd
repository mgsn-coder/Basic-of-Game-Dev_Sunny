extends Node2D

@export var food_scenes :Array[PackedScene]= []

@onready var player_spawn_pos: Marker2D = $PlayerSpawnPos
@onready var player: CharacterBody2D = $Player
@onready var timer: Timer = $FoodSpawnTimer
@onready var food_container: Node2D = $FoodContainer
@onready var pb: ParallaxBackground = $ParallaxBackground



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Player spawn at Marker2D's position regradless where it is.
	player.global_position = player_spawn_pos.global_position

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("quit"): #quit button
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"): #reset button
		get_tree().reload_current_scene()
		
	#make all the food fall faster overtime
	if timer.wait_time > 0.5:
		timer.wait_time -= _delta * 0.005
		#print(timer.wait_time) for checking the decreasing timeer
	elif timer.wait_time < 0.5:
		timer.wait_time = 0.5
	

func _on_food_spawn_timer_timeout() -> void:
	var f = food_scenes.pick_random().instantiate() #create new food
	f.global_position = Vector2(randf_range(20,140),-10) #set position
	f.game_manager = $GameManager #connect it to GameManager
	food_container.add_child(f) #add it as a child of the scene
