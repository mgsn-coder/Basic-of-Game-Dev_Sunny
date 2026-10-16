class_name Player extends CharacterBody2D

var flying_speed := 200.0
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var respawn_timer: Timer = $Timer
@onready var gos: Control = $"../UILayer/GameOverScene"
@export var ui_timer := 0.5


func get_input():
	#Input buttons
	var input_direction = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	velocity = input_direction * flying_speed
	
	#FLip player
	if Input.is_action_pressed("move_right"):
		sprite_2d.flip_h = true
	elif Input.is_action_pressed("move_left"):
		sprite_2d.flip_h = false

func _physics_process(_delta):
	get_input()
	move_and_slide()
	
func _die():
	await get_tree().create_timer(ui_timer).timeout
	#get_tree() = access global game states and perform major actions across project
	gos.visible = true #Ui is visible when player died
	queue_free()
	#respawn_timer.start()
	#set the timer to restart


#func _on_timer_timeout() -> void: #runs when timer ends
	#get_tree().reload_current_scene()
	
