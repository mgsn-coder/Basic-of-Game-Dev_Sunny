extends Area2D #area that detech entering collision

@export var speed = 100.0
@export var fruit_name = "" #edit the name without loosing inherited scene

# Called when the node enters the scene tree for the first time.
func _physics_process(_delta: float) -> void:
	global_position.y += speed * _delta

func _on_body_entered(_body: Node2D) -> void:
	print("+1"," ", fruit_name) 
	queue_free() #remove food when touch
