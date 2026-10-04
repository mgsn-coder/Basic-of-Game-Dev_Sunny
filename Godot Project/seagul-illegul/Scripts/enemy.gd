extends Area2D #area that detech entering collision

@export var speed = 160.0
#@export var fruit_name = "" #edit the name without loosing inherited scene
#@export var points = 0 # orange =1, pear =2, grape =3
@onready var game_manager
@onready var respawn: Timer = $Timer

# Called when the node enters the scene tree for the first time.
func _physics_process(_delta: float) -> void:
	global_position.y += speed * _delta

func _die():
	queue_free()
	print("you die")
	respawn.start()
	
func _on_body_entered(body: Node2D) -> void:
	#when player touches enemy -> player dies
	if body is Player:
		body._die()
		_die()
	
func _on_visible_on_screen_enabler_2d_screen_exited() -> void:
	#clean up off-screen objects
	queue_free()

func _on_timer_timeout() -> void: #runs when timer ends
	get_tree().reload_current_scene() #access the scene's tree and reload
