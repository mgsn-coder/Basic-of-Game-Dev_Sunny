class_name Player extends CharacterBody2D

var flying_speed := 200.0
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var respawn_timer: Timer = $Timer


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
	respawn_timer.start()

func _on_timer_timeout() -> void: #runs when timer ends
	get_tree().reload_current_scene()
