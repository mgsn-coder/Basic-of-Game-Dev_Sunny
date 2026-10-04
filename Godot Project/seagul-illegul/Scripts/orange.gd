extends Area2D #area that detech entering collision


@export var speed = 100.0
@export var fruit_name = "" #edit the name without loosing inherited scene
@export var points = 0 # orange =1, pear =2, grape =3
@onready var game_manager
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _physics_process(_delta: float) -> void:
	global_position.y += speed * _delta

func _on_body_entered(_body: Node2D) -> void:
	print("+1"," ", fruit_name)
	game_manager.add_point(points)  #add different points
	game_manager.print(points) #print point of fruit
	animation_player.play("pickupAnimation")

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	#clean up off-screen objects
	queue_free()
