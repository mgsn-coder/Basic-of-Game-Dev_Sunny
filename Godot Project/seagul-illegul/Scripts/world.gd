extends Node2D

@export var food_scenes :Array[PackedScene]= []
@export var enemy_scenes : Array[PackedScene] = []

@onready var player_spawn_pos: Marker2D = $PlayerSpawnPos
@onready var player: CharacterBody2D = $Player
@onready var food_timer: Timer = $FoodSpawnTimer
@onready var enemy_timer: Timer = $EnemySpawnTimer
@onready var food_container: Node2D = $FoodContainer
@onready var enemy_container: Node2D = $EnemyContainer

@onready var pb: ParallaxBackground = $ParallaxBackground

var scroll_speed = 50


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Player spawn at Marker2D's position regradless where it is.
	player.global_position = player_spawn_pos.global_position


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("quit"): #quit button
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"): #reset button
		get_tree().reload_current_scene()
		
	
	#make food and enemy fall faster over time
	if food_timer.wait_time > 0.5:
		food_timer.wait_time -= _delta * 0.005
		#print(timer.wait_time) for checking the decreasing timeer
	elif food_timer.wait_time < 0.5:
		food_timer.wait_time = 0.5
	
	if enemy_timer.wait_time > 0.5:
		enemy_timer.wait_time -= _delta * 0.005
		#print(timer.wait_time) for checking the decreasing timeer
	elif enemy_timer.wait_time < 0.5:
		enemy_timer.wait_time = 0.5
	
	#scrolling background
	pb.scroll_offset.y += _delta * scroll_speed #increase scrooll_offset each frame
	#prevent infinite number of bg and will crash
	if pb.scroll_offset.y >= 240:
		pb.scroll_offset.y = 0
	#print(pb.scroll_offset.y) check the number here

func _on_food_spawn_timer_timeout() -> void:
	var f = food_scenes.pick_random().instantiate() #create new food
	f.global_position = Vector2(randf_range(40,140),-10) #set position
	f.game_manager = $GameManager #connect it to GameManager
	food_container.add_child(f) #add it as a child of the scene


func _on_enemy_spawn_timer_timeout() -> void:
	var e = enemy_scenes.pick_random().instantiate()
	e.global_position = Vector2(randf_range(40,120),-10)
	e.game_manager = $GameManager
	enemy_container.add_child(e) 
	
	
